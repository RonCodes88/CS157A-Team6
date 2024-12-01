
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class redirect
 */
@WebServlet("/flight_redirect")
public class FlightRedirect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FlightRedirect() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		if (session != null && session.getAttribute("isFlightProcessingComplete") != null) {
			// Check if the processing is complete
			boolean isFlightProcessingComplete = (boolean) session.getAttribute("isFlightProcessingComplete");

			if (isFlightProcessingComplete) {
				response.sendRedirect("flightDetails.jsp");
			} else {
				response.sendRedirect("flightsLoading.jsp");
			}
		} else {
			// Handle the case if something went wrong or session was lost
			System.out.println("Error in redirecting to flightDetails");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
