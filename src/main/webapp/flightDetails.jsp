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
        
        function addLayoversInput(i, layovers) {
            var form = document.getElementById("flightForm_" + i); 
            var layoversInput = document.createElement("input"); 
            layoversInput.type = "hidden"; 
            layoversInput.name = "layovers"; 
            layoversInput.value = layovers; 
            form.appendChild(layoversInput); 
        }
        
    </script>
</head>
<body>
	<jsp:include page="navbar.jsp" />
    <h2>Here are the available flights</h2>

    <%
    JSONObject flightsData = (JSONObject) session.getAttribute("flightsData");
    JSONArray bestFlightsArray = flightsData.optJSONArray("best_flights");
    JSONArray otherFlightsArray = flightsData.optJSONArray("other_flights");
    if (flightsData != null && (bestFlightsArray != null || otherFlightsArray != null) ) {
        try {
            List<Map<String, Object>> flightList = new ArrayList<>();

            // Parse best_flights
            if (bestFlightsArray != null) {
                for (int i = 0; i < bestFlightsArray.length(); i++) {
                    flightList.add(bestFlightsArray.getJSONObject(i).toMap());
                }
            }

            // Parse other_flights
            if (otherFlightsArray != null) {
                for (int i = 0; i < otherFlightsArray.length(); i++) {
                    flightList.add(otherFlightsArray.getJSONObject(i).toMap());
                }
            }

            // Sort the flight list by price
            flightList.sort((flight1, flight2) -> {
                int price1 = (int) flight1.getOrDefault("price", 0);
                int price2 = (int) flight2.getOrDefault("price", 0);
                return Integer.compare(price1, price2);
            });
%>
            <!-- Table Header -->
            <table border="1" cellpadding="5" cellspacing="0">
                <thead>
                    <tr>
                        <th>Airline Logo</th>
                        <th>Departure Airport</th>
                        <th>Arrival Airport</th>
                        <th>Stops</th>
                        <th>Price</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
<%
            for (int i = 0; i < flightList.size(); i++) {
                Map<String, Object> flightData = flightList.get(i);
                List<Map<String, Object>> flightsArray = (List<Map<String, Object>>) flightData.get("flights");
                List<Map<String, Object>> layoversArray = (List<Map<String, Object>>) flightData.getOrDefault("layovers", Collections.emptyList());

                int layovers = layoversArray.size();
                String mainDepartureAirport = (String) ((Map<String, Object>) flightsArray.get(0).get("departure_airport")).get("name");
                String mainArrivalAirport = (String) ((Map<String, Object>) flightsArray.get(flightsArray.size() - 1).get("arrival_airport")).get("name");
                int price = (int) flightData.getOrDefault("price", 0);
                String airlineLogo = (String) flightData.getOrDefault("airline_logo", "");
                int totalDuration = (int) flightData.getOrDefault("total_duration", 0);
                String rowId = "flightDetails_" + i;
                String flightNumber = (String) ((Map<String, Object>) flightsArray.get(0)).get("flight_number");
%>				
                <!-- Flight Row -->
                <tr>
                    <td><img src="<%= airlineLogo %>" alt="Airline" width="50"></td>
                    <td><%= mainDepartureAirport %></td>
                    <td><%= mainArrivalAirport %></td>
                    <td><%= layovers %></td>
                    <td>$<%= price %></td>
                    <td><button onclick="toggleDetails('<%= rowId %>')">View Details</button></td>
                	<td>
				        <!-- Form for selecting a flight -->
				        <form id="flightForm_<%= i %>" action="FlightSelectionServlet" method="POST">
							<input type="hidden" name="airlineLogo" value="<%= airlineLogo %>">
							<input type="hidden" name="departureAirport" value="<%= mainDepartureAirport %>">
				            <input type="hidden" name="arrivalAirport" value="<%= mainArrivalAirport %>">
				            <input type="hidden" name="price" value="<%= price %>">
				            <input type="hidden" name="totalDuration" value="<%= totalDuration %>">	
				            <input type="hidden" name="flightNumber" value="<%= flightNumber %>">     
				            <button type="submit" onclick="addLayoversInput(<%= i %>, <%= layovers %>)">Select Flight</button>
				        </form>
    				</td> 
                </tr>

                <!-- Hidden Details Row -->
                <tr id="<%= rowId %>" style="display: none;">
                    <td colspan="6">
                        <h3>Flight Details:</h3>
                        <ul>
                            <li><strong>Total Duration:</strong> <%= totalDuration / 60 %> hours <%= totalDuration % 60 %> minutes</li>
<%
                            for (int j = 0; j < flightsArray.size(); j++) {
                                Map<String, Object> flight = flightsArray.get(j);
                                Map<String, Object> departureAirport = (Map<String, Object>) flight.get("departure_airport");
                                Map<String, Object> arrivalAirport = (Map<String, Object>) flight.get("arrival_airport");

                                String departureName = (String) departureAirport.get("name");
                                String departureTime = ((String) departureAirport.get("time")).split(" ")[1];
                                String departureID = (String) departureAirport.get("id");
                                String arrivalName = (String) arrivalAirport.get("name");
                                String arrivalTime = ((String) arrivalAirport.get("time")).split(" ")[1];
                                String arrivalID = (String) arrivalAirport.get("id");
                                String flightClass = (String) flight.get("travel_class");
%>							
							<li>
								<strong>Class: </strong> <%= flightClass %>
							</li>
                            <li>
                                <%= departureTime %> from <%= departureName %> (<%= departureID %>) → 
                                <%= arrivalTime %> at <%= arrivalName %> (<%= arrivalID %>)
                            </li>
<%
                                if (j < flightsArray.size() - 1 && layovers > 0) {
                                    Map<String, Object> layover = layoversArray.get(j);
                                    String layoverName = (String) layover.get("name");
                                    String layoverID = (String) layover.get("id");
                                    int layoverDuration = (int) layover.get("duration");
%>
                            <li class="layover">
                                <strong>Layover:</strong> <%= layoverDuration / 60 %> hours <%= layoverDuration % 60 %> minutes at <%= layoverName %> (<%= layoverID %>)
                            </li>    
<%
                                }
                            }
%>
                        </ul>
                    </td>
                </tr>
<%
            }
%>
                </tbody>
            </table>
<%
        } catch (Exception e) {
            out.println("<p>Error processing flight data: " + e.getMessage() + "</p>");
        }
    } else {
%>
    <p>No flights found based on the search criteria. Please try again.</p>
<%
    }
%>
<jsp:include page="footer.jsp" />
</body>
</html>







