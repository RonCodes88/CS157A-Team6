<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="CSS/login.css"> 
</head>
<body>
    <div class="login-container">
        <div class="login-box">
            <!-- Image Section -->
            <div class="login-image">
                <img src="./images/view.jpg" alt="Login Image">
            </div>
            
            <!-- Login Form Section -->
            <div class="login-form">
                <h2>Login</h2>
                <!-- Error Message -->
                <%
                    String errorMessage = request.getParameter("error");
                    if (errorMessage != null && !errorMessage.isEmpty()) {
                %>
                    <p class="error-message"><%= errorMessage %></p>
                <%
                    }
                %>
                <!-- Login Form -->
                <form action="Auth" method="post">
                    <input type="hidden" name="action" value="login">
                    <input type="text" name="email" placeholder="Email" required/>
                    <input type="password" name="password" placeholder="Password" required/>
                    <button type="submit">Login</button>
                    <p class="message">Not registered? <a href="createAccount.jsp">Create an account</a></p>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
