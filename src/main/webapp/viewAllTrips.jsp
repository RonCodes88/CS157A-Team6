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
    <div class="cards">
        <%
        for (Map<String, Object> trip : trips) {
            %>
            <div class="card">
                <h3><%= trip.get("startLocation") %> ➝ <%= trip.get("destination") %></h3>
                <% if (trip.get("duration") != null) { %>
                <p><strong>Duration:</strong> <%= trip.get("duration") %> days</p>
                <% } %>
                <% if (trip.get("budget") != null) { %>
                <p><strong>Budget:</strong> $<%= trip.get("budget") %></p>
                <% } %>
                <% if (trip.get("travelers") != null) { %>
                <p><strong>Travelers:</strong> <%= trip.get("travelers").toString() %></p>
                <% } %>
                <% if (trip.get("flightClass") != null) { %>
                <p><strong>Flight Class:</strong> <%= trip.get("flightClass") %></p>
                <% } %>
                <% if (trip.get("airline") != null && !trip.get("airline").equals("")) { %>
                <p><strong>Airline:</strong> <%= trip.get("airline") %></p>
                <% } %>
                <% if (trip.get("startDate") != null) { %>
                <p><strong>Start Date:</strong> <%= trip.get("startDate") %></p>
                <% } %>
                <% if (trip.get("endDate") != null) { %>
                <p><strong>End Date:</strong> <%= trip.get("endDate") %></p>
                <% } %>
                <div class="button-container">
                    <a href="createCustomActivity.jsp">
  						<button class="add-edit-activities">Add/Edit Activities</button>
					</a>
                    <button class="view-trip-details">View Trip Details</button>
                    <form action="EditTripServlet" method="get">
                        <button type="submit" class="edit-trip">Edit Trip</button>
                    </form>
                </div>
            </div>
        <% }%>
    </div>
    <%
        } else { 
    %>
    <p>No trips available yet. Create a trip!</p>
    <% 
        } 
    %>
	</div>
</body>
</html>

