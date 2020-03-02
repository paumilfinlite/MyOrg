//------------------parent to child update contact----------------------------------------//


trigger parentToChildUpdate on Account (after update) {
    if(Trigger.isUpdate && Trigger.isAfter){
        set<ID> accountId = new set<ID>();
        for(Account acc : Trigger.New){
            accountId.add(acc.id);
        }
        
        list<Account> UpdatedAccountList = [SELECT id,name,Email__c,
                                                (select id,name,Email from Contacts WHERE Email_Checked__c = true) 
                                           FROM Account WHERE ID in: accountId];
        
        List<Contact> ContactUpdateList = New List<Contact>();
        for(Account acc : UpdatedAccountList){
            for(Contact con : acc.Contacts){
                con.Email = acc.Email__c;
                ContactUpdateList.add(con);
            }
        }
       Update ContactUpdateList; 
    }
}