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
		int duration = Integer.parseInt(request.getParameter("duration")); 
		int budget = Integer.parseInt(request.getParameter("budget"));
		int numTravelers = Integer.parseInt(request.getParameter("numTravelers"));
		String flightClass = request.getParameter("flightClass");
	    String airline = getAirlineCode(request.getParameter("airline"));
	    LocalDate departureDate = LocalDate.parse(request.getParameter("departureDate"));
	    LocalDate returnDate = LocalDate.parse(request.getParameter("returnDate"));
	    
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
		Trip trip = new Trip(0, startLocation, destination, duration, budget, numTravelers, flightClass, airline, departureDate, returnDate);
		TripDao tripDao = new TripDao();
		int tripId = tripDao.addTrip(trip);
		
		//Adds trip to UserTrips table to associate the Trip with the User
		UserTripsDao userTripsDao = new UserTripsDao();
		boolean isTripAdded = userTripsDao.addUserTrip(userId, tripId);
		
		if (isTripAdded && startIATA != null && destinationIATA != null) {
			try {
				JSONObject flightsData = getFlights(startIATA, destinationIATA, departureDate, returnDate, flightClass, airline, budget);
//				FlightDao flightDao = new FlightDao();
				
//				int firstFlightIDSaved = flightDao.getNextMaxFlightID();
				saveFlightsIntoDB(flightsData, departureDate, returnDate);
				
//				List<Flight> flights = displayFlightsFromDB(firstFlightIDSaved);
				request.setAttribute("flightsData", flightsData);
				request.getSession().setAttribute("TripID", tripId);
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
	
	private static String getAirlineCode(String airlineName) {
        HashMap<String, String> airlineCodes = new HashMap<>();

        airlineCodes.put("American Airlines", "AA");
        airlineCodes.put("Delta Air Lines", "DL");
        airlineCodes.put("United Airlines", "UA");
        airlineCodes.put("Southwest Airlines", "SW");
        airlineCodes.put("British Airways", "BA");
        airlineCodes.put("Lufthansa", "LH");
        airlineCodes.put("Air France", "AF");
        airlineCodes.put("Emirates", "EK");
        airlineCodes.put("Singapore Airlines", "SQ");
        airlineCodes.put("Qantas Airways", "QF");
        airlineCodes.put("Cathay Pacific Airways", "CX");
        airlineCodes.put("All Nippon Airways (ANA)", "NH");
        airlineCodes.put("Japan Airlines", "JL");
        airlineCodes.put("Air Canada", "AC");
        airlineCodes.put("Iberia", "IB");
        airlineCodes.put("Turkish Airlines", "TK");
        airlineCodes.put("Alitalia", "AZ");
        airlineCodes.put("Virgin Australia", "VA");
        airlineCodes.put("Etihad Airways", "EY");
        airlineCodes.put("Qatar Airways", "QR");
        airlineCodes.put("Korean Air", "KE");
        airlineCodes.put("Alaska Airlines", "AS");
        airlineCodes.put("Frontier Airlines", "F9");
        airlineCodes.put("GOL Linhas Aéreas", "G3");
        airlineCodes.put("IndiGo", "6E");
        airlineCodes.put("Air India", "AI");
        airlineCodes.put("Aerolineas Argentinas", "AR");
        airlineCodes.put("EVA Air", "BR");
        airlineCodes.put("Hainan Airlines", "HU");
        airlineCodes.put("China Eastern Airlines", "MU");
        airlineCodes.put("Air China", "CA");
        airlineCodes.put("China Airlines", "CI");
        airlineCodes.put("Air New Zealand", "NZ");
        airlineCodes.put("LOT Polish Airlines", "LO");

        // Return the code for the given airline name
        return airlineCodes.getOrDefault(airlineName, null);
    }
	
	private JSONObject getFlights(String startIATA, String destinationIATA, LocalDate startDate, LocalDate endDate, String flightClass, String airline, int budget) throws IOException, InterruptedException {
	    String apiKey = System.getenv("serp_api_key");

		
	    String url = "";
	    if (flightClass.equals("Economy")) {
	    	url = "https://serpapi.com/search.json?engine=google_flights&api_key=" + apiKey + "&departure_id=" + startIATA + "&arrival_id=" + destinationIATA + "&outbound_date=" + startDate + "&return_date=" + endDate + "&travel_class=" + "1";
	    } else if (flightClass.equals("Premium Economy")) {
	    	url = "https://serpapi.com/search.json?engine=google_flights&api_key=" + apiKey + "&departure_id=" + startIATA + "&arrival_id=" + destinationIATA + "&outbound_date=" + startDate + "&return_date=" + endDate + "&travel_class=" + "2";
	    } else if (flightClass.equals("Business")) {
	    	url = "https://serpapi.com/search.json?engine=google_flights&api_key=" + apiKey + "&departure_id=" + startIATA + "&arrival_id=" + destinationIATA + "&outbound_date=" + startDate + "&return_date=" + endDate + "&travel_class=" + "3";
	    } else if (flightClass.equals("First")) {
	    	url = "https://serpapi.com/search.json?engine=google_flights&api_key=" + apiKey + "&departure_id=" + startIATA + "&arrival_id=" + destinationIATA + "&outbound_date=" + startDate + "&return_date=" + endDate + "&travel_class=" + "4";
	    }
	    
	    if (airline != null) { 
	    	url += "&include_airlines=" + airline;
	    }
	    url += "&max_price=" + budget;
	    
	    System.out.println(url);
	    HttpClient client = HttpClient.newHttpClient();
	    HttpRequest request = HttpRequest.newBuilder()
	            .uri(URI.create(url))
	            .build();
	    
	    HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
	    return new JSONObject(response.body());
	}
	
	private void saveFlightsIntoDB(JSONObject flightsData, LocalDate departureDate, LocalDate returnDate) {
		System.out.println(flightsData.toString());
		JSONArray bestFlightsArray = flightsData.optJSONArray("best_flights");
        JSONArray otherFlightsArray = flightsData.optJSONArray("other_flights");

        List<Map<String, Object>> flightList = new ArrayList<>();

        // Parse best_flights
        if (bestFlightsArray != null) {
            for (int i = 0; i < bestFlightsArray.length(); i++) {
                flightList.add(bestFlightsArray.getJSONObject(i).toMap());
            }
        }

        // Parse other_flights
        if (otherFlightsArray != null) {
            for (int i = 0; i < otherFlightsArray.length(); i++) {
                flightList.add(otherFlightsArray.getJSONObject(i).toMap());
            }
        }
        
//        int firstFlightIDSaved = -1; 
        for (int i = 0; i < flightList.size(); i++) {
            Map<String, Object> flightData = flightList.get(i);
            List<Map<String, Object>> flightsArray = (List<Map<String, Object>>) flightData.get("flights");
            List<Map<String, Object>> layoversArray = (List<Map<String, Object>>) flightData.getOrDefault("layovers", Collections.emptyList());

            int layovers = layoversArray.size();
            String mainDepartureAirport = (String) ((Map<String, Object>) flightsArray.get(0).get("departure_airport")).get("name");
            String mainArrivalAirport = (String) ((Map<String, Object>) flightsArray.get(flightsArray.size() - 1).get("arrival_airport")).get("name");
            int price = (int) flightData.getOrDefault("price", 0);
            String airlineLogo = (String) flightData.getOrDefault("airline_logo", "");
            int totalDuration = (int) flightData.getOrDefault("total_duration", 0);

            for (int j = 0; j < flightsArray.size(); j++) {
                Map<String, Object> flight = flightsArray.get(j);
                
                String flightClass = (String) flight.get("travel_class");
                String airline = (String) flight.get("airline");
               
                Map<String, Object> departureAirport = (Map<String, Object>) flight.get("departure_airport");
                Map<String, Object> arrivalAirport = (Map<String, Object>) flight.get("arrival_airport");
                
                String departureName = (String) departureAirport.get("name");
                String arrivalName = (String) arrivalAirport.get("name");
                
                String departureTime = ((String) departureAirport.get("time")).split(" ")[1];
                String arrivalTime = ((String) arrivalAirport.get("time")).split(" ")[1];            
                
                String departureID = (String) departureAirport.get("id");
                String arrivalID = (String) arrivalAirport.get("id");
                
                String flightNumber = (String) flight.get("flight_number");
                
                FlightDao flightDao = new FlightDao();
                int flightID = flightDao.getNextMaxFlightID();
                Flight flightObj = new Flight(flightID, flightClass, airline, price, departureDate, returnDate, departureName, arrivalName, departureTime, arrivalTime, airlineLogo, flightNumber, "", 0, totalDuration, departureID, arrivalID, "");
                
                if (j < flightsArray.size() - 1 && layovers > 0) {
	                   Map<String, Object> layover = layoversArray.get(j);
	                   String layoverName = (String) layover.get("name");
	                   flightObj.setLayoverAirport(layoverName);
	                   String layoverID = (String) layover.get("id");
	                   flightObj.setLayoverAirportID(layoverID);
	                   int layoverDuration = (int) layover.get("duration");
	                   flightObj.setLayoverDuration(layoverDuration);
                }
                
                flightDao.saveFlight(flightObj);
               
            }
        }
	}
	

//	private List<Flight> displayFlightsFromDB(int firstFlightIDSaved) {
//		FlightDao flightDao = new FlightDao();
//		List<Flight> flights = flightDao.displayFlights(firstFlightIDSaved);
//		return flights;
//		
//	}
	
}

