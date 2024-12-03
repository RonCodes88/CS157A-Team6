<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Your Stay</title>
    <link rel="stylesheet" href="CSS/findHotels.css" />
</head>
<body>
    <div class="container">
        <h2>Find a hotel</h2>
        <h3>Tell us about your stay, and we’ll find the best options for you!</h3>
        <form action="HotelBooking" method="post">
            <label for="destination">Destination:</label>
            <input type="text" id="destination" name="destination" placeholder="City, landmark, or address" required>

            <label for="checkInDate">Check-In Date:</label>
            <input type="date" id="checkInDate" name="checkInDate" required>

            <label for="checkOutDate">Check-Out Date:</label>
            <input type="date" id="checkOutDate" name="checkOutDate" required>

            <label for="numOfPeople">Number of People:</label>
            <input type="number" id="numOfPeople" name="numOfPeople" min="1" step="1" required>
            
            <label for="roomType">Room Type:</label>
            <select id="roomType" name="roomType">
                <option value="Single">Single Room</option>
                <option value="Double">Double Room</option>
                <option value="Suite">Suite</option>
                <option value="Family">Family Room</option>
            </select>
            
             <label for="hotelBrand">Preferred Hotel Brand:</label>
        	<select id="hotelBrand" name="hotelBrand">
	            <option value="" selected>Select a brand (Optional)</option>
	            <option value="Marriott">Marriott</option>
	            <option value="Hilton">Hilton</option>
	            <option value="Hyatt">Hyatt</option>
	            <option value="IHG">IHG (InterContinental Hotels Group)</option>
	            <option value="Accor">Accor</option>
	            <option value="Wyndham">Wyndham</option>
	            <option value="Choice">Choice Hotels</option>
	            <option value="Radisson">Radisson</option>
	            <option value="Four Seasons">Four Seasons</option>
	            <option value="Best Western">Best Western</option>
        	</select>
			
			<label for="budget">Budget per Night ($):</label>
            <input type="number" id="budget" name="budget" min="0" required>
            
            <label for="specialRequests">Special Requests (Optional):</label>
            <textarea id="specialRequests" name="specialRequests" rows="4" placeholder="Let us know about any preferences or needs"></textarea>

            <label for="amenities">Preferred Amenities:</label>
			<div class="checkbox-group">
			    <input type="checkbox" id="wifi" name="amenities" value="Free Wi-Fi">
			    <label for="wifi">Free Wi-Fi</label><br>
			    <input type="checkbox" id="parking" name="amenities" value="Free parking">
			    <label for="parking">Free Parking</label><br>
			    <input type="checkbox" id="indoor-pool" name="amenities" value="Indoor pool">
			    <label for="indoor-pool">Indoor Pool</label><br>
			    <input type="checkbox" id="outdoor-pool" name="amenities" value="Outdoor pool">
			    <label for="outdoor-pool">Outdoor Pool</label><br>
			    <input type="checkbox" id="pool" name="amenities" value="Pool">
			    <label for="pool">Pool</label><br>
			    <input type="checkbox" id="fitness" name="amenities" value="Fitness center">
			    <label for="fitness">Fitness Center</label><br>
			    <input type="checkbox" id="restaurant" name="amenities" value="Restaurant">
			    <label for="restaurant">Restaurant</label><br>
			    <input type="checkbox" id="breakfast" name="amenities" value="Free breakfast">
			    <label for="breakfast">Free Breakfast</label><br>
			    <input type="checkbox" id="spa" name="amenities" value="Spa">
			    <label for="spa">Spa</label><br>
			    <input type="checkbox" id="beach-access" name="amenities" value="Beach access">
			    <label for="beach-access">Beach Access</label><br>
			    <input type="checkbox" id="child-friendly" name="amenities" value="Child-friendly">
			    <label for="child-friendly">Child-friendly</label><br>
			    <input type="checkbox" id="bar" name="amenities" value="Bar">
			    <label for="bar">Bar</label><br>
			    <input type="checkbox" id="pet-friendly" name="amenities" value="Pet-friendly">
			    <label for="pet-friendly">Pet-friendly</label><br>
			    <input type="checkbox" id="room-service" name="amenities" value="Room service">
			    <label for="room-service">Room Service</label><br>
			    <input type="checkbox" id="air-conditioned" name="amenities" value="Air-conditioned">
			    <label for="air-conditioned">Air-conditioned</label><br>
			    <input type="checkbox" id="all-inclusive" name="amenities" value="All-inclusive available">
			    <label for="all-inclusive">All-inclusive Available</label><br>
			    <input type="checkbox" id="wheelchair" name="amenities" value="Wheelchair accessible">
			    <label for="wheelchair">Wheelchair Accessible</label><br>
			    <input type="checkbox" id="ev-charger" name="amenities" value="EV charger">
			    <label for="ev-charger">EV Charger</label><br>
			</div>
			
            <input type="submit" value="Find Hotels">
        </form>
    </div>

    <script>
        document.querySelectorAll('input[type="number"]').forEach(input => {
            input.addEventListener('wheel', (event) => event.preventDefault());
        });
    </script>
</body>
</html>
