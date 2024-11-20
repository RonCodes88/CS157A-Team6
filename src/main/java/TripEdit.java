import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/TripEdit")
public class TripEdit extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int tripId = Integer.parseInt(request.getParameter("tripId"));
        
        TripDao tripDao = new TripDao();
        Trip trip = tripDao.getTripById(tripId);
        
        request.setAttribute("trip", trip);
        request.getRequestDispatcher("editTrip.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int tripId = Integer.parseInt(request.getParameter("tripId"));
        String startLocation = request.getParameter("startLocation");
        String destination = request.getParameter("destination");
        int duration = Integer.parseInt(request.getParameter("duration"));
        int budget = Integer.parseInt(request.getParameter("budget"));
        int numTravelers = Integer.parseInt(request.getParameter("numTravelers"));
        int tripID = Integer.parseInt(request.getParameter("tripID"));

        Trip trip = new Trip(startLocation, destination, duration, budget, numTravelers, tripID);
        trip.setTripID(tripId);

        TripDao tripDao = new TripDao();
        boolean isUpdated = tripDao.updateTrip(trip, tripID);

        if (isUpdated) {
            response.sendRedirect("tripDetails.jsp?tripId=" + tripId);
        } else {
            response.getWriter().println("Error updating trip.");
        }
    }
}

