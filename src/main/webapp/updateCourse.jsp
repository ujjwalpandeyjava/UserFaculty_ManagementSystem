
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
<style type="text/css">
.asInputDesign {
	width: 100%;
	border: none;
	outline: none;
	border-bottom: 1px solid blue;
	padding: 6px 13px;
}

.asInputDesign:focus {
	border-bottom: 2.5px solid blue;
}
</style>
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
				value="<%=updateIt.getCourseID()%>">
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
				<label>Subject it is related to:</label><span class="mustFill">*</span>
				<br> <select class="form-select" name="subjectImage" required
					aria-label="Default select example">
					<option selected value="<%=updateIt.getCourseImage()%>">Select
						Course Subject for image</option>
					<option value="java.png">Java</option>
					<option value="mongoDB.png">MongoDB</option>
					<option value="python.jpg">Python</option>
					<option value="sql.jpg">SQl</option>
					<option value="advancedjava.jpg">Advanced Java</option>
					<option value="mysql.jpg">MYSQl</option>
					<option value="html.jpg">HTML</option>
					<option value="css.jpg">CSS</option>
					<option value="javascript.png">JavaScript</option>
				</select>
			</section>
			<br>
			<section>
				<label>Price (in rs):</label><span class="mustFill">*</span> <br>
				<input type="number" placeholder="Course price without any discount"
					required name="cPrice" value="<%=updateIt.getCoursePrice()%>">
			</section>
			<br>
			<section>
				<label>Discount:</label> <span class="mustFill">*</span><br> <input
					type="number" placeholder="Will be counted in percentage" required
					name="cDiscount" value="<%=updateIt.getDiscount()%>">
			</section>
			<br>
			<section>
				<label>Which level of user for</label> <span class="mustFill">*</span><br>
				<select class="asInputDesign" name="stuLevel">
					<option value="<%=updateIt.getLevel()%>">Select level</option>
					<hr>
					<option value="Beginner">beginner</option>
					<option value="Intermediate">Intermediate</option>
					<option value="Pro">Pro</option>
				</select>
			</section>
			<br>
			<section>
				<label>Total time this will course take to over</label> <span
					class="mustFill">*</span><br> <input type="text"
					placeholder="in hrs (enter only no of hours)" required
					name="cLearnTime" value="<%=updateIt.getLearnTime()%>">
			</section>
			<br>
			<section>
				<label>Creator name</label> <span class="mustFill">*</span><br>
				<input type="text" placeholder="name of creators with comma ','"
					required name="cCreator" value="<%=updateIt.getCreatorName()%>">
			</section>
			<br>
			<section>
				<label>What the student must know before this course</label> <span
					class="mustFill">*</span><br> <input type="text"
					placeholder="requirements with comma ','" required
					name="cRequirements" value="<%=updateIt.getRequirements()%>">
			</section>
			<br>
			<section>
				<label>Days of money back guarantee</label> <span class="mustFill">*</span><br>
				<input type="number" placeholder="name of creators with comma ','"
					required name="cGurDays"
					value="<%=updateIt.getMoneyBackGuaranteeDays()%>">
			</section>
			<br>
			<section>
				<label>Course teaching language</label> <span class="mustFill">*</span><br>
				<input type="text" placeholder="What lang this course teach"
					required name="cLang" value="<%=updateIt.getLang()%>">
			</section>
			<br>
			<section>
				<label>Which spoken language used to teach by teacher</label> <span
					class="mustFill">*</span><br> <input type="text"
					placeholder="name of creators with comma ','" required
					name="cLanguage" value="<%=updateIt.getLanguage()%>">
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