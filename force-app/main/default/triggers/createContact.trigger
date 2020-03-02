trigger createContact on Account (after update) {
    if(Trigger.isUpdate && Trigger.isAfter){
        List<Contact> con = new List <Contact>();

        for(Account acc : trigger.new){
            Contact ct = new Contact();
            ct.FirstName = 'Bhavin';
            ct.LastName = 'Patel';
            ct.AccountId = acc.id;
            con.add(ct);       
        }
        
        
    }
    

}