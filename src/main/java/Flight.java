import java.time.LocalDate;

public class Flight {
	private int flightID;
    private String flightClass;
    private String airline;
    private int price;
    private LocalDate departureDate;
    private LocalDate returnDate;
    private String departureAirport;
    private String arrivalAirport;
    private String departureTime;
    private String arrivalTime;
    private String airlineLogo;
    private String flightNumber;
    private String layoverAirport;
    private int layoverDuration;
    private int totalDuration;
    private String departureAirportID;
    private String arrivalAirportID;
    private String layoverAirportID;

    // Default constructor
    public Flight() {
        super();
    }

    // Constructor with all attributes
    public Flight(int flightID, String flightClass, String airline, int price, LocalDate departureDate, 
                  LocalDate returnDate, String departureAirport, String arrivalAirport, String departureTime, 
                  String arrivalTime, String airlineLogo, String flightNumber, String layoverAirport, 
                  int layoverDuration, int totalDuration, String departureAirportID, String arrivalAirportID, 
                  String layoverAirportID) {
        this.flightID = flightID;
    	this.flightClass = flightClass;
        this.airline = airline;
        this.price = price;
        this.departureDate = departureDate;
        this.returnDate = returnDate;
        this.departureAirport = departureAirport;
        this.arrivalAirport = arrivalAirport;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.airlineLogo = airlineLogo;
        this.flightNumber = flightNumber;
        this.layoverAirport = layoverAirport;
        this.layoverDuration = layoverDuration;
        this.totalDuration = totalDuration;
        this.departureAirportID = departureAirportID;
        this.arrivalAirportID = arrivalAirportID;
        this.layoverAirportID = layoverAirportID;
        
    }

    // Getters and Setters
    
    public int getFlightID() {
    	return flightID;
    }
    
    public void setFlightID(int flightID) {
    	this.flightID = flightID;
    }
    
    public String getFlightClass() {
        return flightClass;
    }

    public void setFlightClass(String flightClass) {
        this.flightClass = flightClass;
    }

    public String getAirline() {
        return airline;
    }

    public void setAirline(String airline) {
        this.airline = airline;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public LocalDate getDepartureDate() {
        return departureDate;
    }

    public void setDepartureDate(LocalDate departureDate) {
        this.departureDate = departureDate;
    }

    public LocalDate getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(LocalDate returnDate) {
        this.returnDate = returnDate;
    }

    public String getDepartureAirport() {
        return departureAirport;
    }

    public void setDepartureAirport(String departureAirport) {
        this.departureAirport = departureAirport;
    }

    public String getArrivalAirport() {
        return arrivalAirport;
    }

    public void setArrivalAirport(String arrivalAirport) {
        this.arrivalAirport = arrivalAirport;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public String getAirlineLogo() {
        return airlineLogo;
    }

    public void setAirlineLogo(String airlineLogo) {
        this.airlineLogo = airlineLogo;
    }

    public String getFlightNumber() {
        return flightNumber;
    }

    public void setFlightNumber(String flightNumber) {
        this.flightNumber = flightNumber;
    }

    public String getLayoverAirport() {
        return layoverAirport;
    }

    public void setLayoverAirport(String layoverAirport) {
        this.layoverAirport = layoverAirport;
    }

    public int getLayoverDuration() {
        return layoverDuration;
    }

    public void setLayoverDuration(int layoverDuration) {
        this.layoverDuration = layoverDuration;
    }

    public int getTotalDuration() {
        return totalDuration;
    }

    public void setTotalDuration(int totalDuration) {
        this.totalDuration = totalDuration;
    }

    public String getDepartureAirportID() {
        return departureAirportID;
    }

    public void setDepartureAirportID(String departureAirportID) {
        this.departureAirportID = departureAirportID;
    }

    public String getArrivalAirportID() {
        return arrivalAirportID;
    }

    public void setArrivalAirportID(String arrivalAirportID) {
        this.arrivalAirportID = arrivalAirportID;
    }

    public String getLayoverAirportID() {
        return layoverAirportID;
    }

    public void setLayoverAirportID(String layoverAirportID) {
        this.layoverAirportID = layoverAirportID;
    }
}
