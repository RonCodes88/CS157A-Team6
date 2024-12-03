
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ActivityViewServlet
 */
@WebServlet("/ActivityViewServlet")
public class ActivityViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ActivityViewServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String userEmail = (session != null) ? (String) session.getAttribute("user") : null;

		int tripId = Integer.parseInt(request.getParameter("tripID"));

		TripActivitiesDao tripActivities = new TripActivitiesDao();
		// Get all the activities from the TripID
		List<Activity> activities = tripActivities.viewActivityToTrip(tripId);

		List<Map<String, Object>> activityData = new ArrayList<>();

		for (Activity activity : activities) {
			Map<String, Object> map = new HashMap<>();
			map.put("activityID", activity.getActivityID());
			map.put("activityName", activity.getActivityName());
			map.put("activityDesc", activity.getActivityDesc());
			map.put("price", activity.getPrice());
			
			activityData.add(map);
		}
		
	    // Set attribute with the activity data
	    request.setAttribute("activityData", activityData);
	    request.setAttribute("tripId", tripId);
	    
	    // Send the trip data to viewAllTrips.jsp front-end
	    RequestDispatcher dispatcher = request.getRequestDispatcher("viewActivity.jsp");
	    
	    dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int activityID = Integer.parseInt(request.getParameter("activityID"));
		int tripID = Integer.parseInt(request.getParameter("tripID"));
		
		TripActivitiesDao tripActivitiesDao = new TripActivitiesDao();
		boolean isActivityDeleted = tripActivitiesDao.deleteActivityFromTrip(activityID, tripID);
		
        if (isActivityDeleted) {
            response.sendRedirect("ActivityViewServlet?tripID=" + tripID);
        } else {
            response.getWriter().println("Failed to delete from your trip. Please try again.");
        }

	}
	

}