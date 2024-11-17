import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;  

public class FlightDao {
	private ConnectionManager connectionManager;

    public FlightDao()
    {
        connectionManager = new ConnectionManager();
    }
    
    public int getNextMaxFlightID() {
    	// Load Driver
        connectionManager.loadDriver();

        // Start Connection
        Connection con = connectionManager.getConnection();
        int nextId = 1;
        try
        {
            // Get the max ID for flight, increment to ensure uniqueness
            String getMaxIdSql = "SELECT MAX(FlightID) FROM Flights";
            PreparedStatement getMaxIdPs = con.prepareStatement(getMaxIdSql);
            ResultSet rs = getMaxIdPs.executeQuery();
            if (rs.next()) {
                nextId = rs.getInt(1) + 1; // Get the max ID, then increment it
            }        
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            // Close connection
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return nextId;
    }
    
    public void saveFlight(Flight flight)
    {
        // Load Driver
        connectionManager.loadDriver();

        // Start Connection
        Connection con = connectionManager.getConnection();        
        try
        {
            int nextId = getNextMaxFlightID();

            // Insert flights with new flight ID
            String addFlightSql = "INSERT INTO flights (FlightID, FlightClass, Airline, Price, DepartureDate, ReturnDate, DepartureAirport, ArrivalAirport, DepartureTime, ArrivalTime, AirlineLogo, FlightNumber, LayoverAirport, LayoverDuration, TotalDuration, DepartureAirportID, ArrivalAirportID, LayoverAirportID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement addFlightPs = con.prepareStatement(addFlightSql);

            addFlightPs.setInt(1, nextId);
            addFlightPs.setString(2, flight.getFlightClass());
            addFlightPs.setString(3, flight.getAirline());
            addFlightPs.setInt(4, flight.getPrice());
            addFlightPs.setObject(5, Date.valueOf(flight.getDepartureDate()));
            addFlightPs.setObject(6, Date.valueOf(flight.getReturnDate()));
            addFlightPs.setString(7, flight.getDepartureAirport());
            addFlightPs.setString(8, flight.getArrivalAirport());
            addFlightPs.setString(9, flight.getDepartureTime());
            addFlightPs.setString(10, flight.getArrivalTime());
            addFlightPs.setString(11, flight.getAirlineLogo());
            addFlightPs.setString(12, flight.getFlightNumber());
            addFlightPs.setString(13, flight.getLayoverAirport());
            addFlightPs.setInt(14, flight.getLayoverDuration());
            addFlightPs.setInt(15, flight.getTotalDuration());
            addFlightPs.setString(16, flight.getDepartureAirportID());
            addFlightPs.setString(17, flight.getArrivalAirportID());
            addFlightPs.setString(18, flight.getLayoverAirportID());

            addFlightPs.executeUpdate();
        
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            // Close connection
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public List<Flight> displayFlights(int firstFlightIDSaved) {
    	// Load Driver
        connectionManager.loadDriver();

        // Start Connection
        Connection con = connectionManager.getConnection();
        List<Flight> flights = new ArrayList<>();
        try
        {
        	String selectFlightsSql = "SELECT * FROM Flights WHERE FlightID >= ?";
            PreparedStatement selectFlightsPs = con.prepareStatement(selectFlightsSql);
            selectFlightsPs.setInt(1, firstFlightIDSaved);

            ResultSet rs = selectFlightsPs.executeQuery();
            
            while (rs.next()) {
                int flightID = rs.getInt("FlightID");
                String flightClass = rs.getString("FlightClass");
                String airline = rs.getString("Airline");
                int price = rs.getInt("Price");
                Date departureDate = rs.getDate("DepartureDate");
                Date returnDate = rs.getDate("ReturnDate");
                String departureAirport = rs.getString("DepartureAirport");
                String arrivalAirport = rs.getString("ArrivalAirport");
                String departureTime = rs.getString("DepartureTime");
                String arrivalTime = rs.getString("ArrivalTime");
                String airlineLogo = rs.getString("AirlineLogo");
                String flightNumber = rs.getString("FlightNumber");
                String layoverAirport = rs.getString("LayoverAirport");
                int layoverDuration = rs.getInt("LayoverDuration");
                int totalDuration = rs.getInt("TotalDuration");
                String departureAirportID = rs.getString("DepartureAirportID");
                String arrivalAirportID = rs.getString("ArrivalAirportID");
                String layoverAirportID = rs.getString("LayoverAirportID");
                
                Flight flight = new Flight(flightID, flightClass, airline, price, departureDate.toLocalDate(), returnDate.toLocalDate(),
                        departureAirport, arrivalAirport, departureTime, arrivalTime, airlineLogo, flightNumber,
                        layoverAirport, layoverDuration, totalDuration, departureAirportID, arrivalAirportID, layoverAirportID);
                
                flights.add(flight);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            // Close connection
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return flights;
    }
    
    public List<Integer> selectFlight(String airlineLogo, String mainDepartureAirport, String mainArrivalAirport, int price, int totalDuration, int layovers) {
    	// Load Driver
        connectionManager.loadDriver();

        // Start Connection
        Connection con = connectionManager.getConnection();
        List<Integer> flightIDs = new ArrayList<>();
        
        try {
        	String selectFlightSql = "";
        	if (layovers == 0) {
        		selectFlightSql = "SELECT * FROM flights WHERE airlineLogo = ? " +
           			 "AND departureAirport = ? " +
           			 "AND arrivalAirport = ? " +
           			 "AND Price = ? " +
           			 "AND totalDuration = ? ";
        	} else {
        		selectFlightSql = "SELECT * FROM flights WHERE airlineLogo = ? " +
              			 "AND (departureAirport = ? OR arrivalAirport = ?)" +    
        				 "AND Price = ? " +
              			 "AND totalDuration = ? ";
        	}
        	
        	PreparedStatement selectFlightPs = con.prepareStatement(selectFlightSql);
        	selectFlightPs.setString(1, airlineLogo);
        	selectFlightPs.setString(2, mainDepartureAirport);
        	selectFlightPs.setString(3, mainArrivalAirport);
        	selectFlightPs.setInt(4, price);
        	selectFlightPs.setInt(5, totalDuration);
        	ResultSet rs = selectFlightPs.executeQuery();      	

            while (rs.next()) {
                int flightID = rs.getInt("FlightID");  
                flightIDs.add(flightID);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            // Close connection
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return flightIDs;
   }
}
