public class RandomContactFactory {
    public static list<Contact> generateRandomContacts(integer numofContacts, string LastNameGen){
        List<Contact > con = new List<Contact >();
    for(integer i = 0; i < numofContacts; i++ ){
        LastNameGen = 'Test 1' + 1;
        Contact  a = new Contact(FirstName = LastNameGen,LastName = LastNameGen );
        con.add(a);
        
    }
        return con;
                
    }
}