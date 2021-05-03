<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="stylesheet/register.css">
<title>Register | Developers Point</title>
<style type="text/css">
.mustFill {
	color: red;
}
</style>
</head>
<body>
	<%@include file="common/navbar.jsp"%>

	<div class="main-data d-flex justify-content-center align-items-center">
		<div class="form-outter">
			<h2 class="my-2">
				<i class="fa fa-user-plus"></i> Register and Enjoy our Premium
				Content
			</h2>
			<hr class="my-3">
			<%
			String regMsg = (String) session.getAttribute("reg-sucess");
			if (regMsg != null) {
			%>
			<div class="alert alert-success" role="alert">
				<%=regMsg%>
				Login: <a href="login.jsp">Click Here...</a>
			</div>
			<%
			session.removeAttribute("reg-sucess");
			}
			String FailedMsg = (String) session.getAttribute("reg-failed");
			if (FailedMsg != null) {
			%>
			<div class="alert alert-danger" role="alert">
				<%=FailedMsg%>
			</div>
			<%
			session.removeAttribute("reg-failed");
			}
			%>

			<form method="post" action="RegisterServlet">
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
				<br> <br> <input type="submit"
					class="btn btn-pill text-center vw-20" value="Submit" id="submitMe">
			</form>
			<span style="font-weight: lighter; font-size: small;"><span
				class="mustFill">*</span> Must fill to submit</span>
		</div>
	</div>

	<script>
		function CheckCount() {
			var len = document.getElementsByName("uPassword")[0].value.length;
			console.log(len);
			if ((len < 8) || (len > 16)) {
				if (document.getElementById("alert_custom").classList
						.contains("hidden")) {
					document.getElementById("alert_custom").classList
							.remove('hidden');
					document.getElementById("submitMe").setAttribute(
							"disabled", "true");
				}
			} else {
				if (!document.getElementById("alert_custom").classList
						.contains('hidden')) {
					document.getElementById("alert_custom").classList
							.add('hidden');
					document.getElementById("submitMe").removeAttributeNode(
							document.getElementById("submitMe")
									.getAttributeNode("disabled"));
				}
			}
		}
	</script>

	<%@include file="common/footer.jsp"%>
</body>
</html>