import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TripDelete
 */
@WebServlet("/TripDelete")
public class TripDelete extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int tripId = Integer.parseInt(request.getParameter("tripId"));

        TripDao tripDao = new TripDao();
        boolean isDeleted = tripDao.deleteTrip(tripId);

        if (isDeleted) {
            response.sendRedirect("dashboard.jsp"); //redirect to dashboard
        } else {
            response.getWriter().println("Error deleting trip.");
        }
    }
}
