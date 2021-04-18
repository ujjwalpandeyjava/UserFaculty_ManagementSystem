package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import connection.DBConnection;
import entities.CourseList;
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
