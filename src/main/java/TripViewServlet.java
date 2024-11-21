import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
 * Servlet implementation for TripCreation
 */

@WebServlet("/TripViewServlet")
public class TripViewServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	
	public TripViewServlet()
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
	    
	    // Use ID to get trips
	    UserDao userDao = new UserDao();
	    int userId = userDao.getUserIdByEmail(userEmail);	 
	    
	    UserTripsDao userTrip = new UserTripsDao();
	    
	    // Get all the trips from the userID
	    List<Trip> trips = userTrip.viewUserTrip(userId);
	    
	    // Create a map to store each trip
	    // NOTE: This is the scuffed method of making a Map of trip attributes
	    List<Map<String, Object>> tripData = new ArrayList<>();

	    // For each trip, store the responding attributes, then put it in
	    // a map to mimic a Trip object
	    for (Trip trip : trips) {
	        Map<String, Object> map = new HashMap<>();
	        map.put("tripID", trip.getTripID());
	        map.put("startLocation", trip.getStartLocation());
	        map.put("destination", trip.getDestination());
	        map.put("duration", trip.getDuration());
	        map.put("budget", trip.getBudget());
	        map.put("travelers", trip.getNumOfTravelers());
	        map.put("flightClass", trip.getFlightClass());
	        map.put("airline", trip.getAirline());
	        map.put("startDate", trip.getStartDate());
	        map.put("endDate", trip.getEndDate());
	        
	        tripData.add(map);
	    }
	    
	    System.out.println(tripData);

	    // Set attribute with the trip data
	    request.setAttribute("tripData", tripData);

	    // Send the trip data to viewAllTrips.jsp front-end
	    RequestDispatcher dispatcher = request.getRequestDispatcher("viewAllTrips.jsp");
	    dispatcher.forward(request, response);

	}
}