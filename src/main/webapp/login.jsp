<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="login.css"> 
</head>
<body>
    <div class="login-page">
        <div class="form">
        	<!-- Login Form -->
            <form class="login-form" action="Auth" method="post">
            	<input type="hidden" name="action" value="login"> <!-- important: specifies login --> 
                <input type="text" name="email" placeholder="Email" required/>
                <input type="password" name="password" placeholder="Password" required/>
                <button type="submit">Login</button>
                <p class="message">Not registered? <a href="createAccount.jsp">Create an account</a></p> <!-- Changed to link to register form -->
            </form>
        </div>
    </div>
</body>
</html>

