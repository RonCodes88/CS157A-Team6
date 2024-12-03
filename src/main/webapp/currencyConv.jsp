<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Currency Converter Calculator</title>
    <link rel="stylesheet" href="CSS/currencyConv.css">
    <link href="https://fonts.googleapis.com/css2?family=Julius+Sans+One&amp;family=Parkinsans:wght@300..800&amp;family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet"> 
</head>
<body>
    <div class="container">
        <h2>Currency Converter Calculator</h2>
        <form id="currencyForm">
            <label for="amount">Amount:</label>
            <input type="number" id="amount" name="amount" placeholder="Enter amount" required>

            <label for="startCurrency">From (Base Currency):</label>
            <select id="startCurrency" name="startCurrency" required>
                    <option value="aud">Australian Dollar (AUD)</option>
                    <option value="cad">Canadian Dollar (CAD)</option>
                    <option value="chf">Swiss Franc (CHF)</option>
                    <option value="cny">Chinese Yuan (CNY)</option>
                    <option value="eur">Euro (EUR)</option>
                    <option value="gbp">British Pound (GBP)</option>
                    <option value="hkd">Hong Kong Dollar (HKD)</option>
                    <option value="inr">Indian Rupee (INR)</option>
                    <option value="jpy">Japanese Yen (JPY)</option>
                    <option value="nzd">New Zealand Dollar (NZD)</option>
                    <option value="usd">United States Dollar (USD)</option>
                    <option value="zar">South African Rand (ZAR)</option>
            </select>
            <label for="resultCurrency">To (Target Currency):</label>
            <select id="resultCurrency" name="resultCurrency" required>
                    <option value="aud">Australian Dollar (AUD)</option>
                    <option value="cad">Canadian Dollar (CAD)</option>
                    <option value="chf">Swiss Franc (CHF)</option>
                    <option value="cny">Chinese Yuan (CNY)</option>
                    <option value="eur">Euro (EUR)</option>
                    <option value="gbp">British Pound (GBP)</option>
                    <option value="hkd">Hong Kong Dollar (HKD)</option>
                    <option value="inr">Indian Rupee (INR)</option>
                    <option value="jpy">Japanese Yen (JPY)</option>
                    <option value="nzd">New Zealand Dollar (NZD)</option>
                    <option value="usd">United States Dollar (USD)</option>
                    <option value="zar">South African Rand (ZAR)</option>
            </select>
            <button type="submit">Convert</button>
        </form>
        <h3 id="result"></h3>
    </div>
    <script src="currencyConv.js"></script>
</body>
</html>
