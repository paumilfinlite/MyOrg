public class timerController {
    //@AuraEnabled public static Timer__c oneTimer   {get; set;}
    
    @AuraEnabled public static void timerStart(String startDate){
      
    }
    
    @AuraEnabled public static String timerStop(String startDate,String endDate){
        Timer__c oneTimer = new Timer__c(Start_Time__c = DateTime.ValueofGmt(startDate.replace('T', ' ')),End_Time__c = DateTime.ValueofGmt(endDate.replace('T', ' ')));
        insert oneTimer;
        return oneTimer.Id;
    }
}