public class AccountHandler {
    
	public static Account insertNewAccount (string accountName)
    {
        Account newAccount = new Account(Name=accountName, Phone='805-555-1212', NumberofEmployees=10);
        try
        {
            insert newAccount;
        }
           
        catch (DMLException e)
        {
            newAccount= null;
        }
        return newAccount;
    }
        
}