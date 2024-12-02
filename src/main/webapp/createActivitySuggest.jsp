<%@ page import="java.util.List, java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Suggested Activities</title>
    <link rel="stylesheet" href="CSS/createActivitySuggest.css">
</head>
<body>
<div class="container">
    <h2>Suggested Activities</h2>
    <div class="refresh">
        <form action="ActivitySuggestServlet" method="get">
        <input type="hidden" name="tripID" value="<%= request.getParameter("tripID") %>">
        
        <button type="submit" id="refresh-button" >Refresh Suggestions</button>
        </form>
        
        
        
        
    </div>
    <div class="cards">
        <%
            List<Map<String, Object>> activities = (List<Map<String, Object>>) request.getAttribute("activities");
            if (activities != null && !activities.isEmpty()) {
                for (Map<String, Object> activity : activities) {
        %>
        
        
        <div class="card">
            <h3><%= activity.get("activityName") %></h3>
            <p><strong>Description:</strong> <%= activity.get("activityDescription") %></p>
            <p><strong>Price:</strong> $<%= activity.get("activityPrice") %></p>
            
         <form action="ActivitySuggestServlet" method="POST">
         <input type="hidden" name="tripID" value="<%= request.getParameter("tripID") %>">
            <input type="hidden" name="activityName" value="<%= activity.get("activityName") %>">
            <input type="hidden" name="activityPrice" value="<%= activity.get("activityPrice") %>">
            <input type="hidden" name="activityDesc" value="<%= activity.get("activityDescription") %>">
            <button type="submit"> Select Activity</button>
        </form>
        
        </div>
        <%
                }
            } else {
        %>
        <div class = "no-activities">
        <p>No Suggested Activities Available. Please Hit Refresh</p>
        </div>
        
        <%
            }
        %>
    </div>
</div>
</body>
</html>