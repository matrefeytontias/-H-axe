class ArrayExtender
{
    inline static public function clear<T>(array:Array<T>)
    {
        while(array.pop() != null);
    }
    
    static public function startsWith<T>(array:Array<T>, test:Array<T>) : Bool
    {
        if(test.length <= array.length)
        {
            for(i in 0 ... test.length)
                if(test[i] != array[i])
                    return false;
            return true;
        }
        else
            return false;
    }
    
    static public function startConstructedWith<T:EnumValue>(array:Array<T>, test:Array<String>) : Bool
    {
        if(test.length <= array.length)
        {
            for(i in 0 ... test.length)
                if(Type.enumConstructor(array[i]) != test[i])
                    return false;
            return true;
        }
        else
            return false;
    }
}
