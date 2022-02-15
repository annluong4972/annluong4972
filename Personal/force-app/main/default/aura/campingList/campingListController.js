(   
    {
        doInit : function(component, event, helper) {
            var action = component.get("c.getItems");
            $A.enqueueAction(action);
            var state = action.response.getState();
            if (state == SUCCESS) {
                componet.set("v.items", action.response.getReturnValue());
            }
        },
		clickCreateItem : function(component, event, helper) {
            var validItem = component.find('campingitemform').reduce(function (validSoFar, inputCmp) {
                // Displays error messages for invalid fields
                inputCmp.showHelpMessageIfInvalid();
                return validSoFar && inputCmp.get('v.validity').valid;
            }, true);
            // If we pass error checking, do some real work
            if(validItem){
                // Create the new item
                var newItem = component.get("v.newItem");
                console.log("Create item: " + JSON.stringify(newItem));
                Helper.createItem(component, newItem);
                var theItems = component.get("v.items");
                theItems.push(newItem);
                component.set("v.items",theItems);
                //	reset the new item to blank
                 component.set("v.newItem",{'sobjectType':'Camping_Item__c',
                    'Name': '',
                    'Quantity__c': 0,
                    'Price__c': 0,
                    'Packed__c': false});

        }
	}
})