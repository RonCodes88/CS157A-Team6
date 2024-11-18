import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;



public class CreateCustomActivitiesDao {
	private ConnectionManager connectionManager;
	
	public CreateCustomActivitiesDao() {
		connectionManager = new ConnectionManager();
	}
	
	public boolean addCreateCustomActivitiesDao(int ActivityID, int TripID) {
		connectionManager.loadDriver();
	    Connection con = connectionManager.getConnection();
	    
	    try {
	    	String addCreateCustomActivitiesSql = "INSERT INTO createcustomactivities (ActivityID, TripID) VALUES (?,?)";
	    	PreparedStatement addCreateCustomActivitiesPs = con.prepareStatement(addCreateCustomActivitiesSql);
	    	addCreateCustomActivitiesPs.setInt(1, ActivityID);
	    	addCreateCustomActivitiesPs.setInt(2, TripID);
	    	
	    	int rowsAffected = addCreateCustomActivitiesPs.executeUpdate();
	        return rowsAffected > 0; 
	        
	    } catch (SQLException e) {
	    	e.printStackTrace();
	    	return false;
	    }
	}
	    
}
