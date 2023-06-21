package servlets;

import java.io.IOException;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import connection.DBConnection;
import entities.CourseList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UpdateCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateCourseServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("couresID"));
		String title = request.getParameter("cTitle");
		String descr = request.getParameter("cExplination");
		int price = Integer.parseInt(request.getParameter("cPrice"));
		int cDiscount = Integer.parseInt(request.getParameter("cDiscount"));
		String stuLevel = request.getParameter("stuLevel");
		String cLearnTime = request.getParameter("cLearnTime");
		String cCreator = request.getParameter("cCreator");
		String cRequirements = request.getParameter("cRequirements");
		int cGurDays = Integer.parseInt(request.getParameter("cGurDays"));
		String cLang = request.getParameter("cLang");
		String cLanguage = request.getParameter("cLanguage");
		String subjectImage = request.getParameter("subjectImage");

		Session sess = DBConnection.getFactory().openSession();
		Transaction tr = sess.beginTransaction();

		CourseList updateIt = sess.get(CourseList.class, id);
		updateIt.setCourseName(title);
		updateIt.setCouseDescription(descr);
		updateIt.setCoursePrice(price);
		updateIt.setDiscount(cDiscount);
		updateIt.setLevel(stuLevel);
		updateIt.setLearnTime(cLearnTime);
		updateIt.setCreatorName(cCreator);
		updateIt.setRequirements(cRequirements);
		updateIt.setMoneyBackGuaranteeDays(cGurDays);
		updateIt.setLang(cLang);
		updateIt.setLanguage(cLanguage);
		updateIt.setCourseImage(subjectImage);
		updateIt.setUpdatedCourseDate(new Date());
		tr.commit();
		sess.close();
		HttpSession session = request.getSession();
		session.setAttribute("course-delete-success",
				"Course with id: " + id + " updated successfully.");
		response.sendRedirect("adminViewCourses.jsp");

	}

}
