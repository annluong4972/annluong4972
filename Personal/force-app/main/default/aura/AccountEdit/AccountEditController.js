({
    handleSubmit : function(component,event,helper) {
        component.find("editForm").submit();
    },
    handleSuccessMessage : function(component,event,helper) {
        
        component.find('popuplib').showCustomPopover({
            body: "Account Is Updated",
            referenceSelector: ".mypopover",
            cssClass: "slds-popover slds-nubbin_left"
        }).then(function (overlay) {
            setTimeout(function(){ 
                //close the popover after 3 seconds
                overlay.close(); 
            }, 3000);
        });
        
        component.find("popuplib").notifyClose();
    },
})