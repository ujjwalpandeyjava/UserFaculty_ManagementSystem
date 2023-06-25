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
	min-height: 77vh;
	/*background-color: #c8ffff;*/
}

section>input {
	border: none;
	border-bottom: 1px solid red;
	padding: 2px 6px;
}

section>label {
	font-size: 14px;
}

section>input:focus {
	outline: none;
	border-bottom: 2.2px solid red;
}

input[type="submit"] {
	background: transparent;
	border: 1.5px solid #06dc06;
	width: 100%;
	margin-bottom: 2px;
}

input[type="submit"]:hover {
	margin-top: 2px;
	margin-bottom: 0px;
	background-color: #06dc06;
	box-shadow: 0px 0px 4px #06dc06, 2px 4px 2px 1px #2e822e;
}

.forget-tip-form {
	background-color: white;
	width: 65%;
	min-width: 272px;
	margin: 45px 0px;
	box-shadow: 0px 1px 8px #ce93d8;
	transition: all 0.5s ease;
	box-shadow: 0px 1px 8px #ce93d8;
}

.forget-tip-form:hover {
	box-shadow: 0px 4px 7px #ce93d8, inset 0px 1px 7px #d3e3e2b5;
}

.formsComboDiv {
	display: flex;
	min-height: 45vh;
	flex-direction: row;
	flex-wrap: wrap;
	justify-content: space-around;
	align-items: stretch;
	align-content: space-around;
	padding: 18px;
	margin: 1px;
}

.ResetForm, .hintForm {
	margin-bottom: 40px;
}
</style>
<title>Recover your password</title>
</head>
<body>
	<%@include file="common/navbar.jsp"%>
	<div class="form-outter main-data">
		<div class="forget-tip-form ">
			<h2 class="text-center my-4 ">
				<i class="fa fa-question"></i> Forgot password
			</h2>
			<hr style="box-shadow: 0px 2px 3px black; color: white;">
			<div class="formsComboDiv">
				<div class="hintForm">
					<form method="get" action="ForgetPass" class="shadow"
						style="width: auto !important;">
						<sup style="color: blue; text-shadow: 1px 1px 1px green;">Get
							some hint for you</sup> <br> <br>
						<section>
							<label>&emsp;Enter E-mail:</label> <br> <input type="email"
								placeholder="Mail-id" name="uEmail">
						</section>
						<br>
						<section>
							<%
							String passi = request.getParameter("p");
							%>
							<label>&emsp;Password hint:</label> <br> <input type="text"
								disabled="disabled" placeholder="Hint will apper here"
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
						<br> <sup> For more details contact us.</sup><br> <br>
						<input type="submit" value="Submit">
					</form>
				</div>
				<div class="ResetForm">
					<form method="post" action="ResetPassword" class="shadow"
						style="width: auto !important; max-width: 270px;">
						<sup style="color: #f44a3d; text-shadow: 1px 1px 1px green;">Reset
							password</sup> <br> <br>
						<section>
							<label>&emsp;Enter Registered E-mail:</label> <br> <input
								type="email" placeholder="Mail-id" name="emailPassReset">
						</section>
						<br>
						<section>
							<label>&emsp;Registered Mobile no:</label> <br> <input
								type="text" placeholder="Moblie no." name="phonePassReset"
								value="">
						</section>
						<%
						String resetActionSituation = (String) session.getAttribute("resetProbCause");
						if (resetActionSituation != null) {
						%>
						<span
							style="color: orange; padding-top: 14px; padding-top: 10px; font-size: small;"><%=resetActionSituation%></span>
						<%
						}
						session.removeAttribute("resetProbCause");
						%>
						<br>Note: <sub>Never add fake detail</sub><br><br>
						<input type="submit" value="Submit" onclick="waitmsg()">
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function waitmsg() {
		    setTimeout(() => {
				alert("Click ok, and Wait few sec, we are fetching your details!!")
		    }, 500);
	</script>
	<%@include file="common/footer.jsp"%>
</body>
</html>