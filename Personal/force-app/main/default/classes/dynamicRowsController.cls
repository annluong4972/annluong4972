public with sharing class dynamicRowsController {
    
    @AuraEnabled
    public static void saveaccs(List<Account> inprec){
        if(inprec.size()>0 && inprec != null){
            list<Account> inputrec =  inprec;
            insert inputrec;
        }
    }
    
}