package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import connection.DBConnection;
import entities.CourseList;

public class AddCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddCourseServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String title = (String) request.getParameter("cTitle");
		String description = (String) request.getParameter("cExplination");
		String image = (String) request.getParameter("subjectImage");
		int price = Integer.parseInt(request.getParameter("cPrice"));

		CourseList cl;
		cl = new CourseList(title, description, image, price, new Date());
		//System.out.println(cl.toString());

		Session sess = DBConnection.getFactory().openSession();
		sess.beginTransaction();

		sess.save(cl);

		sess.getTransaction().commit();
		sess.close();

		HttpSession session = null;

		session = request.getSession();
		session.setAttribute("course-added", "New coures " + title + " added");
		response.sendRedirect("admin.jsp");

	}

}
