@IsTest
private class AccountProcessorTest {
    @testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();
        List<Contact> contacts = new List<Contact>();
        // insert account
        accounts.add(new Account(name='Test Account', 
                billingcity='New York', billingcountry='USA'));
        insert accounts;
        // find the account just inserted. add contact for each
        for (Account account : [select id from account where name = 'Test Account']) {
            contacts.add(new Contact(firstname='first1', 
                lastname='last1', accountId=account.id));
            contacts.add(new Contact(firstname='first2', 
                lastname='last2', accountId=account.id));
                
        }
        insert contacts;
    }

  @IsTest
  private static void test() {
    Test.startTest();
    List<account> accounts = [select id from account where name = 'Test Account'];
    List<Id> accountIds = new List<Id>();
    for (account a : accounts) {
        accountIds.add(a.Id);
    }
    AccountProcessor.countContacts(accountIds);
    Test.stopTest();
    // runs callout and check results
    System.assertEquals(2, [select count() from Contact where accountid = :accountIds]);    
  }

}