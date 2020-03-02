trigger OpportunityGreaterthan20k on Account (after insert) {
    if(Trigger.isInsert && Trigger.isAfter){
        List<Opportunity>  oppList = new List<Opportunity>();
        	//for(Opportunity opp : Trigger.new){
            
        	}        
        
    }

//}