({
    init: function (cmp, event, helper) {
        cmp.set('v.columns', [
            {label: 'Account Name', fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Name' }, target: '_blank'}},
            {label: 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'currency' ,editable: true},
            {label: 'Description', fieldName: 'Description', type: 'text' ,editable: true},
            {label: 'Number Of Employees', fieldName: 'NumberOfEmployees', type: 'number' ,editable: true},
            {label: 'Industry', fieldName: 'Industry', type: 'text' ,editable: true},
            {label: 'Rating', fieldName: 'Rating', type: 'text' ,editable: true},
            {label: 'Phone', fieldName: 'Phone', type: 'phone' ,editable: true } 
        ]);
        helper.fetchData(cmp,event, helper);
        helper.getNewRecUrl(cmp, event, helper);
    },
    handleSaveEdition: function (cmp, event, helper) {
        var draftValues = event.getParam('draftValues');
        console.log(draftValues);
        var action = cmp.get("c.updateAccount");
        action.setParams({"acc" : draftValues});
        action.setCallback(this, function(response) {
            var state = response.getState();
            $A.get('e.force:refreshView').fire();
            
        });
        $A.enqueueAction(action);
        
    },
    handleRecordNew: function (cmp, event, helper) {

        $A.createComponent("c:NewAccountCreate", 
                           {"aura:id": "newAccountId"
							},
                           function(result, status) {
                               if (status === "SUCCESS") {
                                   component.find('overlayLibDemo').showCustomModal({
                                       header: "New Account",
                                       body: result, 
                                       showCloseButton: true,
                                       cssClass: "mymodal", 
                                   })
                               }                               
                           });

    },
    handleClick : function(component, event, helper) {
       // Navigate to the record create page for the Aura PageRef example
       /*
        var navService = cmp.find("navService");
        var pageRef = cmp.get("v.pageReference");
        event.preventDefault();
        navService.navigate(pageRef);
      */
        $A.createComponent("c:AccountEdit", { recordId : event.getSource().get('v.value') },
                           function(content, status) {
                               if (status === "SUCCESS") {
                                   component.find('overlayLib').showCustomModal({
                                       header: "Account Edit",
                                       body: content, 
                                       showCloseButton: true,
                                       cssClass: "mymodal",
                                       
                                   })
                                   $A.get('e.force:refreshView').fire();

                               }                               
                           });
    },
    
   closeModal: function(component, event, helper) {
      // set "isOpen" attribute to false for hide/close modal box 
      component.set("v.isOpen", false);
   },
 
   openModal: function(component, event, helper) {
      // set "isOpen" attribute to true to show modal box
      component.set("v.isOpen", true);
	  var createRecordEvent = $A.get("e.force:createRecord");
            createRecordEvent.setParams({
               "entityApiName": 'Account'
            });
            createRecordEvent.fire();       
   },
})