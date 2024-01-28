<%@page import="entities.CourseList"%>
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
	<div class="row mx-0" style="min-height: 78vh;">
		<div class="col-xs-12 p-5 col-md-6">
			<img class="card-img-top shadow-sm p-3 mb-5 bg-body rounded"
				src="imges/coursesPic/<%=specific.getCourseImage()%>"
				alt="Card image cap"><br> <br> <span class="fs-3"><strong>Topic:
			</strong><%=specific.getCourseName()%></span>
			<div>
				<strong>Launch Date: </strong><%=specific.getCourseAddedDate()%><br>
				<strong>Last Update Date: </strong><%=specific.getUpdatedCourseDate()%>
			</div>
		</div>
		<div class="col-xs-12 p-5 col-md-6 bg-cus">
			<div class="shadow p-3 mb-5 bg-body rounded fs-4">
				<p style="margin: 10px auto;">
					<strong><%=specific.getCourseName()%></strong>
				</p>
				<hr>
				<span class="text-center fw-bolder">Description: </span> <span
					style="word-spacing: .6rem; font-family: math;"><%=specific.getCouseDescription()%></span>
			</div>
			<div class="shadow p-3 mb-5 bg-body rounded fs-5"
				style="line-height: 2.1; font-family: cursive;">
				<span style="text-decoration: underline;">Requirements:</span> <br>
				- Before starting this course student should know
				<%=specific.getRequirements()%>
				<br> - Specially created for '<%=specific.getLevel()%>' level
				individuals <br>- Providing all the necessary content in just '<%=specific.getLearnTime()%>'
				hrs <br>- By our
				<%=specific.getCreatorName()%>
				,specialist in
				<%=specific.getLang()%><br>- On demand in
				<%=specific.getLanguage()%><br> -
				<%=specific.getMoneyBackGuaranteeDays()%>-Day Money-Back Guarantee
			</div>
			<div class="shadow p-3 mb-5 bg-body rounded fs-5">
				<strong>Price: </strong> <span> Rs <%=specific.getCoursePrice() - (specific.getDiscount() * specific.getCoursePrice() / 100)%>
					- <sub style="font-style: italic;"><span style="color: red;"><del>
								Rs
								<%=specific.getCoursePrice()%></del></span><span style="color: green;">
							<%=specific.getDiscount()%>% off.
					</span></sub>
				</span>
			</div>
			<div class="shadow p-3 mb-5 bg-body rounded fs-3">
				<a class="btn btn-info px-3 w-100" role="button"
					onclick="batchCourseEnquary()" href="contact.jsp">More Detail</a> <br>
				<%
				if (userDetails != null) {
				%>
				<%-- 	Use in paymetn page.
				<a class="btn btn-info px-3 w-100" role="button"
					href="BuyCourseServlet?userId=<%=userDetails.getEmail()%>">Buy
					Course</a> --%>
				<a class="btn btn-info px-3 w-100" role="button"
					href="payment.jsp?courseId=<%=specific.getCourseID()%>">Buy
					Course</a>
				<%
				session.setAttribute("courseDetails", specific);
				} else {
				%>
				<a class="btn btn-info px-3 w-100" role="button" href="login.jsp">Login
					to buy Course</a>
				<%
				}
				%>
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