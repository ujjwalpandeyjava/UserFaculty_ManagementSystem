package servlets;

import java.io.IOException;

import org.hibernate.Session;

import connection.DBConnection;
import entities.CourseList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
public class DeleteCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public DeleteCourse() {
		super();
	}
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		Session sess = DBConnection.getFactory().openSession();
		int cId = Integer.parseInt(request.getParameter("courseID"));
		sess.beginTransaction();
		CourseList cl = new CourseList();
		cl.setCourseID(cId);

		sess.delete(cl);

		sess.getTransaction().commit();
		sess.close();

		HttpSession session = null;
		session = request.getSession();
		session.setAttribute("course-delete-success",
				"Course with course id - " + cId + " deleted successfuly");
		response.sendRedirect("adminViewCourses.jsp");

	}

}
