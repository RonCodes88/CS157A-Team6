import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {
	private String dbUrl = "jdbc:mysql://localhost:3306/team6";
    private String dbUsername = "root";
    private String dbPassword = "Turtle$$678:)";
    private String dbDriver = "com.mysql.jdbc.Driver";

    // Load the database driver
    public void loadDriver() {
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Establish and return a database connection
    public Connection getConnection() {
        Connection con = null;
        System.out.println(dbPassword);
        try {
            con = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }
    
    public String getdbdriver() {
    	return dbDriver;
    }
}