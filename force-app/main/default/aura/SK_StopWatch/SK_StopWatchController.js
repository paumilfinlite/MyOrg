({
    doInit : function(component, event, helper) {
		console.log("diinit get called!!");
	},
    handleStartClick : function(component, event, helper) {
		console.log("start button clicked!!");
        helper.setStartTimeOnUI(component);
	},
    handleStopClick : function(component, event, helper) {
		console.log("stop button clicked!!");
        helper.setStopTimeOnUI(component);
	},
    handleResetClick : function(component, event, helper) {
		console.log("Reset button clicked!!");
        helper.setResetTimeOnUI(component);
	}   
})