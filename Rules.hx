import Lexer;

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
    TIdent(name:String);
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
    TLSquareBracket;
    TRSquareBracket;
    TLBracket;
    TRBracket;
    ///
    /// Misc
    ///
    TColon;
    TLPar;
    TRPar;
}

class Rules
{
    static public var rules = [
        Pair(~/If/, (s:String) -> return TIf),
        Pair(~/Else/, (s:String) -> return TElse),
        Pair(~/End/, (s:String) -> return TEnd),
        Pair(~/While/, (s:String) -> return TWhile),
        Pair(~/Repeat/, (s:String) -> return TRepeat),
        Pair(~/For/, (s:String) -> return TFor),
        Pair(~/Dsnz/, (s:String) -> return TDSNZ),
        Pair(~/Lbl/, (s:String) -> return TLbl),
        Pair(~/Goto/, (s:String) -> return TGoto),
        Pair(~/Return/, (s:String) -> return TReturn),
        Pair(~/_/, (s:String) -> return TL),
        Pair(~/[a-zA-Z][_a-zA-Z0-9]*/, (s:String) -> return TIdent(s)),
        Pair(~/0|[1-9][0-9]*/, (s:String) -> return TIntConst(Std.parseInt(s))),
        Pair(~/°/, (s:String) -> return TDegree),
        Pair(~/->/, (s:String) -> return TArrow),
        Pair(~/'.'/, (s:String) -> return TIntConst(s.charCodeAt(1))),
        Pair(~/\+/, (s:String) -> return TPlus),
        Pair(~/-/, (s:String) -> return TMinus),
        Pair(~/\*/, (s:String) -> return TTimes),
        Pair(~/²/, (s:String) -> return TSquared),
        Pair(~/%/, (s:String) -> return TModulo),
        Pair(~/\//, (s:String) -> return TUDivide),
        Pair(~/=/, (s:String) -> return TEqual),
        Pair(~/!=/, (s:String) -> return TNotEqual),
        Pair(~/>/, (s:String) -> return TUgt),
        Pair(~/>=/, (s:String) -> return TUge),
        Pair(~/</, (s:String) -> return TUlt),
        Pair(~/<=/, (s:String) -> return TUle),
        Pair(~/&/, (s:String) -> return TBwAnd),
        Pair(~/\|/, (s:String) -> return TBwOr),
        Pair(~/\^/, (s:String) -> return TBwXor),
        Pair(~/\?/, (s:String) -> return TQuestion),
        Pair(~/!/, (s:String) -> return TNot),
        Pair(~/,/, (s:String) -> return TComma),
        Pair(~/>>/, (s:String) -> return TSgt),
        Pair(~/>=>=/, (s:String) -> return TSge),
        Pair(~/<</, (s:String) -> return TSlt),
        Pair(~/<=<=/, (s:String) -> return TSle),
        Pair(~/\*\^/, (s:String) -> return THOMult),
        Pair(~/\/\//, (s:String) -> return TSDivide),
        Pair(~/#/, (s:String) -> return TNBit),
        Pair(~/"[^"]*"/, (s:String) -> return TStringConst(s.substr(1, s.length - 2))),
        Pair(~/\[/, (s:String) -> return TLSquareBracket),
        Pair(~/\]/, (s:String) -> return TRSquareBracket),
        Pair(~/{/, (s:String) -> return TLBracket),
        Pair(~/}/, (s:String) -> return TRBracket),
        Pair(~/:/, (s:String) -> return TColon),
        Pair(~/\(/, (s:String) -> return TLPar),
        Pair(~/\)/, (s:String) -> return TRPar)
    ];
}
