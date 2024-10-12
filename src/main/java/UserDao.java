import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class UserDao {
	private String dburl = "jdbc:mysql://localhost:3306/team6";
	private String dbuname = "root";
	private String dbpassword = "Turtle$$678:)";
	private String dbdriver = "com.mysql.jdbc.Driver";
	public void loadDriver(String dbDriver)
	{
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() {
		Connection con = null;
		try {
			con = DriverManager.getConnection(dburl, dbuname, dbpassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
	public String register(User user) {
	    loadDriver(dbdriver);
	    Connection con = getConnection();
	    String result = "User Registered Successfully";
	    
	    try {
	        // Find the current maximum ID
	        String getMaxIdSql = "SELECT MAX(UserID) FROM users";
	        PreparedStatement getMaxIdPs = con.prepareStatement(getMaxIdSql);
	        ResultSet rs = getMaxIdPs.executeQuery();
	        int nextId = 1;  // Default value if table is empty
	        if (rs.next()) {
	            nextId = rs.getInt(1) + 1;  // Increment max ID by 1
	        }
	        
	        // Insert the new user with the generated ID
	        String addUserSql = "INSERT INTO users (UserID, Email, Password, RoleName) VALUES(?,?,?,?)";
	        PreparedStatement userStatement = con.prepareStatement(addUserSql);
	        userStatement.setInt(1, nextId);                 // Generated ID
	        userStatement.setString(2, user.getEmail());   // Email
	        userStatement.setString(3, user.getPassword());// Password
	        userStatement.setString(4, "regular user");      // RoleName
	        userStatement.executeUpdate();
	        
	        String addUserPreferencesSql = "INSERT INTO userpreferences (UserID, Language, Currency) VALUES (?,?,?)";
	        PreparedStatement userPreferenceStatement = con.prepareStatement(addUserPreferencesSql);
	        userPreferenceStatement.setInt(1, nextId);
	        userPreferenceStatement.setString(2, user.getLanguage());
	        userPreferenceStatement.setString(3, user.getCurrency());
	        userPreferenceStatement.executeUpdate();
	        
	    } catch (SQLException e) {
	        result = "User Not Registered Successfully";
	        e.printStackTrace();
	    } finally {
	        try {
	            if (con != null) {
	                con.close();  // Always close the connection
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	   }
	  
	   return result;
	}
	
	public boolean validateUser(String email, String password) {
		loadDriver(dbdriver); 
		boolean isValidUser = false;
		 Connection con = getConnection();
		 
		 try {
			 String validateUserSql = "SELECT Password FROM Users WHERE Email = ?";
			 PreparedStatement validateUserStatement = con.prepareStatement(validateUserSql);
			 validateUserStatement.setString(1, email);
			 
			 ResultSet rs = validateUserStatement.executeQuery();
			 
			 // If a user is found, compare the passwords
		        if (rs.next()) {
		            String storedPassword = rs.getString("Password");
		            
		            // Compare the stored plain-text password with the provided password
		            if (storedPassword.equals(password)) {
		                isValidUser = true;
		            }
		        }
		 } catch (SQLException e) {
		        e.printStackTrace();
		 } finally {
		        try {
		            if (con != null) {
		                con.close();  // Always close the connection
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		   }

		 return isValidUser;
		
	}
	

	
}