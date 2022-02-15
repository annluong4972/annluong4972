public class ContactSearch {

    public static List<Contact> searchForContacts (string lastName, string postalCode)
    {
        List<Contact> lstContacts = [Select Id, Name, FirstName, LastName from Contact where LastName =:  lastName and MailingPostalCode =: postalCode  ];
        return lstContacts;
    }
}