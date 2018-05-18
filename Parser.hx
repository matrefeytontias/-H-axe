import haxe.Constraints;
import haxe.ds.GenericStack;
import haxe.io.Bytes;

import Rules;

using ArrayExtender;

class Parser<T:EnumValue, N>
{
    /**
     * Holds past parsed values.
     */
    private var parseStack = new Array<_Pair<String, N>>();
    
    public function new() { }
    
    /**
     * Applies a context-free grammar to a stream of tokens.
     */
    public function buildAST(input:Array<T>, rules:Map<String, ParsingRule<N>>, startingRule:String) : N
    {
        parseStack.clear();
        
        var nextRule = rules[startingRule];
        
        // Resolve a rule name starting at an index in the input array of tokens.
        // Returns the new index and the produced node, only valid if the rule
        // has been matched.
        function resolve(ruleName:String, index:Int = 0) : { ?index:Int, ?node:N, matched:Bool }
        {
            var ruleMatches = rules[ruleName];
            var ruleArgs = new Array<Any>();
            var node:N;
            if(ruleMatches == null)
                throw "Trying to resolve inexistent rule !";
            for(rule in ruleMatches)
            {
                var currentIndex = index;
                ruleArgs.clear();
                var ruleMatches = true;
                switch(rule)
                {
                case(Pair(tokens, fun)):
                    for(token in tokens)
                    {
                        // The rule includes an actual token
                        if(startsWithCapital(token))
                        {
                            // If it doesn't match, go to the next rule
                            if(!constructedWith(input, currentIndex, token))
                            {
                                ruleMatches = false;
                                break;
                            }
                            // If it does, fall through, get an optional token
                            // value and go to the next token
                            var params = Type.enumParameters(input[currentIndex]);
                            ruleArgs.push(params.length > 0 ? params[0] : null);
                        }
                        // the rule needs to be resolved deeper
                        else
                        {
                            var result = resolve(token, currentIndex);
                            if(!result.matched)
                            {
                                ruleMatches = false;
                                break;
                            }
                            throw 'TODO : matched with rule $ruleName';
                        }
                        currentIndex++;
                    }
                    if(ruleMatches)
                        return { index:currentIndex, node:fun(ruleArgs), matched:true };
                }
            }
            return { matched:false };
        }
        
        var r = resolve(startingRule);
        if(!r.matched)
            throw 'Could not match "${startingRule}" to anything';
        if(r.index < input.length)
            throw 'Unmatched tokens past index >= ${r.index}';
        return r.node;
    }
    
    inline private function constructedWith(input:Array<T>, index:Int, constructor:String)
    {
        return Type.enumConstructor(input[index]) == constructor;
    }
    
    inline static private function startsWithCapital(s:String)
    {
        var c = s.charCodeAt(0);
        return c > 64 && c < 65 + 26;
    }
}
