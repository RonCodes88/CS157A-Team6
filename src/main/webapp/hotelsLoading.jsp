<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Searching for hotels...</title>
<script>
        function checkProcessingStatus() {
            fetch('/TravelPal/hotel_redirect')
                .then(response => {
                	console.log('Redirect status:', response.redirected, 'URL:', response.url);
                    if (response.redirected) {
                        window.location.href = response.url;  // Redirect to hotelDetails.jsp if processing is complete
                    }
                })
                .catch(error => console.error('Error checking processing status:', error));
        }

        setInterval(checkProcessingStatus, 5000);
</script>
<link rel="stylesheet" href="CSS/hotelsLoading.css">
</head>
<body>
	<div class="loading-screen">
		<div class="hotel-container">🛎️🛏️🛋️</div>
		<div class="loader"></div>
		<p>Searching For Hotels...</p>
	</div>
</body>
</html>