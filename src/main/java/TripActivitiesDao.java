import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;



public class TripActivitiesDao {
	private ConnectionManager connectionManager;
	
	public TripActivitiesDao() {
		connectionManager = new ConnectionManager();
	}
	
	
	public boolean addActivityToTrip(int activityId, int tripId) {
        connectionManager.loadDriver();
        Connection con = connectionManager.getConnection();

        try {
            String addActivityToTripSql = "INSERT INTO createcustomactivities (ActivityID, TripID) VALUES (?, ?)";
            PreparedStatement addActivityToTripPs = con.prepareStatement(addActivityToTripSql);
            addActivityToTripPs.setInt(1, activityId);
            addActivityToTripPs.setInt(2, tripId);

            int rowsAffected = addActivityToTripPs.executeUpdate();
            return rowsAffected > 0;
	        
	    } catch (SQLException e) {
	    	e.printStackTrace();
	    	return false;
	    }
	}
	    
}
