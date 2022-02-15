public class ContactAndLeadSearch {
	public static List<List<sObject>> searchContactsAndLeads(string searchString)
    {
        List<List<sObject>> searchList = [FIND :searchString IN ALL FIELDS 
                   RETURNING Lead(FirstName, LastName),Contact(FirstName,LastName)];
        
        Lead [] searchLeads = (Lead[])searchList[0];
		Contact[] searchContacts = (Contact[])searchList[1];

		System.debug('Found the following leads.');
		for (Lead l : searchLeads) {
    		System.debug(l.LastName + ', ' + l.FirstName);
		}

		System.debug('Found the following contacts.');
		for (Contact c : searchContacts) {
    		System.debug(c.LastName + ', ' + c.FirstName);
 
    	}
        return searchList;
    }
}