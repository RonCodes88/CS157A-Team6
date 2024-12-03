<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Your Trips</title>
<link rel="stylesheet" href="CSS/viewAllTrips.css">

<script>
        function fetchTrips() {
            fetch('/TravelPal/TripViewServlet', { method: 'POST' })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.text();
                })
                .then(html => {
                    const tempDiv = document.createElement('div');
                    tempDiv.innerHTML = html;

                    const navbar = tempDiv.querySelector('.navbar');
                    if (navbar) {
                        navbar.remove();
                    }

                    const tripsContainer = document.getElementById('tripsContainer');
                    tripsContainer.innerHTML = tempDiv.innerHTML;

                    const tripSection = document.getElementById('tripSection');
                    tripSection.style.display = 'block';
                })
                .catch(error => {
                    console.error('Error fetching trips:', error);
                });
        }

        window.onload = function() {
            fetchTrips();
        };
    </script>
    
</head>
<body>
	<jsp:include page="navbar.jsp" />
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
				<h3><%=trip.get("startLocation")%>
					➝
					<%=trip.get("destination")%></h3>
				<%
				if (trip.get("duration") != null) {
				%>
				<p>
					<strong>Duration:</strong>
					<%=trip.get("duration")%>
					days
				</p>
				<%
				}
				%>
				<%
				if (trip.get("budget") != null) {
				%>
				<p>
					<strong>Budget:</strong> $<%=trip.get("budget")%></p>
				<%
				}
				%>
				<%
				if (trip.get("travelers") != null) {
				%>
				<p>
					<strong>Travelers:</strong>
					<%=trip.get("travelers").toString()%></p>
				<%
				}
				%>
				<%
				if (trip.get("flightClass") != null) {
				%>
				<p>
					<strong>Flight Class:</strong>
					<%=trip.get("flightClass")%></p>
				<%
				}
				%>
				<%
				if (trip.get("airline") != null && !trip.get("airline").equals("")) {
				%>
				<p>
					<strong>Airline:</strong>
					<%=trip.get("airline")%></p>
				<%
				}
				%>
				<%
				if (trip.get("startDate") != null) {
				%>
				<p>
					<strong>Start Date:</strong>
					<%=trip.get("startDate")%></p>
				<%
				}
				%>
				<%
				if (trip.get("endDate") != null) {
				%>
				<p>
					<strong>End Date:</strong>
					<%=trip.get("endDate")%></p>
				<%
				}
				%>


				<div class="button-container">
					<a href="ActivityViewServlet?tripID=<%= trip.get("tripID") %>"
						class="view-activity-details"> View Activities </a>
						
					<a href="TripDetailsServlet?tripID=<%= trip.get("tripID") %>"
						class="view-activity-details"> View Trip Details </a>
						
					<a href="TripEditServlet?tripID=<%= trip.get("tripID") %>"
						class="view-activity-details"> Edit Trip </a>

				</div>
			</div>
			<%
			}
			%>
		</div>
		<%
		} else {
		%>
		<p>No trips available yet. Create a trip!</p>
		<%
		}
		%>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
