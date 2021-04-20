<%@page import="entities.CourseList"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="connection.DBConnection"%>
<%@page import="org.hibernate.Session"%>
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
<title>Course detail | DevelpersPoint</title>
</head>
<body>
	<%@include file="common/navbar.jsp"%>
	<%
	int id = Integer.parseInt(request.getParameter("courseId"));
	Session sess = DBConnection.getFactory().openSession();
	sess.beginTransaction();
	CourseList specific = (CourseList) sess.get(CourseList.class, id);
	%>
	<div class="row" style="min-height: 78vh; width: 100vw;">
		<div class="col-xs-12 p-5 col-md-6">
			<img class="card-img-top shadow-sm p-3 mb-5 bg-body rounded"
				src="imges/coursesPic/<%=specific.getCourseImage()%>"
				alt="Card image cap"><br> <br> <span class="fs-3"><strong>Topic:
			</strong><%=specific.getCourseName()%></span>
			<div>
				<strong>Launch Date: </strong><%=specific.getCourseAddedDate()%></div>
		</div>
		<div class="col-xs-12 p-5 col-md-6 bg-cus">
			<div class="shadow p-3 mb-5 bg-body rounded fs-4">
				<span class="text-center fw-bolder">Description: </span> In this
				course we
				<%=specific.getCouseDescription()%></div>
			<div class="shadow p-3 mb-5 bg-body rounded fs-3">
				<strong>Rs: </strong><%=specific.getCoursePrice()%></div>
			<div class="shadow p-3 mb-5 bg-body rounded fs-3">
				<a class="btn btn-info px-3 w-100" role="button" href="contact.jsp">Having
					Problem? contact us</a>
			</div>
		</div>
	</div>
	<%
	sess.getTransaction().commit();
	sess.close();
	%>
	<script type="text/javascript">
		function batchCourseEnquary() {
			alert("Feel free to ask anything, and sit back freely we will reach you in 25min");
		}
		//onclick="batchCourseEnquary()"
	</script>
	<%@include file="common/footer.jsp"%>
</body>
</html>