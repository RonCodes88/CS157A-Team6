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
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
</head>

<body>
    <div class="container">
        <h2>Edit Trip Details</h2>
        <form action="TripCreation" method="post">
            <input type="hidden" name="tripId" value="${trip.tripId}" />
            <label for="startLocation">Start Location:</label>
            <input type="text" id="startLocation" name="startLocation" value="${trip.startLocation}" required>

            <label for="destination">Destination:</label>
            <input type="text" id="destination" name="destination" value="${trip.destination}" required>

            <label for="duration">Duration (days):</label>
            <input type="number" id="duration" name="duration" value="${trip.duration}" min="1" required>

            <label for="budget">Budget ($):</label>
            <input type="number" id="budget" name="budget" value="${trip.budget}" min="0" step="10" required>

            <label for="numTravelers">Number of Travelers:</label>
            <input type="number" id="numTravelers" name="numTravelers" value="${trip.numOfTravelers}" min="1" step="1" required>

            <input type="submit" value="Update Trip">
        </form>
    </div>

    <div class="wrapper">
        <div class="moving-car">
            <img src="images/Car.png" alt="Car">
        </div>
    </div>

</body>
</html>

