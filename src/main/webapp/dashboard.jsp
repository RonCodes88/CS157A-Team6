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
	    
	    <script>
		        function slideoutPanel() {
		            const panel = document.getElementById('slideoutPanel');
		            panel.classList.toggle('open');
		            overlay.style.display = panel.classList.contains('open') ? 'block' : 'none';
		        }
		
		        function closePanel() {
		            const panel = document.getElementById('slideoutPanel');
		            panel.classList.remove('open');
		            overlay.style.display = 'none';
		        }
		    </script>
	</head>
	
	<body>
	    <header>
	        <h1>TravelPal Dashboard</h1>
	        <h3>Welcome <%= userEmail %>!</h3>
	    </header>
	
	     <nav>
	        <ul>
	            <li><a href="createTrip.jsp">Create Trip</a></li>
	            <%-- View Trips button with action to run back-end first--%>
	            <li><form action="TripViewServlet" method="post">
    			<button type="submit">View My Trips</button>
				</form></li>
	            <li><button onclick="slideoutPanel()">Currency Converter</button></li>
	        </ul>
	    </nav>
	    
	    <div id="slideoutPanel">
	        <button onclick="closePanel()">Close</button>
	        <iframe src="currencyConv.jsp" width="100%" height="100%"></iframe>
	    </div>
	
	    <footer>
	        <p>&copy; Fall 2024 Team 6 TravelPal. All rights reserved.</p>
	    </footer>
	</body>
</html>