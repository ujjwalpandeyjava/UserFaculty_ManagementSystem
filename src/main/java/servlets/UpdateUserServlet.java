package servlets;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import connection.DBConnection;
import entities.UserDetails;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@MultipartConfig
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateUserServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		// Accepting file
		// Part profilePic = request.getPart("uProfilePic");
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
			if (uType != null)
				udu.setUserType(uType);
			udu.setHouseNo(uHouse);
			udu.setLandMark(uLandMark);
			udu.setCity(uCity);
			udu.setState(uState);
			udu.setPinCode(uPinCode);
			// String fileName = profilePic.getSubmittedFileName().replace(" ",
			// "_");
			// udu.setImagePath(fileName);
			// Pic upload
			// InputStream ins = profilePic.getInputStream();
			sess.update(udu);
			tr.commit();
			sess.close();
			String previousPageUrl = request.getParameter("previousPageUrl");
			response.sendRedirect(previousPageUrl);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}