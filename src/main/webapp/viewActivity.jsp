<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Your Activities</title>
	<link rel="stylesheet" href="CSS/viewActivity.css">
</head>
<body>
    <div>
        <h2 style="text-align: center; margin-top: 20px;">Activities On My Trip</h2>

        <div style="text-align: center; margin-bottom: 20px;">
            <form action="createActivity.jsp" method="post">
                <input type="hidden" name="tripID" value="<%=request.getAttribute("tripId")%>">
                <button type="submit">Add Activity</button>
            </form>
        </div>
        
         <div style="text-align: center; margin-bottom: 20px;">
            <form action="createActivitySuggest.jsp" method="post">
                <input type="hidden" name="tripID" value="<%=request.getAttribute("tripId")%>">
                <button type="submit">Use TravelAI to Suggest Activity</button>
            </form>
        </div>
        
     

        <div class="activity-grid">
            <%
            // Retrieve the list of activity maps from the request attribute
            List<Map<String, Object>> activities = (List<Map<String, Object>>) request.getAttribute("activityData");

            if (activities != null && !activities.isEmpty()) {
                for (Map<String, Object> activity : activities) {
            %>
                <div class="activity-card">
                    <h3 class="activity-title"><%=activity.get("activityName")%></h3>

                    <% if (activity.get("activityDesc") != null) { %>
                        <p class="activity-description">
                            <strong>Description:</strong> <%=activity.get("activityDesc")%>
                        </p>
                    <% } %>

                    <% if (activity.get("price") != null) { %>
                        <p class="activity-price">
                            <strong>Price:</strong> $<%=activity.get("price")%>
                        </p>
                    <% } %>

                    <form action="ActivityViewServlet" method="post">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="activityID" value="<%=activity.get("activityID")%>">
                        <input type="hidden" name="tripID" value="<%=request.getAttribute("tripId")%>">
                        <button type="submit" class="delete-btn">Delete Activity</button>
                    </form>
                    
                    
                </div>
            <%
                }
            } else {
            %>
                <p style="text-align: center; margin-top: 20px;">No activities available for this trip.</p>
            <%
            }
            %>
        </div>
    </div>
</body>
</html>

