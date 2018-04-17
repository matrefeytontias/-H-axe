using StringTools;

enum _Pair<L, R>
{
    Pair(left:L, right:R);
}

class Lexer
{
    static public function parse<T : EnumValue>(s:String, rules:Array<_Pair<EReg, String -> T>>) : Array<T>
    {
        var r = new Array<T>();
        
        // First, replace newlines with colons
        s = s.replace(String.fromCharCode(10), ":");
        
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
    
    static public function isAlphaNum(s:String, index:Int) : Bool
    {
        var c = s.toUpperCase().charCodeAt(index);
        return (c >= 48 && c <= 57) || (c >= 65 && c <= 90);
    }
}
