
<%@page import="enums.UserType"%>
<%
UserDetails userDetails1 = (UserDetails) session.getAttribute("logedInUser");
if ((userDetails1 == null) || (!userDetails1.getUserType().equals(UserType.FACULTY.getUserType()))) {
	session.setAttribute("login-failed",
	"Only a faculty can acess this page. Login as faculty");
	response.sendRedirect("LogoutServlet");
	//response.sendRedirect("login.jsp");
}
%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="entities.BoughtCourses"%>
<%@page import="connection.DBConnection"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style type="text/css">
/* Hide scrollbar for Chrome, Safari and Opera */
.example::-webkit-scrollbar {
	display: none;
}

/* Hide scrollbar for IE, Edge and Firefox */
.example {
	-ms-overflow-style: none; /* IE and Edge */
	scrollbar-width: none; /* Firefox */
	box-shadow: inset 0px -3.5PX 7px rgb(0 0 0/ 15%);
}

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
<title>Faculty | DevelpersPoint</title>
</head>
<body>
	<%@include file="common/navbar.jsp"%>

	<%
	Session sess = DBConnection.getFactory().openSession();
	sess.beginTransaction();
	Criteria criteria = sess.createCriteria(BoughtCourses.class);
	List<BoughtCourses> col = criteria.list();
	%>
	<div class="row" style="width: 100vw; padding-bottom: 30px;">
		<div class="col-xs-12 col-md-8" style="padding-left: 22px;">
			<div class="example my-1" style="height: 40vh; overflow-y: scroll;">
				<div class="user">
					<div class="p-2 customFlexCard">
						<div class="card border-secondary mb-3 col"
							style="max-width: 18rem;">
							<div class="card-header">
								<b>All users</b>
							</div>
							<div class="card-body text-secondary">
								<h5 class="card-title">List of current users</h5>
								<p class="card-text">
									Will show a list of users with details with 'Two buttons' <br>&bull;
									One to do editing of that user <br> &bull; Another to
									delete the course
								</p>
								<a class="btn btn-info" href="adminViewUsers.jsp?whoUser=all">View
									all users</a>
							</div>
						</div>
					</div>
					<div class="p-2 customFlexCard">
						<div class="card border-secondary mb-3 col"
							style="max-width: 18rem;">
							<div class="card-header">
								<b>All faculty</b>
							</div>
							<div class="card-body text-secondary">
								<h5 class="card-title">List of Faculties</h5>
								<p class="card-text">
									Shows a list of faculty in details with 'Two buttons' <br>&bull;
									Edit that user <br>&bull; Delete the user
								</p>
								<a class="btn btn-info"
									href="adminViewUsers.jsp?whoUser=faculty">View all faculty</a>
							</div>
						</div>
					</div>
					<div class="p-2 customFlexCard">
						<div class="card border-secondary mb-3 col"
							style="max-width: 18rem;">
							<div class="card-header">
								<b>All student</b>
							</div>
							<div class="card-body text-secondary">
								<h5 class="card-title">List of Students</h5>
								<p class="card-text">
									Shows a list of students in details with 'Two buttons' <br>&bull;
									Edit that user <br>&bull; Delete the user
								</p>
								<a class="btn btn-info"
									href="adminViewUsers.jsp?whoUser=student">View all student</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<div class="container-fluid">
				<!-- <div style="height: 100%;"></div> -->
				<div class="row text-center justify-content-center">
					<%
					int count = 0;
					Iterator<BoughtCourses> itr = col.iterator();
					while (itr.hasNext()) {
						BoughtCourses cl = itr.next();
						if (userDetails != null)
							if (cl.getUserEmail().equals(userDetails.getEmail())) {
						count++;
					%>
					<div class="col-xs-12 col-sm-6 x  mt-4">
						<div class="card mx-auto" style="width: 18rem;">
							<img class="card-img-top"
								src="imges/coursesPic/<%=cl.getCourseImage()%>"
								alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title" style="word-break: break-all;"><%=cl.getCourseName()%></h5>
								<hr>
								<p class="card-text" style="word-break: break-all;">
									<%=cl.getCouseDescription()%>
								</p>
								<a href="courseBought.jsp?courseId=<%=cl.getCourseID()%>"
									class="btn btn-primary">More Detail</a>
							</div>
						</div>
					</div>
					<%
					}
					}
					if (count < 1) {
					%>
					<div class="shadow p-3 mb-5 bg-body rounded fs-3 mt-5">
						<strong>No course bought yet</strong>
						<div class="shadow p-3 mb-5 bg-body rounded fs-3 mt-3">
							<a class="btn btn-info px-3 w-100" role="button"
								href="courses.jsp">Search Courses</a>
						</div>
					</div>
					<%
					}
					%>
				</div>
			</div>
		</div>
		<div class="col-xs-12 p-5 col-md-4 bg-cus lead">
			<h2 class="text-center">Profile details</h2>
			<hr>
			<%
			if (userDetails != null) {
			%>
			<div class="text-muted fs-5 lead">
				<div>
					Name:
					<%=userDetails.getFullName()%></div>
				<div>
					<br> Email id:
					<%=userDetails.getEmail()%></div>
				<br>
				<div>
					Contact number:
					<%=userDetails.getContactNumber()%></div>
				<div>
					<br> User Type:
					<%=userDetails.getUserType()%></div>
				<div>
					<br> User since:
					<%=userDetails.getRegistraionDate()%></div>
				<div>
					<br>
					<p><%=userDetails.toStringFullAddress()%></p>
					<a class="btn btn-info px-3 w-100" role="button"
						href="updateUser.jsp?userId=<%=userDetails.getEmail()%>">Edit</a>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<%
	sess.getTransaction().commit();
	sess.close();
	%>
	<%@include file="common/footer.jsp"%>
</body>
</html>