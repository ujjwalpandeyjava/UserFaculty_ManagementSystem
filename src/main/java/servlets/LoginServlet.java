package servlets;

import java.io.IOException;

import org.hibernate.Session;

import connection.DBConnection;
import entities.UserDetails;
import enums.UserType;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
				if (userDetails.getUserType().equals(UserType.LEARNER.getUserType())) {
					response.sendRedirect("student.jsp");
				} else if (userDetails.getUserType().equals(UserType.FACULTY.getUserType()))
					response.sendRedirect("faculty.jsp");
				else if (userDetails.getUserType().equals(UserType.SUPERADMIN.getUserType()))
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