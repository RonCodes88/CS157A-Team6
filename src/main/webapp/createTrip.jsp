<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Trip</title>
    <link rel="stylesheet" href="CSS/createTrip.css" />
</head>
<body>
    <div class="container">
        <h2>Create a New Trip</h2>
        <h3>Let's start by entering some basic travel information...</h3>
        <form action="TripCreation" method="post">
            <label for="startLocation">Start Location:</label>
            <input type="text" id="startLocation" name="startLocation" required>

            <label for="destination">Destination:</label>
            <input type="text" id="destination" name="destination" required>
			
			<label for="departureDate">Departure Date:</label>
            <input type="date" id="departureDate" name="departureDate" required>

            <label for="returnDate">Return Date:</label>
            <input type="date" id="returnDate" name="returnDate" required>
            
            <label for="duration">Duration (days):</label>
            <input type="number" id="duration" name="duration" min="1" required>

            <label for="budget">Budget ($):</label>
            <input type="number" id="budget" name="budget" min="0" required>

            <label for="numTravelers">Number of Travelers:</label>
            <input type="number" id="numTravelers" name="numTravelers" min="1" step="1" required>

            <!-- Dropdown for Flight Class -->
            <label for="flightClass">Preferred Flight Class:</label>
            <select id="flightClass" name="flightClass">
                <option value="Economy">Economy</option>
                <option value="Premium Economy">Premium Economy</option>
                <option value="Business">Business</option>
                <option value="First">First</option>
            </select>

            <!-- Optional Airline Preference -->
            <label for="airline">Preferred Airline (Optional):</label>
            <input type="text" id="airline" name="airline">

            <input type="submit" value="View Flights">
        </form>
    </div>

    <script>
        document.querySelectorAll('input[type="number"]').forEach(input => {
            input.addEventListener('wheel', (event) => event.preventDefault());
        });
    </script>
</body>
</html>

