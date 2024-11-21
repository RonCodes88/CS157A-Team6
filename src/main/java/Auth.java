
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Auth
 */
@WebServlet("/Auth")
public class Auth extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Auth() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if ("register".equals(action)) {
			handleRegistration(request, response);
		} else if ("login".equals(action)) {
			handleLogin(request, response);
		} else {
			response.sendRedirect("login.jsp?error=Invalid action");
		}
	}

	private void handleRegistration(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String currency = request.getParameter("currency");
		String language = request.getParameter("language");

		UserDao userDao = new UserDao();

		if (email.contains("@travelpal.org")) {
			User admin = new User(email, password, currency, language, "admin");
			userDao.register(admin);
		} else {
			User user = new User(email, password, currency, language, "regular user");
			userDao.register(user);
		}
		response.sendRedirect("home.html");
	}

	private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println(email);
		System.out.println(password);

		UserDao userDao = new UserDao();
		boolean isValidUser = userDao.validateUser(email, password);

		if (isValidUser) {
			HttpSession session = request.getSession(true); // Create a new session if one doesn't exist
			session.setAttribute("user", email);
			response.sendRedirect("dashboard.jsp"); // Redirect to dashboard
		} else {
			response.sendRedirect("login.jsp?error=Invalid%20email%20or%20password");
		}
	}

}
