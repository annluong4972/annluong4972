public class DataTableMassUpdateClass {
    @AuraEnabled
    public static List<Account> getAllAccounts(){
        return [Select Id,Name ,AnnualRevenue,Description,NumberOfEmployees,Industry,Rating,Phone from Account order by Name limit 50] ; 
        
    }
    @AuraEnabled
    public static void updateAccount(List<Account> acc ){
        update acc;
    }
    
}