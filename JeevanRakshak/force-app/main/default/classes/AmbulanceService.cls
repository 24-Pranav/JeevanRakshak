public with sharing class AmbulanceService {
    @future(callout=true)
    public static void callAmbulance(String patientName, String location) {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Ambulance_API/book'); // Uses Remote Site Setting
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setBody('{"patientName": "' + patientName + '", "location": "' + location + '"}');
        
        HttpResponse res = http.send(req);
        System.debug('Ambulance API Response: ' + res.getBody());
    }
}