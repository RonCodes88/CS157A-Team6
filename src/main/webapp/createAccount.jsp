<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Creation Page</title>
    <link rel="stylesheet" href="CSS/createAccount.css"> 
</head>
<body>
     <div class="create-account">

        <div class="form">
        <h2>Create An Account</h2>
            <!-- Register Form -->
            <form class="register-form" action="Auth" method="post">
            	<input type="hidden" name="action" value="register"> <!-- important: specifies register --> 
                <input type="email" name="email" placeholder="Email Address" required/>
                <input type="password" name="password" placeholder="Password" required title="Password must be at least 12 characters long, include uppercase and lowercase letters, numbers, and symbols."/>
                
                <!-- User Preferences -->
                <label for="currency">Preferred Currency:</label>
                <br></br>
                <select name="currency" id="currency" required>
                    <option value="" disabled selected>Select Currency</option>
                    <option value="AUD">Australian Dollar (AUD)</option>
                    <option value="CAD">Canadian Dollar (CAD)</option>
                    <option value="CHF">Swiss Franc (CHF)</option>
                    <option value="CNY">Chinese Yuan (CNY)</option>
                    <option value="EUR">Euro (EUR)</option>
                    <option value="GBP">British Pound (GBP)</option>
                    <option value="HKD">Hong Kong Dollar (HKD)</option>
                    <option value="INR">Indian Rupee (INR)</option>
                    <option value="JPY">Japanese Yen (JPY)</option>
                    <option value="NZD">New Zealand Dollar (NZD)</option>
                    <option value="USD">United States Dollar (USD)</option>
                    <option value="ZAR">South African Rand (ZAR)</option>
                </select>

                <label for="language">Preferred Language:</label>
                <br></br>
                <select name="language" id="language" required>
                    <option value="" disabled selected>Select Language</option>
                    <option value="Arabic">Arabic</option>
                    <option value="Chinese (Simplified)">Chinese (Simplified)</option>
                    <option value="Chinese (Traditional)">Chinese (Traditional)</option>
                    <option value="English">English</option>
                    <option value="French">French</option>
                    <option value="German">German</option>
                    <option value="Hindi">Hindi</option>
                    <option value="Italian">Italian</option>
                    <option value="Japanese">Japanese</option>
                    <option value="Korean">Korean</option>
                    <option value="Portuguese">Portuguese</option>
                    <option value="Russian">Russian</option>
                    <option value="Spanish">Spanish</option>
                    <option value="Turkish">Turkish</option>
                </select>

                <button type="submit">Create Account</button>
                <p class="message">Already registered? <a href="login.jsp">Sign In</a></p> 
            </form>
        </div>
    </div>
</body>
</html>