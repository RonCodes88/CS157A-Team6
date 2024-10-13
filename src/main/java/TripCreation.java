
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		// TODO Auto-generated method stub
		String startLocation = request.getParameter("startLocation");
		String destination = request.getParameter("destination");
		int duration = Integer.parseInt(request.getParameter("duration")); // Parse string to int
		int budget = Integer.parseInt(request.getParameter("budget"));
		int numTravelers = Integer.parseInt(request.getParameter("numTravelers"));
		
		// Create trip given from inputed values
		Trip trip = new Trip(startLocation, destination, duration, budget, numTravelers);
		TripDao tripDao = new TripDao();
		tripDao.addTrip(trip);
		
		response.getWriter().println("Trip created. (I hope)");
	}
	
	
	// NOTE. THIS DOES NOT SAVE THE USERID TO THE TRIP. IT JUST CREATES THE TRIP SO FAR
	
	
	
}

