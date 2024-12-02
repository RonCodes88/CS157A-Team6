import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {
	private String dbUrl = "jdbc:mysql://localhost:3306/travelpal";
    private String dbUsername = "root";
    private String dbPassword = "MYSQLvl011702@";
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