<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style type="text/css">
.main-data {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 77vh;
	background-color: #c8ffff;
}

section>input {
	border: none;
	border-bottom: 1px solid red;
	padding: 2px 6px
}

section>input:focus {
	outline: none;
	border-bottom: 2.2px solid red;
}

input[type="submit"] {
	border: none;
	background: transparent;
	border-left: 1.5px solid green;
	border-right: 1.51px solid green;
}

input[type="submit"]:hover {
	box-shadow: 0px 0px 4px #f569e9;
}
</style>
<title>Recover your password</title>
</head>
<body>
	<%@include file="common/navbar.jsp"%>
	<div class="form-outter main-data">
		<form method="get" action="ForgetPass" style="width: auto !important;">
			<h2 class="my-1">
				<i class="fa fa-question"></i> Forgot password
			</h2>
			<br>
			<section>
				<label>Enter E-mail:</label> <br> <input type="email"
					placeholder="mail-id" name="uEmail" required>
			</section>
			<br>
			<section>
				<%
				String passi = request.getParameter("p");
				%>
				<label>Password:</label> <br> <input type="text"
					disabled="disabled" placeholder="Pass will apper here"
					name="uPassword" value="<%if (passi != null)%><%=passi%>">
			</section>
			<%
			String userNotFound = (String) session.getAttribute("userNotFound");
			if (userNotFound != null) {
			%>
			<span style="color: orange; padding-top: 14px;"><%=userNotFound%></span>
			<%
			session.removeAttribute("userNotFound");
			}
			%>
			<br> For more details contact us.<br> <input type="submit"
				value="Submit">
		</form>
	</div>

	<%@include file="common/footer.jsp"%>
</body>
</html>