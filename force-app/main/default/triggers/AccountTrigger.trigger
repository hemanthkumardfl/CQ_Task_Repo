trigger AccountTrigger on Account (before insert,after insert,after update) {
    
    if(Trigger.isAfter && Trigger.isInsert){
        AccountTriggerHandler.createTaskWhenAccountIsAdded(Trigger.new);
    }else if(Trigger.isAfter && Trigger.isUpdate){
        AccountTriggerHandler.updateTaskWhenAccountIsActivated(Trigger.new,trigger.oldMap);
    }
    

}