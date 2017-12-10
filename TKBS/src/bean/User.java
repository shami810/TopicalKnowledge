package bean;

public class User {

	private String fname;
	private String lname;
	private String email;
	private String username;
	private String password;
	private String secQues;
	private String secAns;
	private String status;
	private String uniquePassword;
	private String type;
	private Integer userId;
	private Integer active;
	
	
	public String getFname() {
		return fname;
	}
	public void setfname(String fname) {
		this.fname = fname;
	}
	

	public String getLname() {
		return lname;
	}
	public void setlname(String lname) {
		this.lname = lname;
	}
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getUnPassword() {
		return uniquePassword;
	}
	public void setUnPassword(String unique) {
		this.uniquePassword = unique;
	}
	public String secQues() 
	{
		return secQues;
	}
	public void setsecQues(String secQues) {
		this.secQues = secQues;
	}
	
	public String secAns() 
	{
		return secAns;
	}
	public void setsecAns(String secAns) {
		this.secAns = secAns;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	public Integer getActive() {
		return active;
	}
	public void setActive(Integer active) {
		this.active = active;
	}	
	
}
