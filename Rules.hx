enum _Pair<L, R>
{
    Pair(left:L, right:R);
}

/**
 * Tokens of the Axe language.
 */
enum Tokens
{
    ///
    /// Control blocks
    ///
    TIf;
    TElse;
    TEnd;
    TWhile;
    TRepeat;
    TFor;
    TDSNZ;
    ///
    /// Labels and subroutines
    ///
    TLbl;
    TGoto;
    TReturn;
    TL; // address of label
    ///
    /// Variables
    ///
    TIdent(val:String);
    TIntConst(val:Int);
    TDegree;
    TArrow;
    ///
    /// Math
    ///
    TPlus;
    TMinus;
    TTimes;
    TSquared;
    TModulo;
    TUDivide; // unsigned divide
    TEqual;
    TNotEqual;
    TUgt; // unsigned greater than
    TUge; // unsigned greater or equal
    TUlt; // unsigned lesser than
    TUle; // unsigned lesser or equal
    TBwAnd; // bitwise and
    TBwOr; // bitwise or
    TBwXor; // bitwise xor
    TQuestion; // question mark
    TNot; // logical not
    TComma;
    ///
    /// Advanced math
    ///
    TSgt; // signed greater than
    TSge; // signed greater or equal
    TSlt; // signed lesser than
    TSle; // signed lesser or equal
    THOMult; // high-order multiplication
    TSDivide; // signed divide
    TNBit; // bit extraction operator
    ///
    /// Data and storage
    ///
    TStringConst(val:String);
    THexData(val:String);
    TLBracket;
    TRBracket;
    ///
    /// Misc
    ///
    TDot;
    TColon;
    TLPar;
    TRPar;
}

/**
 * Parsing rules of the Axe language.
 */
class Rules
{
    static public var rules = [
        Pair(~/If\b/, (s:String) -> TIf),
        Pair(~/Else\b/, (s:String) -> TElse),
        Pair(~/End\b/, (s:String) -> TEnd),
        Pair(~/While\b/, (s:String) -> TWhile),
        Pair(~/Repeat\b/, (s:String) -> TRepeat),
        Pair(~/For\b/, (s:String) -> TFor),
        Pair(~/Dsnz\b/, (s:String) -> TDSNZ),
        Pair(~/Lbl\b/, (s:String) -> TLbl),
        Pair(~/Goto\b/, (s:String) -> TGoto),
        Pair(~/Return\b/, (s:String) -> TReturn),
        Pair(~/_/, (s:String) -> TL),
        Pair(~/[a-zA-Z][_a-zA-Z0-9]*/, (s:String) -> TIdent(s)),
        Pair(~/0|[1-9][0-9]*/, (s:String) -> TIntConst(Std.parseInt(s))),
        Pair(~/°/, (s:String) -> TDegree),
        Pair(~/->/, (s:String) -> TArrow),
        Pair(~/'.'/, (s:String) -> TIntConst(s.charCodeAt(1))),
        Pair(~/\+/, (s:String) -> TPlus),
        Pair(~/-/, (s:String) -> TMinus),
        Pair(~/\*/, (s:String) -> TTimes),
        Pair(~/²/, (s:String) -> TSquared),
        Pair(~/%/, (s:String) -> TModulo),
        Pair(~/\//, (s:String) -> TUDivide),
        Pair(~/=/, (s:String) -> TEqual),
        Pair(~/!=/, (s:String) -> TNotEqual),
        Pair(~/>/, (s:String) -> TUgt),
        Pair(~/>=/, (s:String) -> TUge),
        Pair(~/</, (s:String) -> TUlt),
        Pair(~/<=/, (s:String) -> TUle),
        Pair(~/&/, (s:String) -> TBwAnd),
        Pair(~/\|/, (s:String) -> TBwOr),
        Pair(~/\^/, (s:String) -> TBwXor),
        Pair(~/\?/, (s:String) -> TQuestion),
        Pair(~/!/, (s:String) -> TNot),
        Pair(~/,/, (s:String) -> TComma),
        Pair(~/>>/, (s:String) -> TSgt),
        Pair(~/>>=/, (s:String) -> TSge),
        Pair(~/<</, (s:String) -> TSlt),
        Pair(~/<<=/, (s:String) -> TSle),
        Pair(~/\*\^/, (s:String) -> THOMult),
        Pair(~/\/\//, (s:String) -> TSDivide),
        Pair(~/#/, (s:String) -> TNBit),
        Pair(~/"[^"]*"/, (s:String) -> TStringConst(s.substr(1, s.length - 2))),
        Pair(~/\[[0-9a-fA-F]*\]/, (s:String) -> THexData(s.substr(1, s.length - 2))),
        Pair(~/{/, (s:String) -> TLBracket),
        Pair(~/}/, (s:String) -> TRBracket),
        Pair(~/\./, (s:String) -> TDot),
        Pair(~/:/, (s:String) -> TColon),
        Pair(~/\(/, (s:String) -> TLPar),
        Pair(~/\)/, (s:String) -> TRPar)
    ];
}

/**
 * Nodes of the Axe AST tree.
 * TODO
 */
enum Node
{
    NIntConst(val:Int);
    NBinOp(lhs:Node, op:BinOp, rhs:Node);
}

enum BinOp
{
    BOPlus;
    BOMinus;
    BOMult;
    BODiv;
}

/**
 * Typedef for a rule that produces objects of type T in a context-free grammar.
 */
typedef ParsingRule<T> = Array<_Pair<Array<String>, Array<Any> -> T>>;

/**
 * Rules of the Axe grammar.
 * TODO
 */
class Grammar
{
    static public var startingRule = "line";
    static public var rules:Map<String, ParsingRule<Node>> = [
        "line" => [
            Pair(["TColon"], (a:Array<Any>) -> null),
            Pair(["expr", "TColon"], (a:Array<Any>) -> a[0])
        ],
        "expr" => [
            Pair(["TIntConst"], (a:Array<Any>) -> NIntConst(a[0])),
            Pair(["expr", "TPlus", "expr"], (a:Array<Any>) -> NBinOp(a[0], BOPlus, a[2])),
            Pair(["expr", "TMinus", "expr"], (a:Array<Any>) -> NBinOp(a[0], BOMinus, a[2])),
        ]
    ];
}
