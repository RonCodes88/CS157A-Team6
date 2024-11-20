<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hotel Details</title>
    <link rel="stylesheet" type="text/css" href="CSS/hotelDetails.css">
</head>
<body>
    <h2>Here are the available hotels</h2>

    <% 
    JSONObject hotelsData = (JSONObject) request.getAttribute("hotelsData");
    JSONArray propertiesArray = hotelsData.optJSONArray("properties");
    if (hotelsData != null && propertiesArray != null) {
        try {
            List<Map<String, Object>> hotelList = new ArrayList<>();

            if (propertiesArray != null) {
                for (int i = 0; i < propertiesArray.length(); i++) {
                    hotelList.add(propertiesArray.getJSONObject(i).toMap());
                }
            }

            // Sort the hotel list by price
            hotelList.sort((hotel1, hotel2) -> {
                int price1 = (int) ((Map) hotel1.get("rate_per_night")).getOrDefault("extracted_lowest", 0);
                int price2 = (int) ((Map) hotel2.get("rate_per_night")).getOrDefault("extracted_lowest", 0);
                return Integer.compare(price1, price2);
            });
    %>
    <div class="hotel-cards-container">
    <% for (int i = 0; i < hotelList.size(); i++) {
        Map<String, Object> hotelData = hotelList.get(i);
        String hotelName = (String) hotelData.get("name");
        String checkInTime = (String) hotelData.get("check_in_time");
        String checkOutTime = (String) hotelData.get("check_out_time");
        Map<String, Object> ratePerNight = (Map<String, Object>) hotelData.get("rate_per_night");
        int lowestPrice = (int) ratePerNight.get("extracted_lowest");
        String overallRating = hotelData.get("overall_rating") != null ? hotelData.get("overall_rating").toString() : "N/A";
        String hotelClass = hotelData.get("hotel_class") != null ? hotelData.get("hotel_class").toString() : "N/A";
        String hotelLink = (String) hotelData.get("link");
        String image = ((List<Map<String, String>>) hotelData.get("images")).get(0).get("original_image");
    %>
	    <div class="hotel-card">
		    <img src="<%= image %>" alt="<%= hotelName %> Photo" 
			     onload="this.style.display='block';" 
			     onerror="this.onerror=null; this.src='images/temp_fallback_image.jpg'; this.style.display='block';" 
			     style="display: none;" 
			>
		    <div class="hotel-info">
		        <h3><%= hotelName %></h3>
		        <% if (hotelClass != null && !hotelClass.equals("N/A")) { %>
		            <p>Hotel Class: <%= hotelClass %></p>
		        <% } %>
		        <% if (overallRating != null && !overallRating.equals("N/A")) { %>
		            <p>Overall Rating: <%= overallRating %></p>
		        <% } %>
		        <% if (checkInTime != null) { %>
		            <p>Check-in: <%= checkInTime %></p>
		        <% } %>
		        <% if (checkOutTime != null) { %>
		            <p>Check-out: <%= checkOutTime %></p>
		        <% } %>
		        <p>Price: $<%= lowestPrice %></p>
		        <a href="<%= hotelLink %>" target="_blank">View Details</a>
    			
	            <form action="HotelSelectionServlet" method="post">
	                <input type="hidden" name="hotelName" value="<%= hotelName %>">
	                <input type="hidden" name="checkInTime" value="<%= checkInTime %>">
	                <input type="hidden" name="checkOutTime" value="<%= checkOutTime %>">
	                <input type="hidden" name="lowestPrice" value="<%= lowestPrice %>">
	                <input type="hidden" name="overallRating" value="<%= overallRating %>">
	                <input type="hidden" name="hotelClass" value="<%= hotelClass %>">
	                <input type="hidden" name="hotelLink" value="<%= hotelLink %>">
	                <input type="hidden" name="image" value="<%= image %>">
	                <button type="submit">Select Hotel</button>
	            </form>
    	
    		</div>
	</div>

    <% } %>
	</div>
    <% 
        } catch (Exception e) {
            out.println("<p>Error processing hotel data: " + e.getMessage() + "</p>");
        }
    } else {
    %>
    <p class="no-hotels-message">No hotels found based on the search criteria. Please try again.</p>
    <% } %>
</body>
</html>