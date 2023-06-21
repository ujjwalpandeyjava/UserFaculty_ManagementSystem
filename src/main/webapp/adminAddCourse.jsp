
<%@page import="enums.UserType"%>
<%
UserDetails userDetails1 = (UserDetails) session.getAttribute("logedInUser");
if ((userDetails1 == null) || (!userDetails1.getUserType().equals(UserType.SUPERADMIN.getUserType()))) {
	session.setAttribute("login-failed",
	"Only Admin can acess this page. Login as admin");
	response.sendRedirect("LogoutServlet");
	//response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="stylesheet/register.css">
<style type="text/css">
.mustFill {
	color: red;
}
</style>
<title>Admin Add course | DevelpersPoint</title>
</head>
<body>
	<%@include file="common/navbar.jsp"%>

	<!-- Form to add new Course -->
	<div class="container">
		<!-- Form begins here -->
		<form method="post" action="AddCourseServlet">
			<h2 class="text-center">Add new Course with respective details</h2>
			<section>
				<label>Course Title:<span class="mustFill">*</span></label> <br>
				<input type="text" placeholder="Title to show on course" required
					name="cTitle">
			</section>
			<br>
			<section>
				<label>Course Description:</label> <span class="mustFill">*</span><br>
				<input type="text"
					placeholder="Little explanation oF learning material" required
					name="cExplination">
			</section>
			<br>
			<section>
				<label>Price (in rs):</label><span class="mustFill">*</span> <br>
				<input type="number" placeholder="Course price without any discount"
					required name="cPrice">
			</section>
			<br>
			<section>
				<label>Subject it is related to:</label><span class="mustFill">*</span>
				<br> <select class="form-select" name="subjectImage" required
					aria-label="Default select example">
					<option selected>Select Course Subject</option>
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
			<br> <br> <input type="submit"
				class="btn btn-pill text-center vw-20" value="Submit" id="submitMe">
		</form>
	</div>



	<%@include file="common/footer.jsp"%>
</body>
</html>