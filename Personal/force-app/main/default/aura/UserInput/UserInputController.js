({
	Add : function(component, event, helper) {
		var get_num1 = component.find("Input1").get("v.value");
        var get_num2 = component.find("Input2").get("v.value");
        var res = parseInt(num1) + parseInt(num2);
        var evt = $A.get("event.c:Result");
        evt.setParams({"Pass_Result" : res});
        evt.fire();
	}
})