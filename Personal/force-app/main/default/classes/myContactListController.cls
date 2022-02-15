public class myContactListController {
    @AuraEnabled
	public static List<Contact> getContacts() {
    	return [select Id, Name, Email, Title, Phone from Contact];
	}
}