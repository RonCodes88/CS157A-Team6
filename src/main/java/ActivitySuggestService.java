import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

public class ActivitySuggestService {
	static String url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=";
	static String apiKey = System.getenv("google_gemini_key");

	public static List<Map<String, Object>> generateSuggestedActivities(String location)
			throws IOException, InterruptedException {
		HttpClient client = HttpClient.newHttpClient();

		// Construct the JSON payload
		String prompt = "Generate 9 travel activities for the location: " + location
				+ ". Include activity name, description, and price (no range, with dollar sign symbol) for each activity. Return Json. Be concise. Please follow the format of-> Activity Name: Price: Activity Description:";
		JSONObject content = new JSONObject().put("text", prompt);
		JSONObject requestBody = new JSONObject();
		requestBody.put("contents", new JSONArray().put(new JSONObject().put("parts", new JSONArray().put(content))));

		// Create the HTTP request
		HttpRequest request = HttpRequest.newBuilder().uri(URI.create(url + apiKey))
				.header("Content-Type", "application/json")
				.POST(HttpRequest.BodyPublishers.ofString(requestBody.toString())).build();

		// Send the request and get the response
		HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

		// Log the raw response
		System.out.println("Raw API Response:");
		System.out.println(response.body());

		if (response.statusCode() != 200) {
			throw new IOException("Failed to fetch activities: " + response.body());
		}

		// Parse the response and return activities
		return parseActivities(response.body());
	}

	private static List<Map<String, Object>> parseActivities(String responseBody) {
		List<Map<String, Object>> activities = new ArrayList<>();
		JSONObject jsonResponse = new JSONObject(responseBody);

		// Extract the candidates array
		JSONArray candidates = jsonResponse.getJSONArray("candidates");
		if (candidates.isEmpty()) {
			return activities; // Return empty list if no candidates
		}

		// Extract the text from the first candidate's content.parts array
		JSONObject candidate = candidates.getJSONObject(0);
		JSONObject content = candidate.getJSONObject("content");
		JSONArray parts = content.getJSONArray("parts");
		if (parts.isEmpty()) {
			return activities; // Return empty list if no parts
		}

		String generatedText = parts.getJSONObject(0).getString("text");

		// Strip the JSON block from the triple backticks and parse the JSON part
		String jsonText = generatedText.replace("```json", "").replace("```", "").trim();

		// Parse the cleaned JSON string into an array of activities
		JSONArray activityArray = new JSONArray(jsonText);

		// Loop through each activity and extract details
		for (int i = 0; i < activityArray.length(); i++) {
			JSONObject activity = activityArray.getJSONObject(i);

			// Extract activity name, price, and description
			String name = activity.getString("Activity Name").trim();
			String priceString = activity.getString("Price");
			String description = activity.getString("Activity Description").trim();

			// Clean up price (remove non-numeric characters, e.g., "$")
			priceString = priceString.replaceAll("[^\\d]", ""); // Remove non-digit characters (including '$')

			int price = 0;
			try {
				price = Integer.parseInt(priceString);
			} catch (NumberFormatException e) {
				// If parsing fails, use 0 as default
				price = 0;
			}

			// Add formatted activity to the list
			activities.add(Map.of("activityName", name, "activityPrice", price, "activityDescription", description));
		}

		return activities;
	}
}