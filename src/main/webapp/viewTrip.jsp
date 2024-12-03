<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trip Details</title>
    <link rel="stylesheet" href="CSS/viewTrip.css">
    <link rel="stylesheet" href="CSS/style.css">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
</head>
<body>
	<jsp:include page="navbar.jsp" />
    <div class="container">
        <h2>Trip Details</h2>
        <p><strong>Start Location:</strong> ${trip.startLocation}</p>
		<p><strong>Destination:</strong> ${trip.destination}</p>
		<p><strong>Duration:</strong> ${trip.duration} days</p>
		<p><strong>Flight Budget:</strong> $${trip.budget}</p>
		<p><strong>Number of Travelers:</strong> ${trip.numOfTravelers}</p>
		<p><strong>Flight Class:</strong> ${trip.flightClass}</p>
		<p><strong>Airline:</strong> ${trip.airline}</p>
		<p><strong>Start Date:</strong> ${trip.startDate}</p>
		<p><strong>End Date:</strong> ${trip.endDate}</p>
		<p><strong>Hotel Name:</strong> ${hotel.hotelName}</p>
		<p><strong>Hotel Price:</strong> $${hotel.price}</p>
		<p><strong>Check-in Date:</strong> ${hotel.checkInDate}</p>
		<p><strong>Check-out Date:</strong> ${hotel.checkOutDate}</p>
		<p><strong>Room Type:</strong> ${hotel.roomType}</p>
		<p><strong>Special Requests:</strong> ${hotel.specialRequests}</p>
	
        <div class="links">
            <a href="viewAllTrips.jsp" class="btn">Back to Trips</a>
        </div>
    </div>
    
    <div class="wrapper">
        <div class="moving-plane">
            <img src="images/Plane.png" alt="Plane">
        </div>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>