public class EmergencyCaseHandler {

    public static void handleNewEmergency(List<Emergency_Case__c> newCases) {
        List<AI_Log__c> logList = new List<AI_Log__c>();

        for(Emergency_Case__c ec : newCases) {
            
            // AI Suggested Action based on Emergency Type
            switch on ec.Emergency_Type__c {
                when 'Medical' {
                    ec.AI_Suggested_Action__c = 'Provide immediate first aid and call ambulance';
                }
                when 'Accident' {
                    ec.AI_Suggested_Action__c = 'Call nearest hospital and provide basic CPR';
                }
                when 'Burn' {
                    ec.AI_Suggested_Action__c = 'Cool burn with running water and call emergency services';
                }
                when 'Animal Bite' {
                    ec.AI_Suggested_Action__c = 'Clean wound and seek medical attention immediately';
                }
                when 'Health Issue' {
                    ec.AI_Suggested_Action__c = 'Monitor vitals and call doctor immediately';
                }
                when else {
                    ec.AI_Suggested_Action__c = 'Check emergency and take appropriate action';
                }
            }

            // Create AI Log
            AI_Log__c log = new AI_Log__c();
            log.Emergency_Case__c = ec.Id;
            log.Timestamp__c = System.now();
            log.Status__c = 'Created';
            log.Notification_Type__c = 'Auto Action';
            logList.add(log);
        }

        if(!logList.isEmpty()) {
            insert logList;
        }
    }
}