@isTest
public class TestRestrictContactByName {

    @isTest static void TestRestrictContactByName() {
    // Create the list of sObjects to insert
        List<Contact> contList = new List<Contact>();
        contList.add(new Contact(LastName='INVALIDNAME'));
        contList.add(new Contact(LastName='TestUser'));

//      DML statement
        Database.SaveResult[] srList = Database.insert(contList, false);

//      Iterate through each returned result
        for (Database.SaveResult sr : srList) {
            if (sr.isSuccess()) {
                // Operation was successful, so get the ID of the record that was processed
                System.assert(sr.isSuccess());
            }
            else {
                // Operation failed, so get all errors  
                //System.assert(sr.getErrors().size()>0); 
                System.assert(!sr.isSuccess());                
                for(Database.Error err : sr.getErrors()) {
                  
                    System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',
                             err.getMessage());
                }
            }
        }
    }
   
}