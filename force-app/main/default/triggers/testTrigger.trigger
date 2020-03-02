trigger testTrigger on Opportunity (before insert, before update ) {
    
    if(Trigger.isInsert && Trigger.isBefore){
        for(Opportunity opp : Trigger.new){
            opp.StageName = 'closed won';
        }
        System.debug('after insert call'+Trigger.new);
    }else if(Trigger.isUpdate && Trigger.isBefore){
        System.debug('after update call'+Trigger.new);
    }

}