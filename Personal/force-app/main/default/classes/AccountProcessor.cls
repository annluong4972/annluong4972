global class AccountProcessor{
  @future
  public static void countContacts(List<Id> accountIds) {
    List<Account> accounts = [Select Id, Number_of_Contacts__c from Account Where Id IN :accountIds];
    // process account records to do awesome stuff
    for (Account a : accounts)
    {
        Integer contactCount = [select count() from Contact where accountid =: a.Id];
        a.Number_of_Contacts__c = contactCount;
    }
    update accounts;
  }
}