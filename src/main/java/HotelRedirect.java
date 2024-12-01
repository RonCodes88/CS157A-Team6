

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class HotelRedirect
 */
@WebServlet("/hotel_redirect")
public class HotelRedirect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelRedirect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		if (session != null && session.getAttribute("isHotelProcessingComplete") != null) {
			// Check if the processing is complete
			boolean isHotelProcessingComplete = (boolean) session.getAttribute("isHotelProcessingComplete");
//			System.out.println("isHotelProcessingComplete flag: " + isHotelProcessingComplete);

			if (isHotelProcessingComplete) {
				response.sendRedirect("hotelDetails.jsp");
			} else {
				response.sendRedirect("hotelsLoading.jsp");
			}
		} else {
			// Handle the case if something went wrong or session was lost
			System.out.println("Error in redirecting to hotelDetails");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
