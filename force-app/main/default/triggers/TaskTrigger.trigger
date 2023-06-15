trigger TaskTrigger on Task (before insert,after update) {
    
    if(Trigger.isAfter && Trigger.isUpdate){
        TaskTriggerHandler.updateAccountWhenTaskCompleted(trigger.new,trigger.oldMap);
    }
}