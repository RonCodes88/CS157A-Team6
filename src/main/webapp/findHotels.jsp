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

            <label for="numAdults">Number of Adults:</label>
            <input type="number" id="numAdults" name="numAdults" min="1" step="1" required>
			
			<label for="numChildren">Number of Children:</label>
            <input type="number" id="numChildren" name="numChildren" min="1" step="1">
            
            <label for="roomType">Room Type:</label>
            <select id="roomType" name="roomType">
                <option value="Single">Single Room</option>
                <option value="Double">Double Room</option>
                <option value="Suite">Suite</option>
                <option value="Family">Family Room</option>
            </select>

            <label for="specialRequests">Special Requests (Optional):</label>
            <textarea id="specialRequests" name="specialRequests" rows="4" placeholder="Let us know about any preferences or needs"></textarea>

            <label for="budget">Budget per Night ($):</label>
            <input type="number" id="budget" name="budget" min="0">

            <label for="amenities">Preferred Amenities:</label>
            <div class="checkbox-group">
                <input type="checkbox" id="wifi" name="amenities" value="WiFi">
                <label for="wifi">Free WiFi</label><br>
                <input type="checkbox" id="pool" name="amenities" value="Pool">
                <label for="pool">Swimming Pool</label><br>
                <input type="checkbox" id="pet" name="amenities" value="Pet">
                <label for="pet">Pet-friendly</label><br>
                <input type="checkbox" id="fitness" name="amenities" value="Fitness Center">
                <label for="fitness">Fitness Center</label><br>
                <input type="checkbox" id="hottub" name="amenities" value="Hot Tub">
                <label for="hottub">Hot Tub</label><br>
                <input type="checkbox" id="ac" name="amenities" value="Air-conditioned">
                <label for="air-conditioned">Air-conditioned</label><br>
                <input type="checkbox" id="kitchen" name="amenities" value="Kitchen">
                <label for="kitchen">Kitchen</label><br>
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
