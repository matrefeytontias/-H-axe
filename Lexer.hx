import haxe.io.Bytes;

import Rules;
import context.*;

/**
 * Axe being a naturally sequential language, it is easier to interpret it as an
 * array of tokens rather than an AST. The present implementation uses a finite-
 * state machine to execute its task.
 */
class Lexer
{
    /**
     * Representation of memory as an array of unsigned bytes.
     */
    private var memory:Bytes;
    /**
     * Current context. Holds elements, eg variables and functions.
     */
    private var context:Map<String, Element> = new Map();
    
    /**
     * Accumulation register 1.
     */
    private var hl:Int;
    /**
     * Accumulation register 2.
     */
    private var de:Int;
    
    static public function execute(input:Array<Tokens>)
    {
        
    }
}
