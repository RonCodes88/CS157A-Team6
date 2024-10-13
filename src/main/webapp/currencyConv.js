document.getElementById('currencyForm').addEventListener('submit', function(event) {
	event.preventDefault();
	

	// Get input from the form inputs (currencyConv.jsp)
	const amount = document.getElementById('amount').value;
	const startCurrency = document.getElementById('startCurrency').value; // Starting currency
	const resultCurrency = document.getElementById('resultCurrency').value; // Resulting currency

	fetchCurrencyData(startCurrency)
		.then(function(data) {  //return data of function (json file) 
			if (data && data[startCurrency] && data[startCurrency][resultCurrency]) { // If json file exist, if json has starting currency index, if json has targeted currency within index of start currency
				const rate = data[startCurrency][resultCurrency]; // Retrieve rate of exhange of starting currency to result currency
				const convertedAmount = (amount * rate).toFixed(2); // convert the currency
				
				document.getElementById('result').innerText = //store results in result
				amount + ' ' + startCurrency + ' = ' + convertedAmount + ' ' + resultCurrency;
					
			} 
			
			else {
				document.getElementById('result').innerText = 'Error, conversion not available.';
			}
		})
		.catch(function(error) { //If cannot fetch the conversion rates in URL
			document.getElementById('result').innerText = 'Error fetching the conversion rate';
			console.error(error);
		});
});


async function fetchCurrencyData(startCurrency) {
	
	const url = 'https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/currencies/' + startCurrency + '.json';

	try { //fetch data from link

		const response = await fetch(url);

		if (!response.ok) {
			throw new Error('Primary URL failed: ' + response.statusText);
			
		}
		return await response.json();
	} 
	catch (error) {
		console.error('url failed', error.message);
	}

} 
