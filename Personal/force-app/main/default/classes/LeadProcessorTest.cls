@isTest
private class LeadProcessorTest {

    @testSetup 
    static void setup() {
        List<Lead> leads = new List<Lead>();
         // insert 200 leads
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(Company='company' + i, lastname='Test' +i, Status ='Open - Not Contacted', leadsource='Other'));
        }
        insert leads;
    }

    static testmethod void test() {        
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp, 200);
        Test.stopTest();

        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from Lead where lastname like 'Test%' and leadsource = 'Dreamforce']);
    }
    
}