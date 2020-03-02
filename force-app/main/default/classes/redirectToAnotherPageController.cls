public class redirectToAnotherPageController {
    Public Contact contact{get;set;}
    
    public void print(){
        
        contact = new Contact();
        contact = [Select Id,AccountId From contact limit 1];
        system.debug('Account::'+contact.AccountID);
    }
}