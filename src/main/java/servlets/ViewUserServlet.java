package servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ViewUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ViewUserServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside doGet");
		String whoUser = request.getParameter("whoUser");

		// Data from UserDetail.java

		if (whoUser.equals("student")) {
			response.sendRedirect("student.jsp");
		} else if (whoUser.equals("faculty")) {
			response.sendRedirect("faculty.jsp");
		} else {
			response.sendRedirect("admin.jsp");
		}

	}
}
