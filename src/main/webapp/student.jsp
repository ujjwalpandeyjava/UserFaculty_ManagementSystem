<%@page import="entities.UserDetails"%>
<%
UserDetails ud = (UserDetails) session.getAttribute("logedInUser");
System.out
		.println("This is from the student.jsp now we can use everthing easily "
		+ ud.toString());
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student | Developer Point</title>
</head>
<body>
	<%@include file="common/navbar.jsp"%>
	Student page
	<%@include file="common/footer.jsp"%>
</body>
</html>