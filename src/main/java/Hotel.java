import java.time.LocalDate;

public class Hotel {
	private int hotelID;
	private String hotelName;
	private LocalDate checkInDate;
	private LocalDate checkOutDate;
	private double price;
	
	public Hotel() {
		super();
	}
	
	public Hotel(int hotelID, String hotelName, LocalDate checkInDate, LocalDate checkOutDate, double price) {
		this.hotelID = hotelID;
		this.hotelName = hotelName;
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
		this.price = price;
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

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
}
