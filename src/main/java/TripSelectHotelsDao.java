import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
public class TripSelectHotelsDao {
	private ConnectionManager connectionManager;
	
	public TripSelectHotelsDao() {
		connectionManager = new ConnectionManager();
	}
	
	public boolean addTripSelectHotel(int TripID, int HotelID) {
		connectionManager.loadDriver();
		Connection con = connectionManager.getConnection();
		
		try {
			String addTripSelectHotelSql = "INSERT INTO TripSelectHotels (TripID, HotelID) VALUES (?,?)";
	    	PreparedStatement addTripSelectHotelPs = con.prepareStatement(addTripSelectHotelSql);
	    	addTripSelectHotelPs.setInt(1, TripID);
	    	addTripSelectHotelPs.setInt(2, HotelID);
	    	
	    	int rowsAffected = addTripSelectHotelPs.executeUpdate();
	        return rowsAffected > 0; 
	        
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}
