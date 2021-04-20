<%@page import="java.util.Iterator"%>
<%@page import="entities.CourseList"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="entities.BoughtCourses"%>
<%@page import="connection.DBConnection"%>
<%@page import="org.hibernate.Session"%>
<%@page import="entities.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style type="text/css">
.bg-cus {
	background-color: #f5eaf7;
}
</style>
<title>Student | Developer Point</title>
</head>
<body>
	<%@include file="common/navbar.jsp"%>



	<%
	Session sess = DBConnection.getFactory().openSession();
	sess.beginTransaction();
	Criteria criteria = sess.createCriteria(BoughtCourses.class);
	List<BoughtCourses> col = criteria.list();
	%>
	<div class="row" style="min-height: 78vh; width: 100vw;">
		<div class="col-xs-12 p-1 col-md-8">
			<div class="container-fluid">
				<div class="row text-center justify-content-center">
					<%
					int count = 0;
					Iterator<BoughtCourses> itr = col.iterator();
					while (itr.hasNext()) {
						BoughtCourses cl = itr.next();
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
		<div class="col-xs-12 p-5 col-md-4 bg-cus">
			<h2 class="text-center">
				Profile details
				<hr>
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
						<%=userDetails.toStringFullAddress()%></p>
						<a class="btn btn-info px-3 w-100" role="button"
							href="updateUser.jsp?userId=<%=userDetails.getEmail()%>">Edit</a>
					</div>
			</h2>
		</div>
	</div>




	<%
	sess.getTransaction().commit();
	sess.close();
	%>



	<%@include file="common/footer.jsp"%>
</body>
</html>