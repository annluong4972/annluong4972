public class animal{
	public Integer id;	//1
	public String name;	//chicken
	public String eats;	//chicken food
	public String says;	//cluck cluck
	public animal parse(String json){
		return (animal) System.JSON.deserialize(json, animal.class);
	}
}