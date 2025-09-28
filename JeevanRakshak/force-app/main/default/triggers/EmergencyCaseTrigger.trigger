trigger EmergencyCaseTrigger on Emergency_Case__c (before insert) {
    // Call the handler to populate AI Suggested Action before the record is inserted
    EmergencyCaseHandler.handleNewEmergency(Trigger.new);
}