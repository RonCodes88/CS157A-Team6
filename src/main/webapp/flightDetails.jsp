<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Flight Details</title>
    <link rel="stylesheet" type="text/css" href="CSS/flightDetails.css">
    <script>
        function toggleDetails(rowId) {
            var detailsRow = document.getElementById(rowId);
            if (detailsRow.style.display === "none") {
                detailsRow.style.display = "table-row";
            } else {
                detailsRow.style.display = "none";
            }
        }
    </script>
</head>
<body>
    <h2>So here are the available flights</h2>

    <%
        String flightsData = (String) request.getAttribute("flightsData");
        if (flightsData != null) {
            JSONObject json = new JSONObject(flightsData);
            JSONArray bestFlightsArray = json.getJSONArray("best_flights");

            // Convert JSONArray to List<Map<String, Object>> for easier handling of HashMap
            List<Map<String, Object>> flightList = new ArrayList<>();
            for (int i = 0; i < bestFlightsArray.length(); i++) {
                flightList.add(bestFlightsArray.getJSONObject(i).toMap());
            }

            // Sort the flight list based on price
            Collections.sort(flightList, new Comparator<Map<String, Object>>() {
                public int compare(Map<String, Object> flight1, Map<String, Object> flight2) {
                    int price1 = (Integer) flight1.get("price");
                    int price2 = (Integer) flight2.get("price");
                    return Integer.compare(price1, price2);
                }
            });
    %>
            <!-- Table Header -->
            <table border="1" cellpadding="5" cellspacing="0">
                <thead>
                    <tr>
                        <th>Airline Logo</th>
                        <th>Departure Airport</th>
                        <th>Arrival Airport</th>
                        <th>Number of Layovers</th>
                        <th>Price</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
    <%
    for (int i = 0; i < flightList.size(); i++) {
        Map<String, Object> flightData = flightList.get(i);
        List<Map<String, Object>> flightsArray = (List<Map<String, Object>>) flightData.get("flights");
        List<Map<String, Object>> layoversArray = (List<Map<String, Object>>) flightData.get("layovers");

        int layovers = (layoversArray != null) ? layoversArray.size() : 0; 
        String departureAirport = (String) ((Map<String, Object>) flightsArray.get(0).get("departure_airport")).get("name");
        String arrivalAirport = (String) ((Map<String, Object>) flightsArray.get(flightsArray.size() - 1).get("arrival_airport")).get("name");
        int price = (Integer) flightData.get("price");
        String airlineLogo = (String) flightData.get("airline_logo");

        // Additional flight details
        String travelClass = (String) ((Map<String, Object>) flightsArray.get(0)).get("travel_class");
        String flightNumber = (String) ((Map<String, Object>) flightsArray.get(0)).get("flight_number");
        String legroom = (String) ((Map<String, Object>) flightsArray.get(0)).get("legroom");
        int duration = (Integer) ((Map<String, Object>) flightsArray.get(0)).get("duration");

        // Creating a unique ID for each flight's details row
        String rowId = "flightDetails_" + i;
	%>

                <!-- Flight Row -->
                <tr>
                    <td><img src="<%= airlineLogo %>" alt="Airline" width="50"></td>
                    <td><%= departureAirport %></td>
                    <td><%= arrivalAirport %></td>
                    <td><%= layovers %></td>
                    <td>$<%= price %></td>
                    <td><button onclick="toggleDetails('<%= rowId %>')">View Details</button></td>
                </tr>

                <!-- Hidden Details Row -->
                <tr id="<%= rowId %>" style="display: none;">
                    <td colspan="6">
                        <h3>Flight Details:</h3>
                        <ul>
                            <li><strong>Travel Class:</strong> <%= travelClass %></li>
                            <li><strong>Flight Number:</strong> <%= flightNumber %></li>
                            <li><strong>Leg Room:</strong> <%= legroom %></li>
                            <li><strong>Duration:</strong> <%= duration / 60 %> hours <%= duration % 60 %> minutes</li>
                            <% if (layovers > 1) { %>
                                <li><strong>Layovers:</strong></li>
                                <ul>
                                    <%
                                        for (Map<String, Object> layover : layoversArray) {
                                            String layoverAirport = (String) layover.get("name");
                                            int layoverDuration = (Integer) layover.get("duration");
                                    %>
                                        <li><%= layoverAirport %> - Duration: <%= layoverDuration %> minutes</li>
                                    <%
                                        }
                                    %>
                                </ul>
                            <% } %>
                        </ul>
                    </td>
                </tr>
    <%
            }
    %>
                </tbody>
            </table>

    <%
        } else {
    %>
            <p>No flights available for this route. Please try again later.</p>
    <%
        }
    %>
</body>
</html>






