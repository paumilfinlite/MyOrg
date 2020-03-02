trigger createOpportunity on Account (after insert) {
    List<Opportunity> opportunityList = new List<Opportunity>();
        for(Account acc : Trigger.New){
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name;
            opp.CloseDate = System.today() + 30;
            opp.AccountId  = acc.Id;
            opp.StageName = 'Closed Won';
            
            opportunityList.add(opp);
        }
   
        insert opportunityList;
    

}