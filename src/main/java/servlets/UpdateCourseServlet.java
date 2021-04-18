package servlets;

import connection.DBConnection;
import entities.CourseList;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class UpdateCourseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateCourseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub

        String title = request.getParameter("cTitle");
        String descr = request.getParameter("cExplination");
        int price = Integer.parseInt(request.getParameter("cPrice"));
        int id = Integer.parseInt(request.getParameter("couresID"));

        // CourseList todo = new CourseList(title, descr, price);

        Session sess = DBConnection.getFactory().openSession();
        Transaction tr = sess.beginTransaction();

        CourseList updateIt = sess.get(CourseList.class, id);
        updateIt.setCourseName(title);
        updateIt.setCouseDescription(descr);
        updateIt.setCoursePrice(price);
        tr.commit();
        sess.close();
        HttpSession session = request.getSession();
        session.setAttribute("course-delete-success",
                "Course with id: " + id + " updated successfully.");
        response.sendRedirect("adminViewCourses.jsp");

    }

}
