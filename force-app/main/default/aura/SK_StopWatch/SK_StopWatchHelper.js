({
    waitingTimeId: null,
    startDate: null,
	setStartTimeOnUI : function(component) {
        component.set("v.ltngIsDisplayed",true);
        var currTime =component.get("v.ltngCurrTime");
        var ss = currTime.split(":");
        var dt = new Date();
        dt.setHours(ss[0]);
        dt.setMinutes(ss[1]);
        dt.setSeconds(ss[2]);
        
        var dt2 = new Date(dt.valueOf() + 1000);
        var temp = dt2.toTimeString().split(" ");
        var ts = temp[0].split(":");
        if(this.startDate == null){
            this.startDate = dt2.toISOString();
            
        }
        component.set("v.ltngCurrTime",ts[0] + ":" + ts[1] + ":" + ts[2]);
        this.waitingTimeId =setTimeout($A.getCallback(() => this.setStartTimeOnUI(component)), 1000);
        
    },
    
    setStopTimeOnUI : function(component) {
        component.set("v.ltngIsDisplayed",false);
        var startDateVar = new Date(this.startDate);
        var currTime =component.get("v.ltngCurrTime");
        var endTime = currTime.split(":");
        startDateVar.setHours(endTime[0]);
        startDateVar.setMinutes(endTime[1]);
        startDateVar.setSeconds(endTime[2]);
        var endDate = new Date(startDateVar.valueOf() + 1000);
        var action = component.get('c.timerStop'); 
        // method name i.e. getEntity should be same as defined in apex class
        // params name i.e. entityType should be same as defined in getEntity method
        action.setParams({
            "startDate" : this.startDate,
            "endDate"   : endDate.toISOString()
        });
        
        action.setCallback(this, function(a){
            var state = a.getState(); // get the response state
            if(state == 'SUCCESS') {
                //component.set('v.sObjList', a.getReturnValue());
            }
        });
        $A.enqueueAction(action);            
        window.clearTimeout(this.waitingTimeId);
    },
    setResetTimeOnUI : function(component) {
        component.set("v.ltngIsDisplayed",false);
        component.set("v.ltngCurrTime","00:00:00");
        window.clearTimeout(this.waitingTimeId);
    }
})