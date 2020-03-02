trigger OrderEventTrigger on Order_Event__e (after insert) {
    List<task> tasks = new List<task>();
    Group queue = [SELECT Id FROM Group WHERE Name='Regional Dispatch' AND Type='Queue'];
    for (Order_Event__e event : Trigger.New) {
        if (event.Has_Shipped__c == true) {
            task ts = new task();
            ts.Priority = 'Medium';
            ts.Subject = 'Follow up on shipped order' + event.Order_Number__c;
            ts.OwnerId = event.CreatedById;
            tasks.add(ts);
        }
   }
    
    insert tasks;

}