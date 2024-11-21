import java.time.LocalDate;
public class Trip
{
	private String startLocation, destination, flightClass, airline;
	private int duration, budget, numOfTravelers;
	private LocalDate startDate, endDate;

	public Trip() {
		super();
	}
	
	public Trip(String startLocation, String destination, int duration, int budget, int numOfTravelers, String flightClass, String airline, LocalDate startDate, LocalDate endDate) {
		this.startLocation = startLocation;
		this.destination = destination;
		this.duration = duration;
		this.budget = budget;
		this.numOfTravelers = numOfTravelers;
		this.flightClass = flightClass;
		this.airline = airline;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public String getStartLocation() {
		return startLocation;
	}

	public void setStartLocation(String startLocation) {
		this.startLocation = startLocation;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public int getBudget() {
		return budget;
	}

	public void setBudget(int budget) {
		this.budget = budget;
	}

	public int getNumOfTravelers() {
		return numOfTravelers;
	}

	public void setNumOfTravelers(int numOfTravelers) {
		this.numOfTravelers = numOfTravelers;
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
    
    public LocalDate getStartDate() {
    	return startDate;
    }
    
    public void setStartDate(LocalDate startDate) {
    	this.startDate = startDate;
    }
    
    public LocalDate getEndDate() {
    	return endDate;
    }
    
    public void setEndDate(LocalDate endDate) {
    	this.endDate = endDate;
    }
    
}
