class Main
{
    static function main()
    {
        var str =
"-1
For(256)
    Select(+1, ->{+tab})
End";
        
        trace(Lexer.parse(str, Rules.rules));
    }
}
