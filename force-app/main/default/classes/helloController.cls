public with sharing class helloController {
    public final Account account {get; set;}
    public helloController() {
    account = [select name from Account where id=:ApexPages.currentPage().getParameters().get('id')];
    }
    public PageReference submit() {
    update account;
    return null;
    }
   }