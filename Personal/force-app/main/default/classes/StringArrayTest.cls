public class StringArrayTest  {
    List<String>lstResult = generateStringArray(5);       
    
    static public List<String> generateStringArray(Integer listSize)	
    {
        List<String>lstItems = new List<String>();
        for (Integer i=0; i < listSize; i++)
        {
            lstItems.add('Test ' + i);
        }
//        System.debug(lstItems);
        return lstItems;
    }
}