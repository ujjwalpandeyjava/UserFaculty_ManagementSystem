package servlets;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import connection.DBConnection;
import entities.UserDetails;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteUserServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		try {
			String email = request.getParameter("courseID");

			Session sess = DBConnection.getFactory().openSession();
			Transaction tr = sess.beginTransaction();

			UserDetails userDelete = new UserDetails();
			userDelete.setEmail(email);
			int check = 10;
			UserDetails persist = sess.load(UserDetails.class, email);
			String utype2 = persist.getUserType();

			if (persist != null) {
				sess.delete(persist);
				check = 1;
			}
			tr.commit();
			sess.close();
			HttpSession session = null;
			if (check == 1) {
				session = request.getSession();
				session.setAttribute("Users-Success", "User with email: '"
						+ email + "' deleted successfully!");
			} else {
				session = request.getSession();
				session.setAttribute("Users-Success", "User with email: '"
						+ email + "' not deleted successfully!");
			}
			response.sendRedirect("adminViewUsers.jsp?whoUser=" + utype2 + "");
			// response.sendRedirect("adminViewCourses.jsp");
			System.out.println("Redirected succes.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
