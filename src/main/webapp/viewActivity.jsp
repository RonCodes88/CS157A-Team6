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

	<div class="container">



		<h2 style="text-align: center; margin-top: 20px;">Activities On My Trip</h2>


		<div class="add-activity">
			<form action="createActivity.jsp" method="post"
				style="display: inline;">
				<input type="hidden" name="tripID"
					value="<%=request.getAttribute("tripId")%>">
				<button type="submit" style="color: blue">Add Activity</button>
			</form>
		</div>



		<div class="cards">
			<%
			// Retrieve the list of activity maps from the request attribute
			List<Map<String, Object>> activities = (List<Map<String, Object>>) request.getAttribute("activityData");

			if (activities != null && !activities.isEmpty()) {
				for (Map<String, Object> activity : activities) {
			%>

			<div class="card">
				<!-- Display Activity Name -->
				<h3><%=activity.get("activityName")%></h3>

				<!-- Display Activity Description -->
				<%
				if (activity.get("activityDesc") != null) {
				%>
				<p>
					<strong>Description:</strong>
					<%=activity.get("activityDesc")%>
				</p>
				<%
				}
				%>

				<!-- Display Activity Price -->
				<%
				if (activity.get("price") != null) {
				%>
				<p>
					<strong>Price:</strong> $<%=activity.get("price")%>
				</p>
				<%
				}
				%>

				<form action="ActivityViewServlet" method="post"
					style="margin-top: 10px;">
					<input type="hidden" name="action" value="delete"> 
					<input type="hidden" name="activityID" value="<%=activity.get("activityID")%>"> 
					<input type="hidden" name="tripID" value="<%=request.getAttribute("tripId")%>">
					<button type="submit"
						style="background-color: red; color: white; border: none; padding: 10px; cursor: pointer; border-radius: 5px;">Delete
						Activity</button>
				</form>

			</div>


		</div>





		<%
			}
			} else {
			%>
		<p style="text-align: center; margin-top: 20px;">No activities
			available for this trip.</p>
		<%
			}
			%>
	</div>









</body>
</html>

