import Rules;

using Lambda;
using StringTools;

class Lexer
{
    /**
     * Separates a string into tokens as dictated by a set of rules. The order
     * that the rules are defined in matters as they will be tested from top to
     * bottom !
     */
    static public function parse<T : EnumValue>(s:String, rules:Array<_Pair<EReg, String -> T>>) : Array<T>
    {
        var r = new Array<T>();
        
        // First, add colons to newlines and get rid of \r's
        s = s.replace("\n", "\n:")
             .replace(String.fromCharCode(13), "");
        
        // Then, get rid of comments
        var lines = s.split("\n:");
        s = lines.filter((s:String) -> s.charAt(0) != ".").join(":");
        
        while((s = s.ltrim()) != "")
        {
            var matched = false;
            for(rule in rules)
            {
                switch(rule)
                {
                case Pair(reg, fun):
                    if(reg.match(s) && reg.matchedPos().pos == 0)
                    {
                        r.push(fun(reg.matched(0)));
                        s = reg.matchedRight();
                        matched = true;
                        break;
                    }
                }
            }
            if(!matched)
                throw "Could not parse : '" + s + "'";
        }
        
        return r;
    }
    
    /**
     * Returns whether a given character in a string is alpha-numeric or not.
     */
    static public function isAlphaNum(s:String, index:Int) : Bool
    {
        var c = s.toUpperCase().charCodeAt(index);
        return (c >= 48 && c <= 57) || (c >= 65 && c <= 90);
    }
}
