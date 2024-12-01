import java.io.IOException;
import java.net.URI;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;

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
import java.util.Objects;
import java.util.stream.Collectors;

/*
 * Servlet implementation for HotelBooking
 */

@WebServlet("/HotelBooking")
public class HotelBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	public HotelBookingServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String userEmail = (session != null) ? (String) session.getAttribute("user") : null;

		if (userEmail == null) {
			response.sendRedirect("login.jsp"); // Redirect to login if the user is not logged in
			return;
		}

//	    UserDao userDao = new UserDao();
//	    int userId = userDao.getUserIdByEmail(userEmail);	

		String destination = request.getParameter("destination");
		LocalDate checkInDate = LocalDate.parse(request.getParameter("checkInDate"));
		LocalDate checkOutDate = LocalDate.parse(request.getParameter("checkOutDate"));
		int numOfPeople = Integer.parseInt(request.getParameter("numOfPeople"));
		String roomType = request.getParameter("roomType");
		String hotelBrand = request.getParameter("hotelBrand");
		String specialRequests = request.getParameter("specialRequests");
		int budget = Integer.parseInt(request.getParameter("budget"));
		String[] amenities = request.getParameterValues("amenities");

		response.sendRedirect("hotelsLoading.jsp");

		new Thread(() -> {
			try {
				JSONObject hotelsData = getHotels(destination, checkInDate, checkOutDate, numOfPeople, hotelBrand,
						budget, amenities);
				saveHotelsIntoDB(hotelsData, checkInDate, checkOutDate, destination, budget, numOfPeople, roomType,
						specialRequests);
				session.setAttribute("hotelsData", hotelsData);
				session.setAttribute("isHotelProcessingComplete", true);
//				System.out.println("hotelsData and flag set");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Error processing your request. Please try again.");
			}
		}).start();

	}

	private JSONObject getHotels(String destination, LocalDate checkInDate, LocalDate checkOutDate, int numOfPeople,
			String hotelBrand, int budget, String[] amenities) throws IOException, InterruptedException {
		String apiKey = System.getenv("serp_api_key");
		String query = "";
		String baseUrl = "https://serpapi.com/search.json?engine=google_hotels&api_key=" + apiKey;

		if (!hotelBrand.isEmpty()) {
			query += hotelBrand + " ";
		}
		query += "Hotel in " + destination;

		// Encode query parameters
		query = URLEncoder.encode(query, StandardCharsets.UTF_8);

		String url = baseUrl + "&q=" + query + "&check_in_date=" + checkInDate + "&check_out_date=" + checkOutDate
				+ "&adults=" + numOfPeople + "&max_price=" + budget + "&property_types=" + "13,18,23,12,17";

		if (amenities != null) {
			Map<String, Integer> amenitiesMap = generateAmenitiesMap();

			String requestedAmenities = java.util.Arrays.stream(amenities)
					.map(amenity -> amenitiesMap.entrySet().stream()
							.filter(entry -> amenity.equalsIgnoreCase(entry.getKey())) // Case-insensitive check
							.map(Map.Entry::getValue).findFirst().orElse(null)) // Default to null if not found
					.filter(Objects::nonNull) // Remove nulls
					.map(String::valueOf) // Convert integers to strings
					.collect(Collectors.joining(","));

			url += "&amenities=" + URLEncoder.encode(requestedAmenities, StandardCharsets.UTF_8);
		}

		HttpClient client = HttpClient.newHttpClient();
		HttpRequest request = HttpRequest.newBuilder().uri(URI.create(url)).build();

		HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
		return new JSONObject(response.body());
	}

	private Map<String, Integer> generateAmenitiesMap() {
		HashMap<String, Integer> amenitiesMap = new HashMap<>();

		amenitiesMap.put("Free parking", 1);
		amenitiesMap.put("Parking", 3);
		amenitiesMap.put("Indoor pool", 4);
		amenitiesMap.put("Outdoor pool", 5);
		amenitiesMap.put("Pool", 6);
		amenitiesMap.put("Fitness center", 7);
		amenitiesMap.put("Restaurant", 8);
		amenitiesMap.put("Free breakfast", 9);
		amenitiesMap.put("Spa", 10);
		amenitiesMap.put("Beach access", 11);
		amenitiesMap.put("Child-friendly", 12);
		amenitiesMap.put("Bar", 15);
		amenitiesMap.put("Pet-friendly", 19);
		amenitiesMap.put("Room service", 22);
		amenitiesMap.put("Free Wi-Fi", 35);
		amenitiesMap.put("Air-conditioned", 40);
		amenitiesMap.put("All-inclusive available", 52);
		amenitiesMap.put("Wheelchair accessible", 53);
		amenitiesMap.put("EV charger", 61);

		return amenitiesMap;
	}

	@SuppressWarnings("unchecked")
	private void saveHotelsIntoDB(JSONObject hotelsData, LocalDate checkInDate, LocalDate checkOutDate,
			String destination, int budget, int numOfPeople, String roomType, String specialRequests) {
		JSONArray propertiesArray = hotelsData.optJSONArray("properties");
		List<Map<String, Object>> hotelList = new ArrayList<>();

		if (propertiesArray != null) {
			for (int i = 0; i < propertiesArray.length(); i++) {
				hotelList.add(propertiesArray.getJSONObject(i).toMap());
			}
		}

		for (int i = 0; i < hotelList.size(); i++) {
			Map<String, Object> hotelData = hotelList.get(i);
			String hotelName = (String) hotelData.get("name");
			String checkInTime = (String) hotelData.get("check_in_time");
			String checkOutTime = (String) hotelData.get("check_out_time");
			Map<String, Object> ratePerNight = (Map<String, Object>) hotelData.get("rate_per_night");
			String overallRating = hotelData.get("overall_rating") != null ? hotelData.get("overall_rating").toString()
					: "N/A";
			String hotelClass = hotelData.get("hotel_class") != null ? hotelData.get("hotel_class").toString() : "N/A";
			int lowestPrice = (int) ratePerNight.get("extracted_lowest");
			String hotelLink = (String) hotelData.get("link");
			String image = ((List<Map<String, String>>) hotelData.get("images")).get(0).get("original_image");

			HotelDao hotelDao = new HotelDao();
			int hotelID = hotelDao.getNextMaxHotelID();
			Hotel hotelObj = new Hotel(hotelID, hotelName, checkInDate, checkOutDate, lowestPrice, destination, budget,
					numOfPeople, roomType, specialRequests, checkInTime, checkOutTime, overallRating, hotelClass,
					hotelLink, image);

			hotelDao.saveHotel(hotelObj);

		}
	}
}