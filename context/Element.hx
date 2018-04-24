package context;

/**
 * Base class for symbols in the Axe context.
 */
class Symbol
{
    /**
     * When applicable, holds the address of the symbol as an int.
     */
    public var address(default, null):Int;
    /**
     * Name of the symbol as a string.
     */
    public var name(default, null):String;
    /**
     * Size in bytes of the symbol.
     */
    public var size(default, null):Int;
    /**
     * When applicable, location of the definition of the
     * symbol. This is an offset into a stream of tokens.
     */
    public var location(default, null):Null<Int>;
    
    public function new(addr:Int, name:String, location:Null<Int>)
    {
        address = addr;
        this.name = name;
        size = 0;
        this.location = location;
    }
}
