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

    // Remember to add UserID parameter here 
    public String addTrip(Trip trip)
    {
        // Load Driver
        connectionManager.loadDriver();

        // Start Connection
        Connection con = connectionManager.getConnection();

        String result = "Trip added successfully";

        try
        {
            // Get the max ID for trip increment to ensure uniqueness
            String getMaxIdSql = "SELECT MAX(TripID) FROM trips";
            PreparedStatement getMaxIdPs = con.prepareStatement(getMaxIdSql);
            ResultSet rs = getMaxIdPs.executeQuery();
            int nextId = 1; // Default if no trips
            if (rs.next()) {
                nextId = rs.getInt(1) + 1; // Get the max ID, 
                						   // if it exists, and then increment on existing
            }

            // Insert trip with new trip ID
            String addTripSql = "INSERT INTO trips (TripID, StartLocation, Destination, Duration, Budget, Travelers) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement addTripPs = con.prepareStatement(addTripSql);
            addTripPs.setInt(1, nextId); // Generated ID
            addTripPs.setString(2, trip.getStartLocation()); // Start Location
            addTripPs.setString(3, trip.getDestination()); // Destination
            addTripPs.setInt(4, trip.getDuration()); // Duration
            addTripPs.setInt(5, trip.getBudget()); // Budget
            addTripPs.setInt(6, trip.getNumOfTravelers()); // Number of Travelers
            addTripPs.executeUpdate();
            
            // Insert userid + tripid
            
            

        } catch (SQLException e) {
            result = "Trip failed to be created";
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

        return result;
    }

}
