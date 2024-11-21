import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
public class UserTripsDao {
	private ConnectionManager connectionManager;
	
	public UserTripsDao() {
		connectionManager = new ConnectionManager();
	}
	
	/**
	 * Combines the userID with the tripID
	 * 
	 * @param userId to combine with trip
	 * @param tripId to combine with user
	 * @return true if the method worked, false otherwise
	 */
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
	
	/**
	 * View all of the user's Trips
	 * @param userId the user's trip to fine
	 * @return the List of Trips
	 */
	public List<Trip> viewUserTrip(int userId) {
		
		// Create a list and add all of the attributes from each row of the query into a single trip
		List<Trip> trips = new ArrayList<>();
		
		// Connect to database
		connectionManager.loadDriver();
	    Connection con = connectionManager.getConnection();
	   
	    // Query and add the attributes to a new Trip and add each Trip to the list
	    try{
	    	String query = "SELECT t.tripID, t.startLocation, t.destination, t.duration, t.budget, t.travelers, t.flightclass, t.airline, t.startdate, t.enddate FROM trips t JOIN usertrips ut ON t.TripID = ut.TripID WHERE ut.UserID = ?";
	    	PreparedStatement ps = con.prepareStatement(query);
	    	ps.setInt(1, userId);
	    	
	    	ResultSet rs = ps.executeQuery();
	    	
	    	// For each trip row
	    	while (rs.next())
	    	{
	    		trips.add(new Trip(
	    				rs.getInt("TripID"),
	    			    rs.getString("startLocation"),
	    			    rs.getString("destination"),
	    			    rs.getInt("duration"),
	    			    rs.getInt("budget"),
	    			    rs.getInt("travelers"),
	    			    rs.getString("flightclass"),
	    			    rs.getString("airline"),
	    			    rs.getDate("startdate") != null ? rs.getDate("startdate").toLocalDate() : null, // Convert to LocalDate
	    			    rs.getDate("enddate") != null ? rs.getDate("enddate").toLocalDate() : null      // Convert to LocalDate
	    			));
	    	}

	    }
	    
	    catch (SQLException e)
	    {
	    	e.printStackTrace();
	    }
	   
	    // Close connection
	    finally
	    {
	    	
	    	try
	    	{
	    		if (con != null)
	    		{
	    			con.close();
	    		}
	    		
	    	}
	    	catch (SQLException e)
	    	{
	    		e.printStackTrace();
	    	}
	    }
	    
	 return trips;
	 
	    
	}
	

}