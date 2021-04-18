package servlets;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import connection.DBConnection;
import entities.UserDetails;

public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public DeleteUserServlet() {
		super();
	}
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("courseID");

		Session sess = DBConnection.getFactory().openSession();
		Transaction tr = sess.beginTransaction();

		String hql = "delete from userdetails where email = :email ";
		UserDetails userDelete = new UserDetails();
		boolean result = false;
		result = deleteByEmail(userDelete, email, sess);

		System.out.println(result);
		tr.commit();
		sess.close();
		HttpSession session = null;
		session = request.getSession();
		System.out.println("Sess closed and session if starts here.");
		if (!!result) {
			System.out.println("inside sis ,Before email add");
			System.out.println("insied sis o add -- " + email);
			System.out.println("after sis");
			session.setAttribute("Users-Success",
					"User with email: '" + email + "' deleted successfully!");
			System.out.println("Attriburte set success.");
		} else {
			System.out.println("delete failed.");
			session.setAttribute("Users-Success", "User with email: '" + email
					+ "' not deleted successfully!");
			System.out.println("Att set succss.");
		}
		response.sendRedirect("adminViewUsers.jsp");
		System.out.println("Redirected succes.");
	}

	boolean deleteByEmail(UserDetails type, String email, Session sess) {
		Object persistentInstance = sess.load(type.getClass(), email);
		if (persistentInstance != null) {
			sess.delete(persistentInstance);
			return true;
		}
		return false;
	}

}
