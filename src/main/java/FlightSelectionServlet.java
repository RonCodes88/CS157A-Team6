import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/FlightSelectionServlet")
public class FlightSelectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	
	public FlightSelectionServlet()
	{
		super();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int TripID = (int) request.getSession().getAttribute("TripID");
	    
		String airlineLogo = request.getParameter("airlineLogo");
	    String mainDepartureAirport = request.getParameter("departureAirport");
	    String mainArrivalAirport = request.getParameter("arrivalAirport");
	    int price = Integer.parseInt(request.getParameter("price"));
	    int totalDuration = Integer.parseInt(request.getParameter("totalDuration"));
	    int layovers = Integer.parseInt(request.getParameter("layovers"));
	    String flightNumber = request.getParameter("flightNumber");
	    
	    FlightDao flightDao = new FlightDao();
	    List<Integer> flightIDs = flightDao.selectFlight(airlineLogo, mainDepartureAirport, mainArrivalAirport, price, totalDuration, layovers, flightNumber);
	    Collections.sort(flightIDs);
	    TripSelectFlightsDao tripSelectFlightsDao = new TripSelectFlightsDao();
	    boolean isTripSelectFlightAdded = false;
	    for (int flightID : flightIDs) {
	    	isTripSelectFlightAdded = tripSelectFlightsDao.addTripSelectFlight(TripID, flightID);
	    }
	    
	    if (isTripSelectFlightAdded) {
	        response.sendRedirect("findHotels.jsp");
	    } else {
	    	response.getWriter().println("TripSelectFlights unsuccessful.");
	    }
	}
}

	