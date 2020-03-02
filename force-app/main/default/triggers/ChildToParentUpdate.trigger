//==================================================================================================================================
//------------------Using List--------------------------------------------------------------------------------------------------

trigger ChildToParentUpdate on Contact (after update) {
    List<Account> accList = new List<Account>();
    for(Contact con : Trigger.new){
        if (Trigger.oldMap.get(con.Id).Phone != con.Phone) {
            Account acc = new Account();
            acc.Id = con.AccountId;
            acc.Phone = con.Phone;
            accList.add(acc);
        }
    }
    update accList;
    
}

//==================================================================================================================================
//------------------Using Map--------------------------------------------------------------------------------------------------
//
//
//trigger ChildToParentUpdate on Contact (after update) {
    //Map<Id, Account> accMap = new Map<Id, Account>();
    //for(Contact con : Trigger.new){
        //if (Trigger.oldMap.get(con.Id).Email != con.Email) {
            ////accMap.put(con.AccountId, new Account(Id = con.AccountId,Email__c = con.Email));
            //Account acc = new Account();
           // acc.Id = con.AccountId;
            //acc.Email__c = con.Email;
            //accMap.put(con.AccountId,acc);
       // }
    //}
   // update accMap.values();
    
//}