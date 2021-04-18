
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="connection.DBConnection"%>
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
	<div class="container" style="min-height: 78vh;">
		<%
		String email = request.getParameter("userId");
		System.out.println(email);
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
			System.out.println(updateIt.toString());
		%>
		<!-- Form begins here -->
		<form method="post" action="UpdateUserServlet">
			<h2 class="text-center display-5">Update user details with
				precautions</h2>
			add details in value and work in servlet to get them all and update
			in database. then work on courses page. then work on student page.
			<section>
				<label>First Name:<span class="mustFill">*</span></label> <br>
				<input type="text" placeholder="First name" required
					name="uFirstName" value="<%=updateIt.getFirstName()%>">
			</section>
			<br>
			<section>
				<label>Last Name:</label> <br> <input type="text"
					placeholder="Last name" name="uLastName"
					value="<%=updateIt.getLastName()%>">
			</section>
			<br>
			<section>
				<label>E-mail:</label><span class="mustFill">*</span> <br> <input
					type="email" placeholder="E-mail Address" required name="uEmail"
					value="<%=updateIt.getEmail()%>">
			</section>
			<br>
			<section>
				<label>Password:</label><span class="mustFill">*</span> <br> <input
					type="password" min="8" max="16" required
					placeholder="8-16 character long" name="uPassword"
					onkeyup="CheckCount()" value="<%=updateIt.getPassword()%>">
				<label class="hidden" id="alert_custom" style="color: orange;">The
					password must be between 8-16 character long!!</label>
			</section>
			<br>
			<section>
				<label>Type of user:- (was <%=updateIt.getUserType()%>)
				</label><span class="mustFill">*</span> <br> <select
					class="form-select" name="uType"
					value="<%=updateIt.getUserType()%>"
					aria-label="Default select example" required>
					<option selected>Select user type</option>
					<option value="student">Student</option>
					<option value="faculty">Faculty</option>
					<option value="admin">Admin</option>
				</select>
			</section>
			<br>
			<section>
				<label>Contact no:</label><input type="number"
					placeholder="User Contact no" name="uContact"
					value="<%=updateIt.getContactNumber()%>">
			</section>
			<br>
			<section>
				<label>House-no:</label><input type="text"
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
				<label>City:</label><input type="text"
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
	<%@include file="common/footer.jsp"%>
</body>
</html>