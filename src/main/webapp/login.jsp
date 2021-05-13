<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="stylesheet/login.css">
<title>Login | Developers point</title>
</head>
<body>
	<%@include file="common/navbar.jsp"%>
	<div class="main-data d-flex justify-content-center align-items-center">
		<div class="form-outter">
			<form method="post" action="LoginServlet">
				<h2 class="my-1">
					<i class="fa fa-user"></i> Login account
				</h2>
				<hr class="my-4">



				<%
				String invalidLogin = (String) session.getAttribute("login-failed");
				if (invalidLogin != null) {
				%>
				<div class="alert alert-danger" role="alert"><%=invalidLogin%></div>
				<%
				session.removeAttribute("login-failed");
				}
				%>

				<%
				String logoutMsg = (String) session.getAttribute("logout-msg");
				if (logoutMsg != null) {
				%>
				<div class="alert alert-success" role="alert"><%=logoutMsg%></div>
				<%
				session.removeAttribute("logout-msg");
				}
				%>

				<%
				String loginError = (String) session.getAttribute("Login-error");
				if (loginError != null) {
				%>
				<div class="alert alert-danger" role="alert"><%=loginError%></div>
				<%
				}
				session.removeAttribute("Login-error");
				%>


				<section>
					<label>E-mail:</label> <br> <input type="text"
						placeholder="E-mail Address" name="uEmail" required>
				</section>
				<br>
				<section>
					<label>Password:</label> <br> <input type="password" min="8"
						max="16" placeholder="It was 8-16 character long" name="uPassword"
						required>
				</section>
				<br> <br> <input type="submit" value="Submit">
			</form>
			<a id="firgetlink" href="forget.jsp" class="text-uppercase">forget pass?</a>
		</div>
	</div>
	<%@include file="common/footer.jsp"%>
</body>
</html>