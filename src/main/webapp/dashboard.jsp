<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Check if the user session exists using user's email
    String userEmail = (session != null) ? (String) session.getAttribute("user") : null;

    if (userEmail == null) {
        // User is not logged in, redirect to login page
        response.sendRedirect("login.jsp");
        return; // Exit after redirect
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelPal Dashboard</title>
    <link rel="stylesheet" href="CSS/dashboard.css">
</head>
<body>
    <header>
        <h1>TravelPal Dashboard</h1>
        <h3>Welcome <%= userEmail %>!</h3>
    </header>

    <nav>
        <ul>
            <li><a href="createTrip.jsp">Create Trip</a></li>
            <li><a href="currencyConv.jsp">Currency Converter</a></li>
        </ul>
    </nav>

    <footer>
        <p>&copy; Fall 2024 Team 6 TravelPal. All rights reserved.</p>
    </footer>
</body>
</html>

