import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TripDeleteServlet")
public class TripDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ConnectionManager connectionManager = new ConnectionManager();

    public TripDeleteServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tripIDParam = request.getParameter("tripID");
        
        if (tripIDParam != null && !tripIDParam.isEmpty()) {
            try {
                int tripID = Integer.parseInt(tripIDParam);
                boolean isDeleted = deleteTripFromDatabase(tripID);
                
                if (isDeleted) {
                    response.getWriter().append("Trip deleted successfully.");
                    response.sendRedirect("dashboard.jsp");
                } else {
                    response.getWriter().append("Error: Trip not found or could not be deleted.");
                }
            } catch (NumberFormatException e) {
                response.getWriter().append("Invalid trip ID.");
            }
        } else {
            response.getWriter().append("No trip ID.");
        }
    }

    private boolean deleteTripFromDatabase(int tripID) {
        String sql = "DELETE FROM trips WHERE tripID = ?";

        try (Connection conn = connectionManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, tripID); 
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0; 
        } catch (SQLException e) {
            System.out.println("SQL error: " + e.getMessage());
            e.printStackTrace();
            return false; 
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
