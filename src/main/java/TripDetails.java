import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TripDetails
 */
@WebServlet("/TripDetails")
public class TripDetails extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int tripId = Integer.parseInt(request.getParameter("tripId"));

        TripDao tripDao = new TripDao();
        Trip trip = tripDao.getTripById(tripId);

        request.setAttribute("trip", trip);
        request.getRequestDispatcher("tripDetails.jsp").forward(request, response);
    }
}
