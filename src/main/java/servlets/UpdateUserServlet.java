package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import connection.DBConnection;
import entities.UserDetails;

public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateUserServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String fName = request.getParameter("uFirstName");
		String lName = request.getParameter("uLastName");
		String uEmail = request.getParameter("uEmail");
		String password = request.getParameter("uPassword");
		String uType = request.getParameter("uType");
		String uContact = request.getParameter("uContact");
		String uHouse = request.getParameter("uHouse");
		String uLandMark = request.getParameter("uLandmark");
		String uCity = request.getParameter("uCity");
		String uState = request.getParameter("uState");
		String uPinCode = request.getParameter("uPinCode");

		try {
			Session sess = DBConnection.getFactory().openSession();
			Transaction tr = sess.beginTransaction();

			UserDetails udu = new UserDetails();
			udu = (UserDetails) sess.get(UserDetails.class, uEmail);

			udu.setEmail(uEmail);
			udu.setFirstName(fName);
			udu.setLastName(lName);

			udu.setPassword(password);
			udu.setContactNumber(uContact);
			udu.setUserType(uType);
			udu.setHouseNo(uHouse);
			udu.setLandMark(uLandMark);
			udu.setCity(uCity);
			udu.setState(uState);
			udu.setPinCode(uPinCode);

			sess.update(udu);
			System.out.println("updated");
			tr.commit();
			sess.close();
			String previousPageUrl = request.getParameter("previousPageUrl");
			response.sendRedirect(previousPageUrl);
			//System.out.println(previousPageUrl);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
