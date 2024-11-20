<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Trips</title>
    <link rel="stylesheet" href="CSS/dashboard.css">
</head>
<body>
    <div class="container">
        <h2>Your Trips</h2>
        <%
            // Retrieve the list of maps from the request attribute
            List<Map<String, Object>> trips = (List<Map<String, Object>>) request.getAttribute("tripData");

            if (trips != null && !trips.isEmpty()) {
        %>
        <table border="1" style="width:100%; text-align:left;">
            <thead>
                <tr>
                    <th>Start Location</th>
                    <th>Destination</th>
                    <th>Duration (Days)</th>
                    <th>Budget ($)</th>
                    <th>Number of Travelers</th>
                    <th>Flight Class</th>
                    <th>Airline</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th></th> 
                </tr>
            </thead>
            <tbody>
                <%
                    for (Map<String, Object> trip : trips) {
                %>
                <tr>
                    <td><%= trip.get("startLocation") %></td>
                    <td><%= trip.get("destination") %></td>
                    <td><%= trip.get("duration") %></td>
                    <td><%= trip.get("budget") %></td>
                    <td><%= trip.get("travelers") != null ? trip.get("travelers").toString() : "N/A" %></td>
                	<td><%= trip.get("flightClass") %></td>
                	<td><%= trip.get("airline") %></td>
                	<td><%= trip.get("startDate") %></td>
                	<td><%= trip.get("endDate") %></td>
                	 <td>
                        <form action="EditTripServlet" method="get" style="display:inline;">
                            <button type="button" style="color: blue">Edit</button>
                        </form>
                    </td>
                	
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
        <%
            } else { 
                // Display a message if there are no trips
        %>
        <p>No trips available.</p>
        <% 
            } 
        %>
    </div>
</body>
</html>
