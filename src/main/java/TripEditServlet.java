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

    // GET method to retrieve the trip details and show in the edit form
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tripIDParam = request.getParameter("tripID");

        if (tripIDParam != null && !tripIDParam.isEmpty()) {
            try {
                int tripID = Integer.parseInt(tripIDParam);
                Trip trip = getTripFromDatabase(tripID);
                if (trip != null) {
                    request.setAttribute("trip", trip);
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

    // POST method to handle form submission and update the trip details
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tripIDParam = request.getParameter("tripID");

        if (tripIDParam != null && !tripIDParam.isEmpty()) {
            try {
                int tripID = Integer.parseInt(tripIDParam);
                Trip trip = getUpdatedTripFromRequest(request);

                // Update the trip in the database
                boolean updateSuccess = updateTripInDatabase(trip);
                if (updateSuccess) {
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
}

