public class User 
{
	private String email, password, currency, language, roleName;

	public User() {
		super();
	}
	public User(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}
	public User(String email, String password, String currency, String language, String roleName) {
		super();
		this.email = email;
		this.password = password;
		this.currency = currency;
		this.language = language;
		this.roleName = roleName;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getCurrency() {
		return currency;
	}
	
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	
	public String getLanguage() {
		return language;
	}
	
	public void setLanguage(String language) {
		this.language = language;
	}
	
	public String getRoleName() {
		return roleName;
	}
	
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
}