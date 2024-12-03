import java.time.LocalDate;

public class Hotel {
    private int hotelID;
    private String hotelName;
    private LocalDate checkInDate;
    private LocalDate checkOutDate;
    private int price;
    
    private String destination;
    private int budget;
    private int numOfPeople;
    private String roomType;
    private String specialRequests;
    
    private String checkInTime;
    private String checkOutTime;
    private String overallRating;
    private String hotelClass;
    private String hotelLink;
    private String image;

    public Hotel() {
        super();
    }

    public Hotel(int hotelID, String hotelName, LocalDate checkInDate, LocalDate checkOutDate, int price,
                 String destination, int budget, int numOfPeople, String roomType, String specialRequests, 
                 String checkInTime, String checkOutTime, String overallRating, String hotelClass, 
                 String hotelLink, String image) {
        this.hotelID = hotelID;
        this.hotelName = hotelName;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.price = price;
        this.destination = destination;
        this.budget = budget;
        this.numOfPeople = numOfPeople;
        this.roomType = roomType;
        this.specialRequests = specialRequests;
        this.checkInTime = checkInTime;
        this.checkOutTime = checkOutTime;
        this.overallRating = overallRating;
        this.hotelClass = hotelClass;
        this.hotelLink = hotelLink;
        this.image = image;
    }
    

    public Hotel(int hotelID2, String hotelName2, int price2, LocalDate checkInDate2, LocalDate checkOutDate2,
			String roomType2, String specialRequests2) {
		this.hotelID = hotelID2;
		this.hotelName = hotelName2;
		this.price = price2;
		this.checkInDate = checkInDate2;
		this.checkOutDate = checkOutDate2;
		this.roomType = roomType2;
		this.specialRequests = specialRequests2;
	}

	public int getHotelID() {
        return hotelID;
    }

    public void setHotelID(int hotelID) {
        this.hotelID = hotelID;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    public LocalDate getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(LocalDate checkInDate) {
        this.checkInDate = checkInDate;
    }

    public LocalDate getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(LocalDate checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public int getBudget() {
        return budget;
    }

    public void setBudget(int budget) {
        this.budget = budget;
    }

    public int getNumOfPeople() {
        return numOfPeople;
    }

    public void setNumOfPeople(int numOfPeople) {
        this.numOfPeople = numOfPeople;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public String getSpecialRequests() {
        return specialRequests;
    }

    public void setSpecialRequests(String specialRequests) {
        this.specialRequests = specialRequests;
    }

    public String getCheckInTime() {
        return checkInTime;
    }

    public void setCheckInTime(String checkInTime) {
        this.checkInTime = checkInTime;
    }

    public String getCheckOutTime() {
        return checkOutTime;
    }

    public void setCheckOutTime(String checkOutTime) {
        this.checkOutTime = checkOutTime;
    }

    public String getOverallRating() {
        return overallRating;
    }

    public void setOverallRating(String overallRating) {
        this.overallRating = overallRating;
    }

    public String getHotelClass() {
        return hotelClass;
    }

    public void setHotelClass(String hotelClass) {
        this.hotelClass = hotelClass;
    }

    public String getHotelLink() {
        return hotelLink;
    }

    public void setHotelLink(String hotelLink) {
        this.hotelLink = hotelLink;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}