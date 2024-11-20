

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HotelSelectionServlet
 */
@WebServlet("/HotelSelectionServlet")
public class HotelSelectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelSelectionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int TripID = (int) request.getSession().getAttribute("TripID");
		request.setCharacterEncoding("UTF-8");
		String hotelName = request.getParameter("hotelName");
	    String checkInTime = request.getParameter("checkInTime");
	    String checkOutTime = request.getParameter("checkOutTime");
	    int lowestPrice = Integer.parseInt(request.getParameter("lowestPrice"));
	    String overallRating = request.getParameter("overallRating");
	    String hotelClass = request.getParameter("hotelClass");
	    String hotelLink = request.getParameter("hotelLink");
	    String image = request.getParameter("image");
	    
//	    System.out.println(checkInTime);
//	    System.out.println(checkOutTime);
	    
	    HotelDao hotelDao = new HotelDao();
	    int HotelID = hotelDao.selectHotel(hotelName, checkInTime, checkOutTime, lowestPrice, overallRating, hotelClass, hotelLink, image);
	    
	    TripSelectHotelsDao tripSelectHotelsDao = new TripSelectHotelsDao();
	    boolean isTripSelectHotelAdded = tripSelectHotelsDao.addTripSelectHotel(TripID, HotelID);
	    
	    if (isTripSelectHotelAdded) {
	        response.sendRedirect("dashboard.jsp?message=success");
	    } else {
	    	response.getWriter().println("TripSelectHotels unsuccessful.");
	    }
	    
	}

}
