public with sharing class oppHelper {
    public static void updateField(List<Opportunity> oppList){
        for(Opportunity  op : oppList){
            if(op.Type == 'Existing Customer - Downgrade'){
                op.StageName = 'Negotiation/Review';
            }
        }
    }

}