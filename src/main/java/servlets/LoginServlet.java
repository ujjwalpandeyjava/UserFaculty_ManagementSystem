package servlets;

import connection.DBConnection;
import entities.UserDetails;
import org.hibernate.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("uEmail");
		String password = request.getParameter("uPassword");
		// no need of transaction as we are not saving anything.

		Session sess = DBConnection.getFactory().openSession();

		UserDetails userDetails = (UserDetails) sess.get(UserDetails.class, email);
		HttpSession logedInDetails = null;
		if (userDetails != null) {
			if (userDetails.getPassword().equals(password)) {
				logedInDetails = request.getSession();
				logedInDetails.setAttribute("logedInUser", userDetails);
				if (userDetails.getUserType().equals("student")) {
					response.sendRedirect("student.jsp");
				} else if (userDetails.getUserType().equals("faculty"))
					response.sendRedirect("faculty.jsp");
				else if (userDetails.getUserType().equals("admin"))
					response.sendRedirect("admin.jsp");
			} else {
				sess.getTransaction().rollback();
				logedInDetails = request.getSession();
				logedInDetails.setAttribute("login-failed", "Wronge Password try again...");
				response.sendRedirect("login.jsp");
			}
		} else {
			logedInDetails = request.getSession();
			logedInDetails.setAttribute("login-failed", "This user does not exists!!!");
			response.sendRedirect("login.jsp");
			System.out.println(
					"Database returned object is empty\n Now we need to create a temp session and send use it to show an alert in the login page that the details does not match. wrong mail id password.");
		}
	}
}