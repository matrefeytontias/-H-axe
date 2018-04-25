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
    private var parseStack = new Array<N>();
    
    public function new() { }
    
    /**
    * Applies a context-free grammar to a stream of tokens.
     */
    public function buildAST(input:Array<T>, rules:Map<String, ParsingRule<N>>, startingRule:String) : N
    {
        parseStack.clear();
        
        return null;
    }
}
