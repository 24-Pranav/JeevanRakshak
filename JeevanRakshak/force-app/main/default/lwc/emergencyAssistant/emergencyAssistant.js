import { LightningElement, track } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import getCases from '@salesforce/apex/EmergencyCaseController.getCases';

export default class EmergencyAssistant extends NavigationMixin(LightningElement) {
    // AI Suggested Action
    @track suggestedAction = 'No action yet';

    getHelp() {
        this.suggestedAction = 'Provide immediate first aid and call ambulance';
    }

    // Emergency Cases
    @track cases;
    @track error;

    // Imperative Apex call to fetch Emergency Cases
    fetchCases() {
        getCases()
            .then(result => {
                this.cases = result;
                this.error = undefined;
            })
            .catch(error => {
                this.error = error;
                this.cases = undefined;
            });
    }

    // Navigation to Patient Record
    handleNavigateToPatient(event) {
        const patientId = event.target.dataset.patientId;
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: patientId,
                objectApiName: 'Patient__c',
                actionName: 'view'
            }
        });
    }
}