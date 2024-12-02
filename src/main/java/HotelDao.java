import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;  

public class HotelDao {
	private ConnectionManager connectionManager;

    public HotelDao()
    {
        connectionManager = new ConnectionManager();
    }
    
    public int getNextMaxHotelID() {
    	// Load Driver
        connectionManager.loadDriver();

        // Start Connection
        Connection con = connectionManager.getConnection();
        int nextId = 1;
        try
        {
            // Get the max ID for hotel, increment to ensure uniqueness
            String getMaxIdSql = "SELECT MAX(HotelID) FROM Hotels";
            PreparedStatement getMaxIdPs = con.prepareStatement(getMaxIdSql);
            ResultSet rs = getMaxIdPs.executeQuery();
            if (rs.next()) {
                nextId = rs.getInt(1) + 1; // Get the max ID, then increment it
            }        
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
    
    public void saveHotel(Hotel hotel)
    {
        // Load Driver
        connectionManager.loadDriver();

        // Start Connection
        Connection con = connectionManager.getConnection();        
        try
        {
            int nextId = getNextMaxHotelID();

            // Insert flights with new hotel ID
            String addHotelSql = "INSERT INTO team6.hotels (HotelID, HotelName, CheckInDate, CheckOutDate, Price, Destination, Budget, NumOfPeople, RoomType, SpecialRequests, CheckInTime, CheckOutTime, OverallRating, HotelClass, HotelLink, Image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement addHotelPs = con.prepareStatement(addHotelSql);

            addHotelPs.setInt(1, hotel.getHotelID());
            addHotelPs.setString(2, hotel.getHotelName());
            addHotelPs.setObject(3, Date.valueOf(hotel.getCheckInDate()));
            addHotelPs.setObject(4, Date.valueOf(hotel.getCheckOutDate()));
            addHotelPs.setInt(5, hotel.getPrice());
            addHotelPs.setString(6, hotel.getDestination());
            addHotelPs.setInt(7, hotel.getBudget());
            addHotelPs.setInt(8, hotel.getNumOfPeople());
            addHotelPs.setString(9, hotel.getRoomType());
            addHotelPs.setString(10, hotel.getSpecialRequests());
            addHotelPs.setString(11, hotel.getCheckInTime());
            addHotelPs.setString(12, hotel.getCheckOutTime());
            addHotelPs.setString(13, hotel.getOverallRating());
            addHotelPs.setString(14, hotel.getHotelClass());
            addHotelPs.setString(15, hotel.getHotelLink());
            addHotelPs.setString(16, hotel.getImage());

            addHotelPs.executeUpdate();
            
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
    }
    
    public int selectHotel(String hotelName, String checkInTime, String checkOutTime, int lowestPrice, String overallRating, String hotelClass, String hotelLink, String image) {
        // Load Driver
        connectionManager.loadDriver();

        // Start Connection
        Connection con = connectionManager.getConnection();
        int hotelID = -1; 

        try {
            String selectHotelSql = "SELECT HotelID FROM team6.hotels " +
                                    "WHERE HotelName = ? AND CheckInTime = ? AND CheckOutTime = ? " +
                                    "AND Price = ? AND OverallRating = ? AND HotelClass = ? " +
                                    "AND HotelLink = ? AND Image = ? " +
                                    "ORDER BY HotelID DESC LIMIT 1";  

            PreparedStatement selectHotelPs = con.prepareStatement(selectHotelSql);

            selectHotelPs.setString(1, hotelName);
            selectHotelPs.setString(2, checkInTime);
            selectHotelPs.setString(3, checkOutTime);
            selectHotelPs.setInt(4, lowestPrice); 
            selectHotelPs.setString(5, overallRating);
            selectHotelPs.setString(6, hotelClass);
            selectHotelPs.setString(7, hotelLink);
            selectHotelPs.setString(8, image);

            ResultSet rs = selectHotelPs.executeQuery();

            if (rs.next()) {
                hotelID = rs.getInt("HotelID");
            }
            
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

        return hotelID; 
    }

}