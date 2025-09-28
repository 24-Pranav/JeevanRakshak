public class EmergencyCaseHandler {

    // Method to handle new Emergency Case records
    public static void handleNewEmergency(List<Emergency_Case__c> newCases){
        for(Emergency_Case__c ec : newCases){
            // Set AI Suggested Action
            ec.AI_Suggested_Action__c = 'Provide immediate first aid and call ambulance';
            
            // Optional: You can add other default values if needed
            // ec.Status__c = 'Open';
            // ec.Priority__c = 'High';
        }
    }
}