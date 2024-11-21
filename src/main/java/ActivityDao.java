import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ActivityDao {
    private ConnectionManager connectionManager;

    public ActivityDao() {
        connectionManager = new ConnectionManager();
    }

    public int addActivity(Activity activity) {
        // Load Driver
        connectionManager.loadDriver();

        // Start Connection
        Connection con = connectionManager.getConnection();
        int nextId = 1; // Default if no activity exists

        try {
            // Get the max ID for activities and increment to ensure uniqueness
            String getMaxIdSql = "SELECT MAX(ActivityID) FROM customactivities";
            PreparedStatement getMaxIdPs = con.prepareStatement(getMaxIdSql);
            ResultSet rs = getMaxIdPs.executeQuery();
            if (rs.next()) {
                nextId = rs.getInt(1) + 1; // Increment the max ID,
                						//if it exists
            }

            // Insert new activity into the activities table
            String addActivitySql = "INSERT INTO customactivities (ActivityID, ActivityName, ActivityDesc, Price) VALUES (?, ?, ?, ?)";
            PreparedStatement addActivityPs = con.prepareStatement(addActivitySql);
            addActivityPs.setInt(1, nextId);
            addActivityPs.setString(2, activity.getActivityName());
            addActivityPs.setString(3, activity.getActivityDesc());
            addActivityPs.setInt(4, activity.getPrice());

            addActivityPs.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            
        } 
        finally {
            // Close connection
            try {
            	
                if (con != null) {
                    con.close();
                }
                
            } 
            
            catch (SQLException e) {
                e.printStackTrace();
            }
            
        }

        return nextId;
        
        
        
        
        
    }
    
}
