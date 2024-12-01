<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Searching for flights...</title>
<script>
        function checkProcessingStatus() {
            fetch('/TravelPal/flight_redirect')
                .then(response => {
                	console.log('Redirect status:', response.redirected, 'URL:', response.url);
                    if (response.redirected) {
                        window.location.href = response.url;  // Redirect to flightDetails.jsp if processing is complete
                    }
                })
                .catch(error => console.error('Error checking processing status:', error));
        }

        setInterval(checkProcessingStatus, 5000);
</script>
<link rel="stylesheet" href="CSS/flightsLoading.css">
</head>
<body>
	<div class="loading-screen">
		<div class="plane-container">
			<span class="emoji">🌍</span> 
			<span class="emoji">✈️</span> 
			<span class="emoji">🌎</span>
		</div>
		<div class="loader"></div>
		<p>Searching For Flights...</p>
	</div>
</body>
</html>
