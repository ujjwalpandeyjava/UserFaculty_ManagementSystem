<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact | Developers Point</title>
<style type="text/css">
.mustFill {
	color: red;
}
</style>
</head>
<body>

	<%@include file="common/navbar.jsp"%>

	<div class="jumbotron jumbotron-fluid">
		<div class="container my-3">

			<%
			String querySubmited = (String) session.getAttribute("querySubmited");
			if (querySubmited != null) {
			%>
			<div class="alert alert-success" role="alert"><%=querySubmited%></div>
			<%
			session.removeAttribute("querySubmited");
			}
			%>

			<h2>Fill form no login required</h2>
			<form action="QuerySubmitServlet" method="post">
				<section class="my-3">
					<label for="name"> Name<span class="mustFill">*</span></label> <input
						type="text" class="form-control" name="name"
						placeholder="Your name" required>
				</section>
				<section class="my-3">
					<label for="email"> Email-id<span class="mustFill">*</span></label>
					<input type="email" class="form-control" name="email"
						placeholder="Email id to contact you" required>
				</section>
				<section class="my-3">
					<label for="contact"> Reachable number</label> <input type="text"
						class="form-control" name="contact" placeholder="Contact number">
				</section>
				<section class="my-3">
					<label for="contact"> Type of query</label><input type="text"
						class="form-control" name="queryHead"
						placeholder="A heading for your query">
				</section>
				<section class="my-3">
					<label for="contact"> Query<span class="mustFill">*</span><sub>in
							details</sub>
					</label>
					<textarea class="form-control" name="queryExplained" rows="7"
						placeholder="Explain properly in details we will reach as soon as possible to solve"
						required></textarea>
				</section>
				<br> <input type="submit" value="Submit">
			</form>
			<hr>
			<div class="text-center">
				<h2>
					<u>Some other ways to contact us</u>
				</h2>
				<b>Number:</b> <i>+91-9876-5432-89, +91-8375-9905-00</i> <br> <b>Mail-name:</b>
				<i>support@developerspoint.com</i> <br> <b>Visit:</b> <i>36,
					Ground floor, near bank of baroda, Sankat Vihar, New Delhi, Delhi
					110067</i>
			</div>
		</div>
	</div>
	<%@include file="common/footer.jsp"%>
</body>
</html>