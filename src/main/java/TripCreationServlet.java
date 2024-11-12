import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
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

/*
 * Servlet implementation for TripCreation, connecting the createTrip.jsp and the TripDao
 */

@WebServlet("/TripCreation")
public class TripCreationServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	
	public TripCreationServlet()
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
		String flightClass = request.getParameter("flightClass");
	    String airline = request.getParameter("airline");
	    LocalDate startDate = LocalDate.parse(request.getParameter("startDate"));
	    LocalDate endDate = LocalDate.parse(request.getParameter("endDate"));
	    
	    String startIATA = null;
		try {
			startIATA = getAirportCode(startLocation);
			System.out.println(startIATA);
		} catch (IOException | InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        String destinationIATA = null;
		try {
			destinationIATA = getAirportCode(destination);
		    System.out.println(destinationIATA);
		} catch (IOException | InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
		// Create trip given from inputed values
		Trip trip = new Trip(startLocation, destination, duration, budget, numTravelers, flightClass, airline, startDate, endDate);
		TripDao tripDao = new TripDao();
		int tripId = tripDao.addTrip(trip);
		
		//Adds trip to UserTrips table to associate the Trip with the User
		UserTripsDao userTripsDao = new UserTripsDao();
		boolean isTripAdded = userTripsDao.addUserTrip(userId, tripId);
		
		if (isTripAdded && startIATA != null && destinationIATA != null) {
			try {
				JSONObject flightsData = getFlights(startIATA, destinationIATA, startDate, endDate, flightClass);
				request.setAttribute("flightsData", flightsData.toString());
				RequestDispatcher dispatcher = request.getRequestDispatcher("/flightDetails.jsp");
				dispatcher.forward(request, response);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        response.getWriter().println("Trip created and added to your account successfully.");
	        
	    } else {
	        response.getWriter().println("Failed to add the trip to your account. Please try again.");
	    }
	}	
	
	private String getAirportCode(String location) throws IOException, InterruptedException {
	    // Construct the API request URL to call Google Places API
	    String apiKey = System.getenv("google_maps_api_key");
//	    System.out.println(apiKey);
	    String url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=airport+near+" + location.replace(" ", "%20") + "&key=" + apiKey;
	    	
	    HttpClient client = HttpClient.newHttpClient();

	    // Create the HTTP request
	    HttpRequest request = HttpRequest.newBuilder()
	            .uri(URI.create(url))
	            .build();

	    // Send the request and get the response
	    HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

	    // Parse the JSON response and extract the IATA code (or relevant details)
	    JSONObject myResponse = new JSONObject(response.body());
	    if (myResponse.getJSONArray("results").length() > 0) {
	        JSONObject airport = myResponse.getJSONArray("results").getJSONObject(0);
	        String name = airport.getString("name");
	        double lat = airport.getJSONObject("geometry").getJSONObject("location").getDouble("lat");
	        double lng = airport.getJSONObject("geometry").getJSONObject("location").getDouble("lng");

	        System.out.println("Airport Name: " + name + ", Latitude: " + lat + ", Longitude: " + lng);
	        String iataCode = getIATAFromLatLng(lat, lng);
	        
	        return iataCode;
	        
	    } else {
	        return null; 
	    }
	}
	
	private String getIATAFromLatLng(double lat, double lng) throws IOException, InterruptedException {
	    String url = "http://www.iatageo.com/getCode/" + lat + "/" + lng;

	    HttpClient client = HttpClient.newHttpClient();

	    HttpRequest request = HttpRequest.newBuilder()
	            .uri(URI.create(url))
	            .build();

	    HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

	    System.out.println("IATA API Response: " + response.body());

	    // Parse the JSON response and extract the IATA code
	    JSONObject responseJson = new JSONObject(response.body());
	    if (responseJson.has("IATA")) {
	        return responseJson.getString("IATA");
	    } else {
	        return null; 
	    }
	}
	
	private JSONObject getFlights(String startIATA, String destinationIATA, LocalDate startDate, LocalDate endDate, String flightClass) throws IOException, InterruptedException {
	    String apiKey = System.getenv("flights_api_key");
	    String url = "";
	    if (flightClass.equals("Economy")) {
	    	url = "https://serpapi.com/search.json?engine=google_flights&api_key=" + apiKey + "&departure_id=" + startIATA + "&arrival_id=" + destinationIATA + "&outbound_date=" + startDate + "&return_date=" + endDate + "&travel_class=" + 1;
	    } else if (flightClass.equals("Premium economy")) {
	    	url = "https://serpapi.com/search.json?engine=google_flights&api_key=" + apiKey + "&departure_id=" + startIATA + "&arrival_id=" + destinationIATA + "&outbound_date=" + startDate + "&return_date=" + endDate + "&travel_class=" + 2;
	    } else if (flightClass.equals("Business")) {
	    	url = "https://serpapi.com/search.json?engine=google_flights&api_key=" + apiKey + "&departure_id=" + startIATA + "&arrival_id=" + destinationIATA + "&outbound_date=" + startDate + "&return_date=" + endDate + "&travel_class=" + 3;
	    } else if (flightClass.equals("First")) {
	    	url = "https://serpapi.com/search.json?engine=google_flights&api_key=" + apiKey + "&departure_id=" + startIATA + "&arrival_id=" + destinationIATA + "&outbound_date=" + startDate + "&return_date=" + endDate + "&travel_class=" + 4;
	    }
	    
	    HttpClient client = HttpClient.newHttpClient();
	    HttpRequest request = HttpRequest.newBuilder()
	            .uri(URI.create(url))
	            .build();
	    
	    HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
	    return new JSONObject(response.body());
	}
}

