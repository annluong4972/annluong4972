({
	packItem : function(component, event, helper) {
		    var btnClicked = event.getSource();         // the button
			component.set("v.item.Packed__c", true);
            btnClicked.Disabled = true;
	}
})