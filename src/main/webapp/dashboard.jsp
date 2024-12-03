<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String userEmail = (session != null) ? (String) session.getAttribute("user") : null;

    if (userEmail == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>TravelPal Dashboard</title>
        <link rel="stylesheet" href="CSS/dashboard.css">
        <link href="https://fonts.googleapis.com/css2?family=Julius+Sans+One&amp;family=Parkinsans:wght@300..800&amp;family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet">
    </head>

    <body>
        <jsp:include page="navbar.jsp" />
        <section class="home">
            <video src="videos/first.mp4" autoplay muted loop></video>
            <video src="videos/roadtrip.mp4" autoplay muted loop></video>
            <video src="videos/plane.mp4" autoplay muted loop></video>
            <video src="videos/hotels.mp4" autoplay muted loop></video>
            <video src="videos/beach.mp4" autoplay muted loop></video>
            <video src="videos/lake.mp4" autoplay muted loop></video>
            <video src="videos/hiking.mp4" autoplay muted loop></video>
            <div class="content">
                <h1>Welcome<br><span><%= userEmail %>!</span></h1>
                <p id="videoText"></p>
            </div>
            <div class="slider-nav">
                <div class="navbtn active"></div>
                <div class="navbtn"></div>
                <div class="navbtn"></div>
                <div class="navbtn"></div>
                <div class="navbtn"></div>
                <div class="navbtn"></div>
                <div class="navbtn"></div>
            </div>
        </section>
        
        <script>
            const btns = document.querySelectorAll(".navbtn");
            const videos = document.querySelectorAll(".home video");
            const videoText = document.getElementById("videoText");
            const texts = [
                "Explore the beautiful landscapes.",
                "Gear up for an exciting road trip.",
                "Book a flight and take to the skies.",
                "Keep track of important hotel details all in one spot.",
                "Feel the tranquility of a beach vacation.",
                "Experience the calm of a serene lake.",
                "Go on a thrilling hike in the mountains."
            ];
            let currentIndex = 0;

            const changeVideo = (index) => {
                videos.forEach((video, i) => {
                    video.style.display = i === index ? 'block' : 'none';
                });

                btns.forEach((btn, i) => {
                    btn.classList.remove("active");
                    if (i === index) {
                        btn.classList.add("active");
                    }
                });

                videoText.textContent = texts[index];
            };

            btns.forEach((btn, i) => {
                btn.addEventListener("click", () => {
                    currentIndex = i;
                    changeVideo(currentIndex);
                });
            });

            setInterval(() => {
                currentIndex = (currentIndex + 1) % videos.length;
                changeVideo(currentIndex);
            }, 5000);
        </script>
        <jsp:include page="footer.jsp" />
    </body>
</html>
