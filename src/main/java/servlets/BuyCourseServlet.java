package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import connection.DBConnection;
import entities.BoughtCourses;
import entities.CourseList;

public class BuyCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BuyCourseServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String userId = request.getParameter("userId");
		HttpSession session = null;
		session = request.getSession();
		CourseList cl = (CourseList) session.getAttribute("courseDetails");
		try {
			Session sess = DBConnection.getFactory().openSession();
			Transaction tr = sess.beginTransaction();
			BoughtCourses bcCourse = new BoughtCourses(cl.getCourseID(),
					cl.getCourseName(), cl.getCouseDescription(),
					cl.getCourseImage(),
					cl.getCoursePrice()
							- cl.getDiscount() * cl.getCoursePrice() / 100,
					userId);
			sess.save(bcCourse);
			tr.commit();
			sess.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.setAttribute("CourseBought",
				"Course '" + cl.getCourseName() + "' bought successfully.");
		response.sendRedirect("courses.jsp");
	}

}
