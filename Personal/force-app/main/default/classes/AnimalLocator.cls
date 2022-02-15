public class AnimalLocator {
    public static string getAnimalNameById (integer id) {
        string Name = null;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+ id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            system.debug('results: ' + results);
			Map<String, Object> animal = (Map<String, Object>) results.get('animal');
            Name = (String) animal.get('name');
        } 
        return Name; 
    }
}