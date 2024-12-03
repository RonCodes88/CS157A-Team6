import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/TripEditServlet")
public class TripEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ConnectionManager connectionManager = new ConnectionManager();

    public TripEditServlet() {
        super();
    }

    // GET method to retrieve the trip and hotel details and show in the edit form
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tripIDParam = request.getParameter("tripID");

        if (tripIDParam != null && !tripIDParam.isEmpty()) {
            try {
                int tripID = Integer.parseInt(tripIDParam);
                Trip trip = getTripFromDatabase(tripID);
                int hotelID = getHotelIDFromDatabase(tripID);
                Hotel hotel = getHotelFromDatabase(hotelID);
                if (trip != null) {
                    request.setAttribute("trip", trip);
                    request.setAttribute("hotel", hotel);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/editTrip.jsp");
                    dispatcher.forward(request, response);
                } else {
                    response.getWriter().append("Trip not found in database.");
                }
            } catch (NumberFormatException e) {
                response.getWriter().append("Incorrect trip ID format.");
            }
        } else {
            response.getWriter().append("No trip ID provided.");
        }
    }

    // Method to retrieve the trip from the database based on tripID
    private Trip getTripFromDatabase(int tripID) {
        Trip trip = null;
        String sql = "SELECT * FROM trips WHERE tripID = ?";

        try (Connection conn = connectionManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, tripID);  // Set the tripID parameter in the SQL query

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
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
                }
            }

        } catch (SQLException e) {
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

    // POST method to handle form submission and update the trip details
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tripIDParam = request.getParameter("tripID");

        if (tripIDParam != null && !tripIDParam.isEmpty()) {
            try {
                int tripID = Integer.parseInt(tripIDParam);
                Trip trip = getUpdatedTripFromRequest(request);
                int hotelID = getHotelIDFromDatabase(tripID);
                Hotel hotel = getUpdatedHotelFromRequest(request, hotelID);
                // Update the trip in the database
                boolean updateTripSuccess = updateTripInDatabase(trip);
                boolean updateHotelSuccess = updateHotelInDatabase(hotel);
                if (updateTripSuccess && updateHotelSuccess) {
                    response.sendRedirect("TripDetailsServlet?tripID=" + tripID); // Redirect to the trip details page
                } else {
                    response.getWriter().append("Failed to update the trip.");
                }
            } catch (NumberFormatException e) {
                response.getWriter().append("Invalid trip ID.");
            }
        } else {
            response.getWriter().append("No trip ID provided.");
        }
    }

    // Method to extract updated trip data from the request
    private Trip getUpdatedTripFromRequest(HttpServletRequest request) {
        int tripID = Integer.parseInt(request.getParameter("tripID"));
        String startLocation = request.getParameter("startLocation");
        String destination = request.getParameter("destination");
        int duration = Integer.parseInt(request.getParameter("duration"));
        int budget = Integer.parseInt(request.getParameter("budget"));
        int travelers = Integer.parseInt(request.getParameter("travelers"));
        String flightClass = request.getParameter("flightClass");
        String airline = request.getParameter("airline");
        LocalDate startDate = LocalDate.parse(request.getParameter("startDate"));
        LocalDate endDate = LocalDate.parse(request.getParameter("endDate"));

        return new Trip(tripID, startLocation, destination, duration, budget, travelers, flightClass, airline, startDate, endDate);
    }
    
    private Hotel getUpdatedHotelFromRequest(HttpServletRequest request, int hotelID) {
    	String hotelName = request.getParameter("hotelName");
    	int price = Integer.parseInt(request.getParameter("price"));
    	LocalDate checkInDate = LocalDate.parse(request.getParameter("checkInDate"));
    	LocalDate checkOutDate = LocalDate.parse(request.getParameter("checkOutDate"));
    	String roomType = request.getParameter("roomType");
    	String specialRequests = request.getParameter("specialRequests");
    	
    	return new Hotel(hotelID, hotelName, price, checkInDate, checkOutDate, roomType, specialRequests);
    }
    
    private boolean updateTripInDatabase(Trip trip) {
        String sql = "UPDATE trips SET startLocation = ?, destination = ?, duration = ?, budget = ?, travelers = ?, flightClass = ?, airline = ?, startDate = ?, endDate = ? WHERE tripID = ?";

        try (Connection conn = connectionManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, trip.getStartLocation());
            stmt.setString(2, trip.getDestination());
            stmt.setInt(3, trip.getDuration());
            stmt.setInt(4, trip.getBudget());
            stmt.setInt(5, trip.getNumOfTravelers());
            stmt.setString(6, trip.getFlightClass());
            stmt.setString(7, trip.getAirline());
            stmt.setDate(8, java.sql.Date.valueOf(trip.getStartDate()));
            stmt.setDate(9, java.sql.Date.valueOf(trip.getEndDate()));
            stmt.setInt(10, trip.getTripID());

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    private boolean updateHotelInDatabase(Hotel hotel) {
        String sql = "UPDATE hotels SET hotelName = ?, price = ?, checkInDate = ?, checkOutDate = ?, roomType = ?, specialRequests = ? WHERE hotelID = ?";

        try (Connection conn = connectionManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, hotel.getHotelName());
            stmt.setInt(2, hotel.getPrice());
            stmt.setDate(3, java.sql.Date.valueOf(hotel.getCheckInDate()));
            stmt.setDate(4, java.sql.Date.valueOf(hotel.getCheckOutDate()));
            stmt.setString(5, hotel.getRoomType());
            stmt.setString(6, hotel.getSpecialRequests());
            stmt.setInt(7, hotel.getHotelID());

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}

