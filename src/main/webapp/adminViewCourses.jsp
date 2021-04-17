<%@page import="org.hibernate.Query"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="entities.CourseList"%>
<%@page import="org.hibernate.Session"%>
<%@page import="connection.DBConnection"%>
<%
UserDetails userDetails1 = (UserDetails) session.getAttribute("logedInUser");
if ((userDetails1 == null) || (!userDetails1.getUserType().equals("admin"))) {
	session.setAttribute("login-failed",
	"Only Admin can acess this page. Login as admin");
	response.sendRedirect("LogoutServlet");
	//response.sendRedirect("login.jsp");
}
%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Faculty | DevelpersPoint</title>
</head>
<body>
	<%@include file="common/navbar.jsp"%>
	<%
	Session sess = DBConnection.getFactory().openSession();
	sess.beginTransaction();
	Criteria criteria = sess.createCriteria(CourseList.class);
	List<CourseList> col = criteria.list();
	%>
	<div class="container-fluid my-4">
		<table class="table">
			<thead class="thead-light">
				<tr>
					<th scope="col">Course Id</th>
					<th scope="col">Title</th>
					<th scope="col">Price</th>
					<th scope="col">Description</th>
					<th scope="col">Subject</th>
					<th scope="col">Edit</th>
					<th scope="col">Delete</th>
				</tr>
			</thead>
			<tbody>
				<%
				Iterator<CourseList> itr = col.iterator();
				while (itr.hasNext()) {
					CourseList cl = itr.next();
				%>
				<tr>
					<th scope="row"><%=cl.getCourseID()%></th>
					<td><%=cl.getCourseName()%></td>
					<td><%=cl.getCoursePrice()%></td>
					<td><%=cl.getCouseDescription()%></td>
					<td><%=cl.getCourseAddedDate()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<!-- Closing the page data loading-->
	<%
	sess.getTransaction().commit();
	sess.close();
	%>
	<%@include file="common/footer.jsp"%>
</body>
</html>