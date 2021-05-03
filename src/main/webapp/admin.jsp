
<%
UserDetails userDetails1 = (UserDetails) session.getAttribute("logedInUser");
if ((userDetails1 == null) || (!userDetails1.getUserType().equals("admin"))) {
	session.setAttribute("login-failed",
	"Only Admin can acess this page. Login as admin");
	response.sendRedirect("LogoutServlet");
	//response.sendRedirect("login.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style type="text/css">
.courses, .user {
	background-color: #bfd4ec;
	margin: 10px;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
	border-radius: 5px;
	text-align: center;
}

.customFlexCard {
	min-width: 200px;
	text-align: center;
	margin: 4px 7px;
}

.card {
	padding: 0px;
}
</style>
<title>Admin | DevellpersPoint</title>
</head>
<body style="background-color: rgb(186, 226, 238);">
	<%@include file="common/navbar.jsp"%>
	<hr>

	<h2 class="display-3 text-center m-1">Courses</h2>
	<hr>
	<%
	String courseAddedSuccesful = (String) session.getAttribute("course-added");
	if (courseAddedSuccesful != null) {
	%>
	<div class="alert alert-success text-center fs-3 mx-2" role="alert"><%=courseAddedSuccesful%></div>
	<%
	session.removeAttribute("course-added");
	}
	%>
	<div class="courses">
		<div class="p-2 customFlexCard">
			<div class="card border-secondary mb-3 col" style="max-width: 18rem;">
				<div class="card-header">
					<b>View List of All courses</b>
				</div>
				<div class="card-body text-secondary">
					<h5 class="card-title">A list of all courses available</h5>
					<p class="card-text">
						Will show a list of courses with details and 'Two buttons' <br>&bull;
						One to do editing to the course <br> &bull; Another to delete
						the course
					</p>
					<a class="btn btn-info" href="adminViewCourses.jsp">View all
						courses</a>
				</div>
			</div>
		</div>
		<div class="p-2 customFlexCard">
			<div class="card border-secondary mb-3 col" style="max-width: 18rem;">
				<div class="card-header">
					<b>Add new course</b>
				</div>
				<div class="card-body text-secondary">
					<h5 class="card-title">Add more courses</h5>
					<p class="card-text">
						Contains a form with input fields:- <br> &bull; Course title
						<br> &bull; Price of course<br> &bull; Description<br>
						&bull; For which subject it is for<br>
					</p>
					<a class="btn btn-info" href="adminAddCourse.jsp">Add new
						course</a>

				</div>
			</div>
		</div>
	</div>
	<hr>

	<h2 class="display-3 text-center m-1">User</h2>
	<hr>
	<%
	String added = (String) session.getAttribute("reg-sucess");
	if (added != null) {
	%>
	<div class="alert alert-success text-center fs-2" role="alert"><%=added%></div>
	<%
	}
	session.removeAttribute("reg-sucess");
	%>
	<div class="user">
		<div class="p-2 customFlexCard">
			<div class="card border-secondary mb-3 col" style="max-width: 18rem;">
				<div class="card-header">
					<b>All users</b>
				</div>
				<div class="card-body text-secondary">
					<h5 class="card-title">List of current user</h5>
					<p class="card-text">
						Will show a list of users with details with 'Two buttons' <br>&bull;
						One to do editing of that user <br> &bull; Another to delete
						the course
					</p>
					<a class="btn btn-info" href="adminViewUsers.jsp?whoUser=all">View
						all users</a>
				</div>
			</div>
		</div>
		<div class="p-2 customFlexCard">
			<div class="card border-secondary mb-3 col" style="max-width: 18rem;">
				<div class="card-header">
					<b>All faculty</b>
				</div>
				<div class="card-body text-secondary">
					<h5 class="card-title">List of Faculties</h5>
					<p class="card-text">
						Shows a list of faculty in details with 'Two buttons' <br>&bull;
						Edit that user <br>&bull; Delete the user
					</p>
					<a class="btn btn-info" href="adminViewUsers.jsp?whoUser=faculty">View
						all faculty</a>
				</div>
			</div>
		</div>
		<div class="p-2 customFlexCard">
			<div class="card border-secondary mb-3 col" style="max-width: 18rem;">
				<div class="card-header">
					<b>All student</b>
				</div>
				<div class="card-body text-secondary">
					<h5 class="card-title">List of Students</h5>
					<p class="card-text">
						Shows a list of students in details with 'Two buttons' <br>&bull;
						Edit that user <br>&bull; Delete the user
					</p>
					<a class="btn btn-info" href="adminViewUsers.jsp?whoUser=student">View
						all student</a>
				</div>
			</div>
		</div>
		<div class="p-2 customFlexCard">
			<div class="card border-secondary mb-3 col" style="max-width: 18rem;">
				<div class="card-header">
					<b>Add User</b>
				</div>
				<div class="card-body text-secondary">
					<h5 class="card-title">Add a User</h5>
					<p class="card-text">
						To add a new user fill: <br>&bull; First and Last Name of
						user <br>&bull; Email, Password of user <br>&bull; Type
						of user
					</p>
					<a class="btn btn-info" href="addNewUser.jsp">Add new user</a>
				</div>
			</div>
		</div>
	</div>
	<hr>



	<%@include file="common/footer.jsp"%>
</body>
</html>