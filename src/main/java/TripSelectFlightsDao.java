import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
public class TripSelectFlightsDao {
	private ConnectionManager connectionManager;
	
	public TripSelectFlightsDao() {
		connectionManager = new ConnectionManager();
	}
	
	public boolean addTripSelectFlight(int TripID, int FlightID) {
		connectionManager.loadDriver();
	    Connection con = connectionManager.getConnection();
	    
	    try {
	    	String addTripSelectFlightSql = "INSERT INTO TripSelectFlights (TripID, FlightID) VALUES (?,?)";
	    	PreparedStatement addTripSelectFlightPs = con.prepareStatement(addTripSelectFlightSql);
	    	addTripSelectFlightPs.setInt(1, TripID);
	    	addTripSelectFlightPs.setInt(2, FlightID);
	    	
	    	int rowsAffected = addTripSelectFlightPs.executeUpdate();
	        return rowsAffected > 0; 
	        
	    } catch (SQLException e) {
	    	e.printStackTrace();
	    	return false;
	    }
	}
	    
}
