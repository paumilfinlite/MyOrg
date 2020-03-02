//Assignment:

//When an Account is updated and the Website is filled in, update all the Profile field on all Contacts to:

//Profile = Website + ‘/’ + First Letter of First Name + Last Name

//  -----------------------------------------------------------------------------------------------------------------------------	


trigger calledProfileTrigger on Account (after update) {
    if(Trigger.isUpdate && Trigger.isAfter){
        list<Contact> conListToUpdate = new list<Contact>();
        system.debug('Trigger new'+Trigger.new);
        for(Account acc : Trigger.new){
            if(acc.Website != null){
                system.debug('acc.Contacts'+acc.Contacts);
                for(Contact c: [SELECT id,profile__c,AccountId, FirstName,LastName FROM Contact WHERE AccountId =: acc.Id]){
                    c.profile__c= acc.Website + '/' + String.valueOf(c.FirstName).substring(0,1) + c.LastName;
                    conListToUpdate.add(c); 
                }
            }
            
        }
        update conListToUpdate;
    }
}