package servlets;

import java.io.IOException;

import org.hibernate.Session;

import connection.DBConnection;
import entities.UserDetails;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ForgetPass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ForgetPass() {
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String uEmail = request.getParameter("uEmail");
		System.out.println(uEmail);
		Session openSession = DBConnection.getFactory().openSession();
		UserDetails persist = openSession.get(UserDetails.class, uEmail);
		openSession.close();
		if (persist != null) {
			String mm = "";
			int len = persist.getPassword().length();
			for (int i = 0; i < len - 5; i++) {
				mm += '*';
			}
			String s = persist.getPassword().substring(0, 2) + mm
					+ persist.getPassword().substring(len - 3, len);
			response.sendRedirect("forget.jsp?p=" + s);
		} else {
			HttpSession sess = request.getSession();
			sess.setAttribute("userNotFound", "User Not Found");
			response.sendRedirect("forget.jsp");
		}
	}

}
