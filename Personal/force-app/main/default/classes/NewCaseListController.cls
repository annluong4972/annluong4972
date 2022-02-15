public class NewCaseListController {
	public List<Case> getnewCases() {
    
    	List<Case> results = Database.query(
        	'SELECT Id, CaseNumber ' +
        	'FROM Case '  
    	);
    	return results;
	}
}