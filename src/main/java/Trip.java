
public class Trip
{
	private String startLocation, destination;
	private int duration, budget, numOfTravelers;

	public Trip() {
		super();
	}
	
	public Trip(String startLocation, String destination, int duration, int budget, int numOfTravelers) {
		super();
		this.startLocation = startLocation;
		this.destination = destination;
		this.duration = duration;
		this.budget = budget;
		this.numOfTravelers = numOfTravelers;
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
	
	
	

}
