<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelPal Dashboard</title>
    <link rel="stylesheet" href="CSS/dashboard.css">
    <link href="https://fonts.googleapis.com/css2?family=Julius+Sans+One&family=Parkinsans:wght@300..800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="CSS/navbar.css">
    <script>
        function slideoutPanel() {
            const panel = document.getElementById('slideoutPanel');
            const overlay = document.getElementById('overlay');
            panel.classList.toggle('open');
            overlay.style.display = panel.classList.contains('open') ? 'block' : 'none';
        }

        function closePanel() {
            const panel = document.getElementById('slideoutPanel');
            const overlay = document.getElementById('overlay');
            panel.classList.remove('open');
            overlay.style.display = 'none';
        }

        function fetchTrips() {
            fetch('/TravelPal/TripViewServlet', { method: 'POST' })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.text();
                })
                .then(html => {
                    const tempDiv = document.createElement('div');
                    tempDiv.innerHTML = html;

                    const navbar = tempDiv.querySelector('.navbar');
                    if (navbar) {
                        navbar.remove();
                    }

                    const tripsContainer = document.getElementById('tripsContainer');
                    tripsContainer.innerHTML = tempDiv.innerHTML;

                    const tripSection = document.getElementById('tripSection');
                    tripSection.style.display = 'block';
                })
                .catch(error => {
                    console.error('Error fetching trips:', error);
                });
        }
    </script>
</head>
<body>
    <div class="banner">
        <div class="navbar">
            <img src="images/logo.png" class="logo">
            <ul>
                <li><a href="dashboard.jsp">Dashboard</a></li>
                <li><a href="createTrip.jsp">Create Trip</a></li>
                <li><a href="viewAllTrips.jsp">View My Trips</a></li>
                <li><a onclick="slideoutPanel()">Currency Converter</a></li>
            </ul>
        </div>
    </div>

    <div id="overlay" style="display: none;" onclick="closePanel()"></div>

	<div id="slideoutPanel">
	    <button onclick="closePanel()" class="close-btn">×</button>
	    <iframe src="currencyConv.jsp" width="100%" height="100%"></iframe>
	</div>

    <div id="tripsContainer"></div>

    <div id="tripSection" style="display: none;"></div>
</body>
</html>

