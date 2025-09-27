public with sharing class EmergencyCaseController {
    @AuraEnabled(cacheable=true)
    public static List<Emergency_Case__c> getCases() {
        return [SELECT Id, Patient__c, Emergency_Type__c, AI_Suggested_Action__c FROM Emergency_Case__c LIMIT 10];
    }
}