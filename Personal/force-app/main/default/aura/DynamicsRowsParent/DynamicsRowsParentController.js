({
    doinit : function(component, event, helper) {
        console.log("In dynamic init");
        
        var initRec = {'sobjectType' : 'Account','Name' : '','Industry' : '' };
        component.set("v.records", initRec);
    },
    
    add : function(component, event, helper) {
        var addRec = {'sobjectType' : 'Account','Name' : '','Industry' : '' };
        var existingRecords = component.get("v.records");
        existingRecords.push(addRec);
        component.set("v.records", existingRecords);
    },
    
    remove : function(component, event, helper) {
        
        var indexPosition = event.target.name;
        var existingRecords = component.get("v.records");
        console.log("indexPosition",indexPosition);
        existingRecords.splice(indexPosition, 1);
        component.set("v.records", existingRecords);
        //splice(indexPosition, howmany, item1, ....., itemX)
    },
    
    save : function(component, event, helper) {
        
        var existingRecords = component.get("v.records");
        var validRecords = [];
        
        for(var i = 0; i < existingRecords.length; i++) {
            if(existingRecords[i].Name != "") {
                validRecords.push(existingRecords[i]);
            }
        }
        component.set("v.records", validRecords);
        component.set("v.rows", validRecords.length);
        
        
        console.log("validRecords", JSON.stringify(validRecords));
        console.log("valid Records length", validRecords.length);
        
        var action = component.get("c.saveaccs");
        action.setParams({
            'inprec' : validRecords
        });
        
        action.setCallback(this, function(response){
           var state = response.getState();
            if(state === 'SUCCESS' || state === 'DRAFT'){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    title : 'Message',
                    message: 'Records saved successfully',
                    duration:' 3000',
                    key: 'info_alt',
                    type: 'success',
                    mode: 'pester'
                });
                toastEvent.fire();
                component.set("v.visible", true);
                window.setTimeout(
                    $A.getCallback(function() {
                        component.set("v.visible", false);
                    }), 3000);
                
            }
            else if(state === 'ERROR' || state === 'WARNING'){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    title : 'Message',
                    message: 'No Records saved successfully',
                    duration:' 3000',
                    key: 'info_alt',
                    type: 'error',
                    mode: 'pester'
                });
                toastEvent.fire();
            }
        });
        $A.enqueueAction(action);
        
    }
})