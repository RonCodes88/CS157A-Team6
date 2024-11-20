import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CustomActivityDao {
	private ConnectionManager connectionManager;

	public CustomActivityDao() {
		connectionManager = new ConnectionManager();
	}

	public int addCustomActivity(CustomActivity activity) {
		// Load Driver
		connectionManager.loadDriver();
		
        // Start Connection
        Connection con = connectionManager.getConnection();
        int nextId = 1; // Default if no activity
        
        try
        {
            // Get the max ID for customactivities increment to ensure uniqueness
            String getMaxIdSql = "SELECT MAX(ActivityID) FROM customactivities";
            PreparedStatement getMaxIdPs = con.prepareStatement(getMaxIdSql);
            ResultSet rs = getMaxIdPs.executeQuery();
            if (rs.next()) {
                nextId = rs.getInt(1) + 1; // Get the max ID, 
                						   // if it exists, and then increment on existing
            }
     
        
        String addCustomActivitySql = "INSERT INTO customactivities (ActivityID, ActivityName, ActivityDesc, Price) VALUE (?, ?, ?, ?)";
        PreparedStatement addCustomActSql = con.prepareStatement(addCustomActivitySql);
        addCustomActSql.setInt(1, nextId); 
        addCustomActSql.setString(2, activity.getActivityName());
        addCustomActSql.setString(3, activity.getActivityDesc());
        addCustomActSql.setInt(4, activity.getPrice());
        
        addCustomActSql.executeUpdate();
        
	} catch (SQLException e) {
		e.printStackTrace();
		
    } finally {
        // Close connection
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    return nextId;
}

}
