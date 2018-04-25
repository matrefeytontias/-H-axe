import Rules;

class Main
{
    static function main()
    {
        var args = Sys.args();
        if(args.length != 1)
        {
            Sys.println("(H)axe Axe interpreter");
            Sys.println("Version 0.0.1\n");
            Sys.println("Usage : (H)axe <file>");
        }
        else
        {
            var tokens = Parser.parse(args[0] == "-" ? Sys.stdin().readAll().toString() : sys.io.File.getContent(args[0]), Rules.rules);
            trace(tokens);
            var lexer = new Lexer<Tokens, Node>();
            var ast = lexer.buildAST(tokens, Grammar.rules, Grammar.startingRule);
            trace(ast);
        }
    }
}
