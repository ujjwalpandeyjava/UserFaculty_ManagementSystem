
<%
UserDetails userDetails1 = (UserDetails) session.getAttribute("logedInUser");
if ((userDetails1 == null) || (!userDetails1.getUserType().equals("admin"))) {
	session.setAttribute("login-failed",
	"Only Admin can acess this page. Login as admin");
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
.mustFill {
	color: red;
}
</style>
<title>Admin update user details | DevelpersPoint</title>
</head>
<body>
	<%@include file="common/navbar.jsp"%>

	<div class="container">
	<!-- Form begins here -->
		<form method="post" action="UpdateUserServlet">
			<h2 class="text-center">Add new user with respective details</h2>
			<section>
				<label>First Name:<span class="mustFill">*</span></label> <br>
				<input type="text" placeholder="First name" required
					name="uFirstName">
			</section>
			<br>
			<section>
				<label>Last Name:</label> <br> <input type="text"
					placeholder="Last name" name="uLastName">
			</section>
			<br>
			<section>
				<label>E-mail:</label><span class="mustFill">*</span> <br> <input
					type="email" placeholder="E-mail Address" required name="uEmail">
			</section>
			<br>
			<section>
				<label>Password:</label><span class="mustFill">*</span> <br> <input
					type="password" min="8" max="16" required
					placeholder="8-16 character long" name="uPassword"
					onkeyup="CheckCount()"> <label class="hidden"
					id="alert_custom" style="color: orange;">The password must
					be between 8-16 character long!!</label>
			</section>
			<br>
			<section>
				<label>Type of user:-</label><span class="mustFill">*</span> <br>
				<select class="form-select" name="uType"
					aria-label="Default select example">
					<option selected>Select user type</option>
					<option value="student">Student</option>
					<option value="faculty">Faculty</option>
					<option value="admin">Admin</option>
				</select>
			</section>
			<br> <br> <input type="submit"
				class="btn btn-pill text-center vw-20" value="Submit" id="submitMe">
		</form>
	</div>
	<%@include file="common/footer.jsp"%>
</body>
</html>