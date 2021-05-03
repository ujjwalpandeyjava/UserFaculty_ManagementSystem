
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="entities.CourseList"%>
<%@page import="connection.DBConnection"%>
<%@page import="org.hibernate.Session"%>
<%
UserDetails userDetails1 = (UserDetails) session.getAttribute("logedInUser");
if ((userDetails1 == null) || (userDetails1.getUserType().equals("student"))) {
	session.setAttribute("login-failed",
	"Only Admins can access this page.\n Login as admin");
	response.sendRedirect("LogoutServlet");
}
%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="stylesheet/register.css">
<title>Admin View users | DevelpersPoint</title>
</head>
<body>
	<%@include file="common/navbar.jsp"%>
	<%
	String userType = request.getParameter("whoUser");
	//System.out.println(userType);
	Session sess = DBConnection.getFactory().openSession();
	sess.beginTransaction();
	String hql = null;
	if (userType.equals("all")) {
		hql = "From UserDetails";
	} else if (userType.equals("faculty")) {
		hql = "From UserDetails where userType = 'faculty'";
	} else if (userType.equals("student")) {
		hql = "From UserDetails where userType = 'student'";
	}
	Query<UserDetails> query = sess.createQuery(hql);
	List<UserDetails> userList = query.list();
	%>
	<!-- Table -->
	<div class="container-fluid my-4 overflow-auto">
		<%
		String succ = (String) session.getAttribute("Users-Success");
		if (succ != null) {
		%>
		<div class="alert alert-info text-center fade show"
			style="cursor: grab;">
			<%=succ%>
			<span class="closebtn text-right float-right"
				style="right: 10px; cursor: pointer; background-color: white; padding: 2px 8px; border-radius: 3px; margin-left: 30px;"
				onclick="this.parentElement.style.display='none';">×</span>
		</div>
		<%
		session.removeAttribute("Users-Success");
		}
		%>
		<table class="table table-hover">
			<thead class="thead-light">
				<h2 class="display-4 text-center">Users</h2>
				<%
				String st = (String) session.getAttribute("user-change-success");
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
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">User Type</th>
					<th scope="col">Contact</th>
					<th scope="col">Address</th>
					<th scope="col">With us from</th>
					<%
					if (userDetails.getUserType().equals("admin")) {
					%>
					<th scope="col">Edit</th>
					<th scope="col">Delete</th>

					<%
					}
					%>
				</tr>
			</thead>
			<tbody>
				<%
				for (UserDetails element : userList) {
				%>
				<tr>
					<th scope="row"><%=element.getFullName()%></th>
					<td style="word-break: break-all;"><%=element.getEmail()%></td>
					<td style="word-break: break-all;"><%=element.getUserType()%></td>
					<td><%=element.getContactNumber()%></td>
					<td><%=element.toStringFullAddress()%></td>
					<td><%=element.getRegistraionDate()%></td>

					<%
					if (userDetails.getUserType().equals("admin")) {
					%>
					<td><a type="button" class="btn btn-primary"
						href="updateUser.jsp?userId=<%=element.getEmail()%>">Update</a></td>
					<td><a type="button" class="btn btn-danger"
						href="DeleteUserServlet?courseID=<%=element.getEmail()%>">Delete</a></td>

					<%
					}
					%>

				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

	<%
	sess.getTransaction().commit();
	sess.close();
	%>
	<%@include file="common/footer.jsp"%>
</body>
</html>