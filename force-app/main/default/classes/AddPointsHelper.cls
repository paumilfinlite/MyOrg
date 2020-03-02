public with sharing class AddPointsHelper {
    public static void insertPoints(List<Order> orderList){
        Set<Id> accountIds = new Set<Id>();
        Map<Id,Decimal> totalPointMap = new Map<Id,Decimal>();
        for(Order ord : orderList){
            system.debug(' '+ord);
            if(ord.Account != null){
                system.debug('ord1::'+ord);
                system.debug('ord.Account::'+ord.Account);
                accountIds.add(ord.AccountId);
                system.debug('ord1::'+ord);
                Decimal addPoint = (ord.Add_Point__c != null) ? ord.Add_Point__c : 0.00;
                system.debug('ord.AccountId::'+ord.AccountId);
                if(!totalPointMap.containsKey(ord.AccountId)){
                    totalPointMap.put(ord.AccountId, addPoint);
                }else{
                    Decimal oldPoint = totalPointMap.get(ord.AccountId);
                    system.debug('oldPoint::'+oldPoint);
                    totalPointMap.put(ord.AccountId, (oldPoint + addPoint));
                }
            }
        }
         if(!accountIds.isEmpty()){
            AddPointsHelper.updateAddPoint(accountIds,totalPointMap);
        }
    }
    public static void updatePoints(List<Order> orderList,Map<Id,Order> orderMap){
        
    }
    public static void deletePoints(List<Order> orderList){
        
    }
    public static void updateAddPoint(Set<Id> accountIds,Map<Id,Decimal> totalPointMap){
        Map<Id,Account> accountMap = new Map<Id, Account>([SELECT Id,Name,Points_Received__c FROM Account WHERE Id IN: accountIds]);
        List<Account> updateAccounts = new List<Account>();
        for(Id oneAccountId : accountMap.keySet()){
            system.debug('oneAccountId::'+oneAccountId);
            Account oneAccount = accountMap.get(oneAccountId);
            system.debug('oneAccount::'+oneAccount);
            if(totalPointMap.containsKey(oneAccountId)){
                oneAccount.Points_Received__c = (accountMap.get(oneAccountId).Points_Received__c) != null ? (accountMap.get(oneAccountId).Points_Received__c + totalPointMap.get(oneAccountId)) : 0 + totalPointMap.get(oneAccountId);
                system.debug('Points_Received__c::'+oneAccount.Points_Received__c);
            }
            updateAccounts.add(oneAccount);
        }
        if(!updateAccounts.isEmpty()){
            List<Database.SaveResult> accountResults = Database.update(updateAccounts,false);
        }
    }
}