
<%@page import="org.hibernate.Query"%>
<%@page import="entities.CourseList"%>
<%@page import="connection.DBConnection"%>
<%@page import="org.hibernate.Session"%>
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
<link rel="stylesheet" type="text/css" href="stylesheet/register.css">
<title>Update Course | DevelpersPoint</title>
</head>
<body>
	<%@include file="common/navbar.jsp"%>

	<%
	int id = Integer.parseInt(request.getParameter("courseID"));
	Session sess = DBConnection.getFactory().openSession();
	sess.beginTransaction();

	CourseList updateIt = (CourseList) sess.get(CourseList.class, id);
	%>
	<div class="container">
		<!-- Form begins here -->
		<form method="post" action="UpdateCourseServlet">
			<h2 class="text-center">Update Course</h2>
			<input type="hidden" name="couresID"
				value="<%= updateIt.getCourseID()%>">
			<section>
				<label>Course Title:<span class="mustFill">*</span></label> <br>
				<input type="text" placeholder="Title to show on course" required
					name="cTitle" value="<%=updateIt.getCourseName()%>">
			</section>
			<br>
			<section>
				<label>Course Description:</label> <span class="mustFill">*</span><br>
				<input type="text"
					placeholder="Little explanation oF learning material" required
					name="cExplination" value="<%=updateIt.getCouseDescription()%>">
			</section>
			<br>
			<section>
				<label>Price (in rs):</label><span class="mustFill">*</span> <br>
				<input type="number" placeholder="Course price without any discount"
					required name="cPrice" value="<%=updateIt.getCoursePrice()%>">
			</section>
			<br> <br> <input type="submit"
				class="btn btn-pill text-center vw-20" value="Submit" id="submitMe">
		</form>
	</div>

	<%
	sess.getTransaction().commit();
	sess.close();
	%>






	<%@include file="common/footer.jsp"%>
</body>
</html>