trigger CountryHigh on Account (before insert, before update) {
    for(Account acc : Trigger.new){
        if(acc.BillingCountry == 'India'){
            acc.CustomerPriority__c = 'High';
        }
    }
}