import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/*
 * Servlet implementation for ActivitySuggestServlet, connecting the createActivitySuggest.jsp and ActivityDao
 */
@WebServlet("/ActivitySuggestServlet")
public class ActivitySuggestServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		int tripId = Integer.parseInt(request.getParameter("tripID"));

		String activityName = request.getParameter("activityName");
		String activityDesc = request.getParameter("activityDesc");
		int price = Integer.parseInt(request.getParameter("activityPrice"));
		Activity toAdd = new Activity(0, activityName, activityDesc, price);
		ActivityDao activityDao = new ActivityDao();
		int activityId = activityDao.addActivity(toAdd);

		TripActivitiesDao tripActivitiesDao = new TripActivitiesDao();
		boolean isActivityLinked = tripActivitiesDao.addActivityToTrip(activityId, tripId);

		if (isActivityLinked) {
			response.getWriter().println("Activity created and linked to your trip successfully.");
			response.sendRedirect("ActivityViewServlet?tripID=" + tripId);
		} else {
			response.getWriter().println("Failed to link the activity to your trip. Please try again.");
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int tripID = Integer.parseInt(request.getParameter("tripID"));
		String dest = "";
		ActivityDao actDaoSearch = new ActivityDao();
		dest = actDaoSearch.searchTrip(tripID);

		try {
			// Generate activities
			List<Map<String, Object>> activities = ActivitySuggestService.generateSuggestedActivities(dest);

			// Store activities in request scope
			request.setAttribute("activities", activities);

			// Create an Activity object from the input values
			for (Map<String, Object> activity : activities) {
				Activity toAdd = new Activity(0, (String) activity.get("activityName"),
						(String) activity.get("activityDescription"), (int) activity.get("activityPrice"));
				ActivityDao activityDao = new ActivityDao();
				activityDao.addSuggestActivity(toAdd);
			}

			// Forward to JSP
			RequestDispatcher dispatcher = request.getRequestDispatcher("/createActivitySuggest.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Failed to generate suggested activities.");
		}
	}
}

