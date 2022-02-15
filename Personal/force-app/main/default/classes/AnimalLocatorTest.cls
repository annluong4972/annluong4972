@isTest
private class AnimalLocatorTest {
    @isTest static  void testGetCallout() {
        // Create the mock response based on a static resource
        //StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        //mock.setStaticResource('GetAnimalResource');
        //mock.setStatusCode(200);
        //mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Associate the callout with a mock response
        // Call method to test
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String result = AnimalLocator.getAnimalNameById(1);
         // Verify result   
        System.assertEquals('chicken', result);
    }   
}