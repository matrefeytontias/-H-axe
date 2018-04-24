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
            trace(Parser.parse(args[0] == "-" ? Sys.stdin().readAll().toString() : sys.io.File.getContent(args[0]), Rules.rules));
        }
    }
}
