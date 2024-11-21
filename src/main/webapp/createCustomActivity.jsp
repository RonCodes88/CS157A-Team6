<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Activity</title>
    <link rel="stylesheet" href="CSS/createCustomActivity.css" />
</head>
<body>
	<div class = "container">
	<h2>Create an Activity</h2>
       <form action="CustomActivityCreation" method="post">
            <label for="activityName">Activity Name:</label>
            <input type="text" id="activityName" name="activityName" required>

            <label for="activityDesc">Activity Description:</label>
            <textarea id="activityDesc" name="activityDesc" rows="5" required></textarea>

            <label for="price">Price ($):</label>
            <input type="number" id="price" name="price" min="0" required>

            <input type="submit" value="Create Activity">
        </form>
    </div>
</body>
</html>
	
	
