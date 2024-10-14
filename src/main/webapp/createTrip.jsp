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
        <form action="TripCreation" method="post">
            <label for="startLocation">Start Location:</label>
            <input type="text" id="startLocation" name="startLocation" required>

            <label for="destination">Destination:</label>
            <input type="text" id="destination" name="destination" required>

            <label for="duration">Duration (days):</label>
            <input type="number" id="duration" name="duration" min="1" required>

            <label for="budget">Budget ($):</label>
            <input type="number" id="budget" name="budget" min="0" step="10" required>

            <label for="numTravelers">Number of Travelers:</label>
            <input type="number" id="numTravelers" name="numTravelers" min="1" step="1" required>

            <input type="submit" value="Create Trip">
        </form>
    </div>
</body>
</html>
