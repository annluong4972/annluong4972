public class RandomContactFactory {
     public static List<Contact> generateRandomContacts(integer nbrContacts, string lastName) {
        List<Contact> contactList = new List<Contact>();
        for (integer i=0; i<nbrcontacts; i++)
        {
            Contact c = new Contact();
            c.FirstName = 'Test' + string.valueof(i+1);
            c.LastName = lastName;
            contactList.add(c);
        }
        return contactList;
    }
}