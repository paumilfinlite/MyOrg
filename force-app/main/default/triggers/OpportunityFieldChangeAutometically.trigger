// when we select Type = 'Existing Customer - Downgrade' autometicallly StageName = 'Negotiation/Review'

trigger OpportunityFieldChangeAutometically on Opportunity (before insert, before update) {
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            oppHelper.updateField(Trigger.new);
    	}
    }
}