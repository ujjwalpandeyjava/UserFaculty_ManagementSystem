<%@page import="enums.UserType"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="connection.DBConnection"%>
<%
UserDetails userDetails1 = (UserDetails) session.getAttribute("logedInUser");
if (userDetails1 == null) {
	/*session.setAttribute("login-failed",
	"Only Admin can acess this page. Login as admin");
	response.sendRedirect("LogoutServlet");*/
	session.setAttribute("login-failed", "Login to access this page");
	response.sendRedirect("login.jsp");
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
<title>Admin update details | DevelpersPoint</title>
</head>
<body>
	<%@include file="common/navbar.jsp"%>
	<div class="container" style="min-height: 78vh;">
		<%
		//Getting prvious page.
		String url2 = request.getHeader("Referer");
		String[] urlParts = url2.split("/");
		String email = request.getParameter("userId");
		/* 
				UserDetails updateIt = null;
				HttpSession session2 = null;
				

				Session sess = DBConnection.getFactory().openSession();
				Transaction tr = sess.beginTransaction();

				updateIt = (UserDetails) sess.load(UserDetails.class, email);
				session2 = request.getSession();
				session2.setAttribute("uud", updateIt);
				tr.commit();
				sess.close();
		 */
		Session sess = DBConnection.getFactory().openSession();
		sess.beginTransaction();
		UserDetails updateIt = (UserDetails) sess.get(UserDetails.class, email);
		if (updateIt != null) {
		%>
		<!-- Form begins here -->
		<form method="post" action="UpdateUserServlet"
			enctype="multipart/form-data">
			<h2 class="text-center display-5">Update details with
				precautions</h2>
			<section>
				<label>First Name:<span class="mustFill">*</span></label> <br>
				<input type="text" placeholder="First name" required maxlength="20"
					name="uFirstName" value="<%=updateIt.getFirstName()%>">
			</section>
			<br>
			<section>
				<label>Last Name:</label> <br> <input type="text"
					placeholder="Last name" name="uLastName" maxlength="20"
					value="<%=updateIt.getLastName()%>">
			</section>
			<br>
			<section>
				<!-- Previous page url with parementer it gave -->
				<input type="hidden" name="previousPageUrl"
					value="<%=urlParts[urlParts.length - 1]%>"> <input
					type="hidden" placeholder="E-mail Address" required name="uEmail"
					value="<%=updateIt.getEmail()%>">
			</section>
			<!-- <section>
				<label>Profile pic:</label> <br> <input type="file"
					placeholder="Update profile picture" name="uProfilePic">
			</section>
			<br> -->
			<section style="position: relative;">
				<label>Update Password </label><span class="mustFill"> do
					carefully!</span> <br> <input onfocus="seePassword()" id="uPassword"
					type="password" min="8" max="16" required
					placeholder="8-16 character long" name="uPassword"
					onkeyup="CheckCount()" value="<%=updateIt.getPassword()%>"><i
					class="far fa-eye"
					style="margin-left: -30px; cursor: pointer; margin-top: 9px; position: absolute;"
					id="togglePassword"></i> <label class="hidden" id="alert_custom"
					style="color: orange;">The password must be between 8-16
					character long!!</label>
			</section>
			<br>
			<%
			if (userDetails1.getUserType().equals(UserType.SUPERADMIN.getUserType())) {
			%>
			<section>
				<label>Type of user:- <span class="mustFill">(this
						user was <%=updateIt.getUserType()%>) *
				</span></label> <br> <select class="form-select" name="uType"
					aria-label="Default select example" required>
					<option selected value="<%=updateIt.getUserType()%>">Select
						user type</option>
					<option value="student">Student</option>
					<option value="faculty">Faculty</option>
					<option value=UserType.SUPERADMIN.getUserType()>Admin</option>
				</select>
			</section>
			<br>
			<%
			}
			%>
			<section>
				<label>Contact no:</label><input type="text"
					placeholder="User Contact no" name="uContact" maxlength="10"
					value="<%=updateIt.getContactNumber()%>">
			</section>
			<br>
			<section>
				<label>House-no:</label><input type="text" maxlength="15"
					placeholder="House number" name="uHouse"
					value="<%=updateIt.getHouseNo()%>">
			</section>
			<br>
			<section>
				<label>Landmark:</label><input type="text"
					placeholder="Something easily visible to everyone" name="uLandmark"
					value="<%=updateIt.getLandMark()%>">
			</section>
			<br>
			<section>
				<label>City:</label><input type="text" maxlength="35"
					placeholder="City user live in" name="uCity"
					value="<%=updateIt.getCity()%>">
			</section>
			<br>
			<section>
				<label>State:</label><input type="text"
					placeholder="State user live in" name="uState"
					value="<%=updateIt.getState()%>">
			</section>
			<br>
			<section>
				<label>Pin Code:</label><input type="text"
					placeholder="Address full pin code" name="uPinCode"
					value="<%=updateIt.getPinCode()%>">
			</section>

			<br> <br> <input type="submit"
				class="btn btn-pill text-center vw-20" value="Update" id="submitMe">
		</form>
		<%
		sess.getTransaction().commit();
		sess.close();
		} else {
		%>
		<h2 class="text-center">User not found</h2>
		<%
		}
		%>
	</div>
	<script type="text/javascript">
	function seePassword() {
	    document.getElementById("#uPassword").setAttribute("type", text);
	}
	const togglePassword = document.querySelector('#togglePassword');
	const password = document.querySelector('#uPassword');
	togglePassword.addEventListener('click', function(e) {
	    // toggle the type attribute
	    const type = password.getAttribute('type') === 'password' ? 'text'
		    : 'password';
	    password.setAttribute('type', type);
	    // toggle the eye slash icon
	    this.classList.toggle('fa-eye-slash');
	});
    </script>
	<%@include file="common/footer.jsp"%>
</body>
</html>