<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Trip</title>
    <link rel="stylesheet" href="CSS/editTrip.css">
    <link rel="stylesheet" href="CSS/style.css">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
</head>

<body>
	<jsp:include page="navbar.jsp" />
	
    <div class="container">
        <h2>Edit Trip Details</h2>
        <form action="TripEditServlet" method="post">
            <input type="hidden" name="tripID" value="${trip.tripID}" />
            <label for="startLocation">Start Location:</label>
            <input type="text" id="startLocation" name="startLocation" value="${trip.startLocation}" required>
            <label for="destination">Destination:</label>
            <input type="text" id="destination" name="destination" value="${trip.destination}" required>
            <label for="duration">Duration (days):</label>
            <input type="number" id="duration" name="duration" value="${trip.duration}" min="1" required>
            <label for="budget">Budget ($):</label>
            <input type="number" id="budget" name="budget" value="${trip.budget}" required>
            <label for="travelers">Number of Travelers:</label>
            <input type="number" id="travelers" name="travelers" value="${trip.numOfTravelers}" min="1" step="1" required>
            <label for="flightClass">Flight Class:</label>
            <input type="text" id="flightClass" name="flightClass" value="${trip.flightClass}" required>
            <label for="airline">Airline:</label>
            <input type="text" id="airline" name="airline" value="${trip.airline}" required>
            <label for="startDate">Start Date:</label>
            <input type="date" id="startDate" name="startDate" value="${trip.startDate}" required>
            <label for="endDate">End Date:</label>
            <input type="date" id="endDate" name="endDate" value="${trip.endDate}" required>
            
            <input type="submit" value="Update Trip">
        </form>

        <div class="button-container">
            <form action="viewAllTrips.jsp" method="get">
                <input type="submit" value="Return to Trips" />
            </form>
            
            <form action="TripDeleteServlet" method="get">
                <input type="hidden" name="tripID" value="${trip.tripID}" />
                <input type="submit" value="Delete Trip" onclick="return confirm('Are you sure you want to delete this trip?');" />
            </form>
        </div>
    </div>
    
    <div class="wrapper">
        <div class="moving-car">
            <img src="images/Car.png" alt="Car">
        </div>
    </div>

	<jsp:include page="footer.jsp" />
	
</body>
</html>


