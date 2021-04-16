package servlets;

import java.io.IOException;
import java.io.Serializable;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.exception.ConstraintViolationException;

import connection.DBConnection;
import entities.UserDetails;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public RegisterServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = null;
		try {
			String uFirstName = request.getParameter("uFirstName");
			String uLastName = request.getParameter("uLastName");
			String uEmail = request.getParameter("uEmail");
			String uPassword = request.getParameter("uPassword");
			String uType = request.getParameter("uType");

			Session sess = DBConnection.getFactory().openSession();

			UserDetails userDetails = (UserDetails) sess.get(UserDetails.class,
					uEmail);
			if (userDetails != null) {
				session = request.getSession();
				// Will execute when connection with database is failed due to
				// various reason.
				session.setAttribute("reg-failed", "This user email '" + uEmail
						+ "' is already in use take something else.");
				response.sendRedirect("register.jsp");
			} else {
				UserDetails uDetails;
				if (uType != null) {

					uDetails = new UserDetails(uFirstName, uLastName, uEmail,
							uPassword, new Date(), uType);
					// DBConnection gives the factory.
					// Create session from the factory.

					// Create a transaction from the session.
					Transaction tr = sess.beginTransaction();
					// or sess.beginTransaction();

					Serializable iddd = sess.save(uDetails);
					System.out.println(iddd);

					tr.commit();
					// or sess.getTransaction().commit();
					sess.close();

					session = request.getSession();
					session.setAttribute("reg-sucess",
							"New '" +uType +"' Registered Sucesfull");
					response.sendRedirect("admin.jsp");
				} else {

					uDetails = new UserDetails(uFirstName, uLastName, uEmail,
							uPassword, new Date(), "student");
					// DBConnection gives the factory.
					// Create session from the factory.

					// Create a transaction from the session.
					Transaction tr = sess.beginTransaction();
					// or sess.beginTransaction();

					Serializable iddd = sess.save(uDetails);
					System.out.println(iddd);

					tr.commit();
					// or sess.getTransaction().commit();
					sess.close();

					session = request.getSession();
					session.setAttribute("reg-sucess",
							"Registration Sucesfull");
					response.sendRedirect("register.jsp");
				}

			}
		} catch (ConstraintViolationException cve) {
			System.out.println("Duplicate maal");
		} catch (Exception e) {
			System.out.println("2nd exception is thrown\n");
			e.printStackTrace();
			session = request.getSession();
			// Will execute when connection with database is failed due to
			// various reason.
			session.setAttribute("reg-failed",
					"Registration Unsucessful, Something went wrong with server!! Come back in 10 min....");
			response.sendRedirect("register.jsp");
		}
	}
}
