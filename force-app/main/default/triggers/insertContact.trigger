//-----------------------when create new account that time contact autometicaly-------------------------------------------------	 

trigger insertContact on Account (after insert) {
	List<Contact> conList = new List<Contact>();
        for(Account acc : Trigger.New){
            for(integer i = 1; i <= acc.Number_Of_Employee__c; i++){
                Contact con = new Contact();
                con.AccountId  = acc.Id;
                con.LastName = acc.Name + ' '+i;
                conList.add(con);
            }
            
        }
    insert conList;
}