@isTest
public class EmergencyCaseHandlerTest {
    @isTest static void testHandleEmergency() {
        // Create test patient
        Patient__c p = new Patient__c(
            Name = 'Pranav Rajput',
            Contact_Number__c = '9999999999'
        );
        insert p;

        // Create test Emergency Case with required fields
        Emergency_Case__c ec = new Emergency_Case__c(
            Patient__c = p.Id,
            Emergency_Type__c = 'Accident',
            Start_Date__c = System.now(),
            OwnerId = UserInfo.getUserId() // ensures owner is valid
        );
        insert ec;

        // Re-query record to ensure it exists
        Emergency_Case__c result = [SELECT Id, AI_Suggested_Action__c FROM Emergency_Case__c WHERE Id = :ec.Id LIMIT 1];

        System.assertEquals('Call nearest hospital and provide basic CPR', result.AI_Suggested_Action__c);

        // Verify AI Log creation
        List<AI_Log__c> logs = [SELECT Id, Emergency_Case__c, Status__c FROM AI_Log__c WHERE Emergency_Case__c = :ec.Id];
        System.assertEquals(1, logs.size());
        System.assertEquals('Created', logs[0].Status__c);
    }
}