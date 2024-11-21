import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TripDao
{
    private ConnectionManager connectionManager;

    public TripDao()
    {
        connectionManager = new ConnectionManager();
    }

    public int addTrip(Trip trip)
    {
        // Load Driver
        connectionManager.loadDriver();

        // Start Connection
        Connection con = connectionManager.getConnection();
        int nextId = 1; // Default if no trips
        
        try
        {
            // Get the max ID for trip increment to ensure uniqueness
            String getMaxIdSql = "SELECT MAX(TripID) FROM trips";
            PreparedStatement getMaxIdPs = con.prepareStatement(getMaxIdSql);
            ResultSet rs = getMaxIdPs.executeQuery();
            if (rs.next()) {
                nextId = rs.getInt(1) + 1; // Get the max ID, 
                						   // if it exists, and then increment on existing
            }

            // Insert trip with new trip ID
            String addTripSql = "INSERT INTO trips (TripID, StartLocation, Destination, Duration, Budget, Travelers, FlightClass, Airline, StartDate, EndDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement addTripPs = con.prepareStatement(addTripSql);
            addTripPs.setInt(1, nextId); // Generated ID
            addTripPs.setString(2, trip.getStartLocation()); // Start Location
            addTripPs.setString(3, trip.getDestination()); // Destination
            addTripPs.setInt(4, trip.getDuration()); // Duration
            addTripPs.setInt(5, trip.getBudget()); // Budget
            addTripPs.setInt(6, trip.getNumOfTravelers()); // Number of Travelers
            addTripPs.setString(7, trip.getFlightClass());
            addTripPs.setString(8, trip.getAirline());
            addTripPs.setObject(9, trip.getStartDate()); 
            addTripPs.setObject(10, trip.getEndDate());
            
            addTripPs.executeUpdate();          
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
    
    public boolean updateTrip(Trip trip, int tripID) {
    	connectionManager.loadDriver();
    	Connection con = connectionManager.getConnection();
    	boolean updated = false;
    	
    	try {
    		String updateTripsDB = "UPDATE trips SET StartLocation = ?, Destination = ?, Duration = ?, Budget = ?, Travelers = ?, FlightClass = ?, Airline = ?, StartDate = ?, EndDate = ? WHERE TripID = ?";
    		PreparedStatement updateTripsPs = con.prepareStatement(updateTripsDB);
    		updateTripsPs.setString(1,  trip.getStartLocation());
    		updateTripsPs.setString(2, trip.getDestination());
    		updateTripsPs.setInt(3,  trip.getDuration());
    		updateTripsPs.setInt(4, trip.getBudget());
    		updateTripsPs.setInt(5, trip.getNumOfTravelers());
    		updateTripsPs.setString(6, trip.getFlightClass());
    		updateTripsPs.setString(7, trip.getAirline());
    		updateTripsPs.setObject(8, trip.getStartDate());
    		updateTripsPs.setObject(9, trip.getEndDate());
    		updateTripsPs.setInt(10, tripID);
    		
    		if (updateTripsPs.executeUpdate() > 0) { updated = true; }
    		
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    	finally {
    		try {
    			if (con != null) {
    				con.close();
    			}
    		} catch (SQLException e) {
    			e.printStackTrace();
    		}
    	}
    	
    	return updated;
    }
    
    public boolean deleteTrip(int tripID)
    {
        connectionManager.loadDriver();
        Connection con = connectionManager.getConnection();
        boolean deleted = false;

        try
        {
            String deleteTripSql = "DELETE FROM trips WHERE TripID = ?";
            PreparedStatement deleteTripPs = con.prepareStatement(deleteTripSql);
            deleteTripPs.setInt(1, tripID);

            int rowsDeleted = deleteTripPs.executeUpdate();
            if (rowsDeleted > 0) {
            	deleted = true;
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally
        {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return deleted;
    }

}
