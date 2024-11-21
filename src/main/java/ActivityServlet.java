import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * Servlet implementation for ActivityServlet, connecting the createActivity.jsp and ActivityDao
 */
@WebServlet("/ActivityServlet")
public class ActivityServlet extends HttpServlet 
{
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActivityServlet() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession(false);
        String userEmail = (session != null) ? (String) session.getAttribute("user") : null;

        if (userEmail == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if the user is not logged in
            return;
        }

        //NOT SURE HOW TO RETRIEVE TRIPID YET
        //

        // Retrieve input parameters from the form
        String activityName = request.getParameter("activityName");
        String activityDesc = request.getParameter("activityDesc");
        int price = Integer.parseInt(request.getParameter("price"));

        // Create an Activity object from the input values
        Activity activity = new Activity(activityName, activityDesc, price);
        ActivityDao activityDao = new ActivityDao();
        int activityId = activityDao.addActivity(activity); 
        
        // Add activity to CreateCustomActivities to Associate the Activity with the Trip *NOT IMPLEMENTED YET*
        //CreateCustomActivitiesDao createCustomActivitiesDao = new CreateCustomActivitiesDao();
        //boolean isActivityLinked = createCustomActivitiesDao.addCreateCustomActivities(activityId, tripId);
        
        
        //CHANGE TO isActivityLinked LATER ON, ONCE TRIPID CAN BE RETRIEVED
        if (activityId != 0) {
            response.getWriter().println("Activity created and linked to your trip successfully.");
            response.sendRedirect("dashboard.jsp");
        } else {
            response.getWriter().println("Failed to link the activity to your trip. Please try again.");
        }
    }
}
