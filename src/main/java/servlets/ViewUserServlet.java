package servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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
            // Get only faculty data from database

        } else if (whoUser.equals("faculty")) {
            // Get only faculty data from database

        } else {
            // For all data from database
        }

        // Send response and data to the page 'adminViewUser.jsp'

    }
}
