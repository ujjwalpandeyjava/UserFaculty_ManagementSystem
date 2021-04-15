<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | DevellpersPoint</title>
</head>
<body>
	<%@include file="common/navbar.jsp"%>


	<div class="container">
		<div class="section">
			<h2>For courses</h2>
			<dl>
				<dt>View all courses</dt>
				<dd>- View all courses having -edit and delete button</dd>
				<dt>Add new course</dt>
				<dd>- Title</dd>
				<dd>- Price</dd>
				<dd>- Description</dd>
				<dd>- Course subject name, with selectable list</dd>
			</dl>
		</div>
		<div class="section">
			<h2>For User</h2>
			<dl>
				<dt>View all users - with edit and delete button</dt>
				<dd>- Delete button have confirm</dd>
				<dt>View all faculty</dt>
				<dt>View all student</dt>
				<dt>Add new user -also asign role(student, faculty, admin)</dt>
			</dl>
		</div>
		<div class="section">
			<h2></h2>
		</div>
		<div class="section"></div>
	</div>


	<%@include file="common/footer.jsp"%>
</body>
</html>