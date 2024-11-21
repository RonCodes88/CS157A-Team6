import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	    
		
		
	}

	public List<Activity> viewActivityToTrip(int tripId) {
		
		List<Activity> activities = new ArrayList<>();
		
        connectionManager.loadDriver();
        Connection con = connectionManager.getConnection();

        try {
            String viewActivityToTripSql = "SELECT a.activityID, a.activityName, a.activityDesc, a.price FROM customactivities a JOIN createcustomactivities c ON a.activityID = c.activityID WHERE c.tripID = ?";
            PreparedStatement viewActivityToTripPs = con.prepareStatement(viewActivityToTripSql);
            viewActivityToTripPs.setInt(1, tripId);
            
            ResultSet viewActivityToTripRs = viewActivityToTripPs.executeQuery();
            
            while(viewActivityToTripRs.next()) {
            	activities.add(new Activity(
            			viewActivityToTripRs.getInt("ActivityID"),
            			viewActivityToTripRs.getString("ActivityName"),
            			viewActivityToTripRs.getString("ActivityDesc"),
            			viewActivityToTripRs.getInt("Price")	
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
	    
	 return activities;
	 
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
	    
		
		
	}

}
