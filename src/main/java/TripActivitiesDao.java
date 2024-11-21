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

    public boolean deleteActivityFromTrip(int ActivityID, int TripID) {
        connectionManager.loadDriver();
        Connection con = connectionManager.getConnection();

        try {
            String deleteActivityFromTripSql = "DELETE FROM createcustomactivities WHERE ActivityID = ? AND TripID = ?";
            PreparedStatement deleteActivityPs = con.prepareStatement(deleteActivityFromTripSql);
            deleteActivityPs.setInt(1, ActivityID);
            deleteActivityPs.setInt(2, TripID);

            int rowsAffected = deleteActivityPs.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    
}