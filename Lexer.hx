import haxe.Constraints;
import haxe.ds.GenericStack;
import haxe.io.Bytes;

import Rules;

using ArrayExtender;

/**
 * Builds an AST out of a stream of tokens.
 */
class Lexer<T:EnumValue, N>
{
    /**
     * Holds past parsed values.
     */
    private var parseStack = new Array<N>();
    
    public function new() { }
    
    /**
     *
     */
    public function buildAST(input:Array<T>, rules:Map<String, ParsingRule<N>>) : N
    {
        parseStack.pop();
        
        return null;
    }
}
