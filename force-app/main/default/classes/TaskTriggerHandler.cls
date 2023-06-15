/**
 * @description: This class is handler class for Task trigger
 */
public class TaskTriggerHandler {

    /**
     * @description: update Account Active checkbox to true when its Task is completed.
     */
    public static void updateAccountWhenTaskCompleted(List<Task>taskList,Map<Id,Task> oldTasksMap){
        
        List<Account> accountListToUpdate = new List<Account>(); 
        
        for(Task taskItem : taskList){
            if(taskItem.Status == 'Completed' && oldTasksMap.get(taskItem.Id).Status != taskItem.Status){
                Account taskAccount = new Account();
                taskAccount.Id = taskItem.WhatId;
                taskAccount.Description = taskItem.Description;
                taskAccount.Active__c = true;
                accountListToUpdate.add(taskAccount);
            }
        }
        if(accountListToUpdate.size() > 0){
            if (Schema.sObjectType.Account.fields.Active__c.isAccessible() && Schema.sObjectType.Account.fields.Active__c.isUpdateable()){
                update accountListToUpdate;
            }
        }
    }
}