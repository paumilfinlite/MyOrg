trigger AddPoints on Order (after insert, before update, after update, after delete, after undelete) {
    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUndelete){
            AddPointsHelper.insertPoints(Trigger.new);
        }else if(Trigger.isUpdate && Trigger.isAfter){
            AddPointsHelper.updatePoints(Trigger.new,Trigger.oldMap);
        }else if(Trigger.isDelete){
            AddPointsHelper.deletePoints(Trigger.old);
        }
    }
}