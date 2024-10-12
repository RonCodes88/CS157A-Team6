

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
//	String email = request.getParameter("email");
//	String password = request.getParameter("password");
//	Member member = new Member(email, password);
//	RegisterDao rDao = new RegisterDao();
//	String result = rDao.insert(member);
//	//Display info message on browser
//	response.getWriter().println(result);
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

        if ("register".equals(action)) {
            handleRegistration(request, response);
        } else if ("login".equals(action)) {
            handleLogin(request, response);
        } else {
            response.sendRedirect("login.jsp?error=Invalid action");
        }
	}
	
	private void handleRegistration(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
        String password = request.getParameter("password");
        String currency = request.getParameter("currency");
        String language = request.getParameter("language");
        
        User user = new User(email, password, currency, language);
        UserDao userDao = new UserDao();
        userDao.register(user);
        
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
	    	 response.getWriter().println("Log in Success!");
	     }
	     else {
	    	 response.getWriter().println("Log in Failed!");
	     }
	     
	}

}
