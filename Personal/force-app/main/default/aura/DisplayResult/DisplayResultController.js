({
	getValueFromApplicationEvent : function(component, event, helper) {
		var ShowResultValue = event.getParam("Show_Result");
        component.set("v.Get_Result", ShowResultValue);
	}
})