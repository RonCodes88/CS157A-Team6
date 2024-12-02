import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/TripDetailsServlet")
public class TripDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ConnectionManager connectionManager = new ConnectionManager();

    public TripDetailsServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int tripID = Integer.parseInt(request.getParameter("tripID"));
        System.out.println("tripID: " + tripID);
            try {
                Trip trip = getTripFromDatabase(tripID);
                System.out.println("trip id: " + tripID);
                int hotelID = getHotelIDFromDatabase(tripID);
                Hotel hotel = getHotelFromDatabase(hotelID);
                
                if (trip != null) {
                    System.out.println("trip: " + trip);
                    request.setAttribute("trip", trip);
                    request.setAttribute("hotel", hotel);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/viewTrip.jsp");
                    dispatcher.forward(request, response);
                } else {
                    response.getWriter().append("Trip not in database.");
                }
            } catch (NumberFormatException e) {
                response.getWriter().append("Incorrect trip ID format.");
            }
    }

    private Trip getTripFromDatabase(int tripID) {
        Trip trip = null;
        String sql = "SELECT * FROM trips WHERE tripID = ?";

        try (Connection conn = connectionManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, tripID);  // Set the tripID parameter in the SQL query
            System.out.println("Executing query: " + sql);  // Log the SQL query being executed

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    // Create a Trip object using data from the ResultSet
                    trip = new Trip(
                        rs.getInt("tripID"),
                        rs.getString("startLocation"),
                        rs.getString("destination"),
                        rs.getInt("duration"),
                        rs.getInt("budget"),
                        rs.getInt("travelers"),
                        rs.getString("flightClass"),
                        rs.getString("airline"),
                        rs.getDate("startDate").toLocalDate(),
                        rs.getDate("endDate").toLocalDate()
                    );
                    System.out.println("Trip found: " + trip);  // Log the found trip
                } else {
                    System.out.println("No trip found with tripID: " + tripID);  // If no trip found
                }
            }

        } catch (SQLException e) {
            System.out.println("SQL error: " + e.getMessage());
            e.printStackTrace();
        }

        return trip;
    }
    
    private int getHotelIDFromDatabase(int tripID) {
        String sql = "SELECT hotelID FROM tripselecthotels WHERE tripID = ?";
        int hotelID = 0;
        try (Connection conn = connectionManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, tripID);  // Set the tripID parameter in the SQL query
            System.out.println("Executing query: " + sql);  // Log the SQL query being executed

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    hotelID = rs.getInt("HotelID");
                    System.out.println("Found hotel with hotelID: " + hotelID);
                } else {
                    System.out.println("No hotel found with tripID: " + tripID);  // If no trip found
                }
            }

        } catch (SQLException e) {
            System.out.println("SQL error: " + e.getMessage());
            e.printStackTrace();
        }

        return hotelID;
    }
    
    private Hotel getHotelFromDatabase(int hotelID) {
        Hotel hotel = null;
        String sql = "SELECT * FROM hotels WHERE hotelID = ?";

        try (Connection conn = connectionManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, hotelID);  // Set the hotelID parameter in the SQL query
            System.out.println("Executing query: " + sql);  // Log the SQL query being executed

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    // Create a Hotel object using data from the ResultSet
                    hotel = new Hotel(
                    	    rs.getInt("HotelID"),
                    	    rs.getString("HotelName"),
                    	    rs.getDate("CheckinDate").toLocalDate(),
                    	    rs.getDate("CheckoutDate").toLocalDate(),
                    	    rs.getInt("Price"),
                    	    rs.getString("destination"),
                    	    rs.getInt("budget"),
                    	    rs.getInt("numOfPeople"),
                    	    rs.getString("roomType"),
                    	    rs.getString("specialRequests"),
                    	    rs.getString("checkInTime"),
                    	    rs.getString("checkOutTime"),
                    	    rs.getString("overallRating"),
                    	    rs.getString("hotelClass"),
                    	    rs.getString("hotelLink"),
                    	    rs.getString("Image")
                    	);

                    System.out.println("Hotel found: " + hotel);  // Log the found trip
                } else {
                    System.out.println("No hotel found with hotelID: " + hotelID);  // If no trip found
                }
            }

        } catch (SQLException e) {
            System.out.println("SQL error: " + e.getMessage());
            e.printStackTrace();
        }

        return hotel;
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
