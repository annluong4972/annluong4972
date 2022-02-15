@isTest
private class TestVerifyDate {
    
    @isTest static void testWithin30Days()
    { 
        Date retDate = VerifyDate.CheckDates(date.parse('01/01/2015'), date.parse('01/15/2015'));
        System.assertEquals(retDate, date.parse('01/15/2015'));
    }
	@isTest static void testNotWithin30Days()
    { 
        Date retDate = VerifyDate.CheckDates(date.parse('01/01/2015'), date.parse('02/05/2015'));
        System.assertEquals(retDate, date.parse('01/31/2015'));
    }	
}