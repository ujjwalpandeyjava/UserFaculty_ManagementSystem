package servlets;

import java.io.IOException;

import entities.UserDetails;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LogoutServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();

			UserDetails attribute = (UserDetails) session
					.getAttribute("logedInUser");
			if (attribute != null) {
				session.removeAttribute("logedInUser");
				session.setAttribute("logout-msg", "Logout sucessfull...");
			}
			response.sendRedirect("login.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			UserDetails attribute = (UserDetails) session
					.getAttribute("logedInUser");
			if (attribute != null) {
				session.removeAttribute("logedInUser");
				session.setAttribute("logout-msg", "Logout sucessfull...");
			}
			response.sendRedirect("login.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
