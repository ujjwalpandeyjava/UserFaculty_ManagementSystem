<%@page import="org.hibernate.internal.build.AllowSysOut"%>
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
	"Only Admins can access this page.\n Login as admin");
	response.sendRedirect("LogoutServlet");
	//response.sendRedirect("login.jsp");
}
%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Courses | DevelpersPoint</title>
</head>
<body>
	<%@include file="common/navbar.jsp"%>
	<%
	Session sess = DBConnection.getFactory().openSession();
	sess.beginTransaction();
	Criteria criteria = sess.createCriteria(CourseList.class);
	List<CourseList> col = criteria.list();
	%>
	<div class="container-fluid my-4 overflow-auto">
		<table class="table table-hover">
			<thead class="thead-light">
				<h2 class="display-4 text-center">Course</h2>
				<%
				String st = (String) session.getAttribute("course-delete-success");
				if (st != null) {
				%>
				<div class="alert alert-info text-center fade show"
					style="cursor: grab;">
					<%=st%>
					<span class="closebtn text-right float-right"
						style="right: 10px; cursor: pointer; background-color: white; padding: 2px 8px; border-radius: 3px; margin-left: 30px;"
						onclick="this.parentElement.style.display='none';">×</span>
				</div>
				<%
				session.removeAttribute("course-delete-success");
				}
				%>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Title</th>
					<th scope="col">Description</th>
					<th scope="col">Added on</th>
					<th scope="col">Price</th>
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
					<td style="word-break: break-all;"><%=cl.getCourseName()%></td>
					<td style="word-break: break-all; max-width: 40vw;"><%=cl.getCouseDescription()%></td>
					<td><%=cl.getCourseAddedDate()%></td>
					<td><%=cl.getCoursePrice()%></td>
					<td><a type="button" class="btn btn-primary"
						href="updateCourse.jsp?courseID=<%=cl.getCourseID()%>">Update</a></td>
					<td><a type="button" class="btn btn-danger"
						href="DeleteCourse?courseID=<%=cl.getCourseID()%>">Delete</a></td>
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