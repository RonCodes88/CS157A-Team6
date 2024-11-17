import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
public class UserTripsDao {
	private ConnectionManager connectionManager;
	
	public UserTripsDao() {
		connectionManager = new ConnectionManager();
	}
	
	public boolean addUserTrip(int userId, int tripId) {
		connectionManager.loadDriver();
	    Connection con = connectionManager.getConnection();
	    
	    try {
	    	String addUserTripSql = "INSERT INTO UserTrips (UserID, TripID) VALUES (?,?)";
	    	PreparedStatement addUserTripPs = con.prepareStatement(addUserTripSql);
	    	addUserTripPs.setInt(1, userId);
	    	addUserTripPs.setInt(2, tripId);
	    	
	    	int rowsAffected = addUserTripPs.executeUpdate();
	        return rowsAffected > 0; 
	        
	    } catch (SQLException e) {
	    	e.printStackTrace();
	    	return false;
	    }
	}
	
}