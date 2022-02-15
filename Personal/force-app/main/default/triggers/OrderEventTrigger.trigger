trigger OrderEventTrigger on Order_Event__e (after insert) {  
    // Trigger for listening to Order_Event events.
    String userName = UserInfo.getUserName();
    Id userId = [select Id from User where UserName = :userName LIMIT 1].Id;
   
    // List to hold all tasks to be created.
    List<Task> tasks = new List<Task>();
       
    // Iterate through each notification.
    for (Order_Event__e event : Trigger.New) {
        if (event.Has_Shipped__c) {
            // Create follow up task
            Task tsk = new Task();
            tsk.Priority = 'Medium';
            tsk.Status = 'New';
			tsk.Subject = 'Follow up on shipped order ' + event.Order_Number__c;
            tsk.OwnerId = userId;
            Tasks.add(tsk);
        }
   }
    
    // Insert all tasks corresponding to events received.
    insert tasks;
}