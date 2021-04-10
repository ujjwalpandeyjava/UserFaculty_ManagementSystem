<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@include file="common/navbar.jsp"%>
	<div class="jumbotron m-3 fs-4">
		<b> Login page is conditional based on type of person.</b>
		<ol>
			<li>Student:- To Student.jsp</li>
			<li>Faculty:- To Faculty.jsp</li>
			<li>Administration:- To Admin.jsp</li>
		</ol>
		<hr class="my-3">
		<b>Clickable links on index.jsp page</b>
		<ul class="text-left">
			<li>Our best faculty <sub>(With images)</sub><sup>(Only
					good presentable images)</sup></li>
			<li>2 divisions (2 and 1 in own lines) showing check our new
				different subject batches <sub>(Batches already started)</sub><sup>(To
					Batches.jsp page)</sup>
			</li>
			<li>Contact section with some good line to motivate and reach us<sup>(To
					Contact.jsp page)</sup></li>
			<li>Register<sup>(To Register.jsp page)</sup> and Login button<sup>(To
					Login.jsp Page)</sup></li>
			<li>Achievementes like where are our students and how much
				package best of them got.</li>
			<li>Our Address location in 3 lnes</li>
		</ul>
	</div>
	<%@include file="common/footer.jsp"%>
</body>
</html>