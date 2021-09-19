
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="entities.CourseList"%>
<%@page import="org.hibernate.Session"%>
<%@page import="connection.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Courses | DevelpersPoint</title>
<style>
* {
	box-sizing: border-box;
}

.bg-cus {
	background-color: #ebd3ed;
}

.x {
	/* margin: 3px; */
	margin: 13px 0px;
	padding: 10px;
	/*border: 7px solid white;*/
}
</style>
</head>
<body class="bg-cus">
	<%@include file="common/navbar.jsp"%>
	<%
	Session sess = DBConnection.getFactory().openSession();
	sess.beginTransaction();
	Criteria criteria = sess.createCriteria(CourseList.class);
	List<CourseList> col = criteria.list();
	%>
	<div class="container-fluid my-4 overflow-auto">
		<h2 class="display-4 text-center">Course</h2>
		<%
		String courseBoughtSuccesful = (String) session.getAttribute("CourseBought");
		if (courseBoughtSuccesful != null) {
		%>
		<div class="alert alert-success text-center fs-3 mx-2" role="alert"><%=courseBoughtSuccesful%></div>
		<%
		session.removeAttribute("CourseBought");
		}
		%>
		<!-- Create cards -->
		<div class="container-fluid">
			<div class="row text-center justify-content-center bg-cus">
				<%
				Iterator<CourseList> itr = col.iterator();
				while (itr.hasNext()) {
					CourseList cl = itr.next();
				%>
				<div class="col-xs-12 col-sm-6 col-md-4 col-xl-3 x bg-cus">
					<div class="card mx-auto" style="width: 18rem;">
						<img class="card-img-top"
							src="imges/coursesPic/<%=cl.getCourseImage()%>"
							alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title" style="word-break: break-all;"><%=cl.getCourseName()%></h5>
							<hr>
							<p class="card-text" style="word-break: break-all;">

								<%
								String desc2 = cl.getCouseDescription();
								if (desc2.length() > 130) {
									desc2 = (String) desc2.substring(0, 100).concat("......");
								} else
									desc2 = (String) desc2;
								%>
								<%=desc2%>
							</p>
							<a href="courseDetail.jsp?courseId=<%=cl.getCourseID()%>"
								class="btn btn-primary">More Detail</a>
						</div>
					</div>
				</div>
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
	<%@include file="common/footer.jsp"%>
</body>
</html>