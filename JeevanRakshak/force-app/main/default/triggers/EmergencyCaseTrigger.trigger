trigger EmergencyCaseTrigger on Emergency_Case__c (after insert) {
    if(Trigger.isInsert) {
        EmergencyCaseHandler.handleNewEmergency(Trigger.new);
    }
}