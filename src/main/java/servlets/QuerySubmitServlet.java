package servlets;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import connection.DBConnection;
import entities.QueryFromForm;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class QuerySubmitServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public QuerySubmitServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String queryHeading = request.getParameter("queryHead");
        String query = request.getParameter("queryExplained");

        QueryFromForm q = new QueryFromForm(name, email, contact, queryHeading,
                query);

        Session session = DBConnection.getFactory().openSession();
        Transaction tr = session.beginTransaction();

        session.save(q);
        HttpSession sessionh = request.getSession();
        sessionh.setAttribute("querySubmited",
                "Query submitted we will reach you soon.");
        response.sendRedirect("contact.jsp");

        tr.commit();
        session.close();

    }

}
