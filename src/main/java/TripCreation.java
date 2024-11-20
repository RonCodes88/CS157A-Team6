import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * Servlet implementation for TripCreation, connecting the createTrip.jsp and the TripDao
 */

@WebServlet("/TripCreation")
public class TripCreation extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	
	public TripCreation()
	{
		super();
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession session = request.getSession(false);
		String userEmail = (session != null) ? (String) session.getAttribute("user") : null;
	    
	    if (userEmail == null) {
	        response.sendRedirect("login.jsp"); // Redirect to login if the user is not logged in
	        return;
	    }
	    
	    UserDao userDao = new UserDao();
	    int userId = userDao.getUserIdByEmail(userEmail);	    
	    
		String startLocation = request.getParameter("startLocation");
		String destination = request.getParameter("destination");
		int duration = Integer.parseInt(request.getParameter("duration")); // Parse string to int
		int budget = Integer.parseInt(request.getParameter("budget"));
		int numTravelers = Integer.parseInt(request.getParameter("numTravelers"));
		int tripID = Integer.parseInt(request.getParameter("tripID"));
		
		// Create trip given from inputed values
		Trip trip = new Trip(startLocation, destination, duration, budget, numTravelers, tripID);
		TripDao tripDao = new TripDao();
		int tripId = tripDao.addTrip(trip);
		
		//Adds trip to UserTrips table to associate the Trip with the User
		UserTripsDao userTripsDao = new UserTripsDao();
		boolean isTripAdded = userTripsDao.addUserTrip(userId, tripId);
		
		if (isTripAdded) {
	        response.getWriter().println("Trip created and added to your account successfully.");
	        response.sendRedirect("dashboard.jsp");
	    } else {
	        response.getWriter().println("Failed to add the trip to your account. Please try again.");
	    }
	}	
}

