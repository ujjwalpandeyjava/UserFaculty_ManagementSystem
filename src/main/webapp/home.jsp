<%@page import="entities.UserDetails"%>
<%
UserDetails userDetails = (UserDetails) session.getAttribute("logedInUser");
if (userDetails == null) {
	session.setAttribute("Login-error",
	"Please login first to get at home page..");
	response.sendRedirect("login.jsp");
} else {
	HttpSession logedInDetails = request.getSession();
	logedInDetails.setAttribute("logedInUser", userDetails);
	if (userDetails.getUserType().equals("student")) {
		response.sendRedirect("student.jsp");
	} else if (userDetails.getUserType().equals("faculty"))
		response.sendRedirect("faculty.jsp");
	else if (userDetails.getUserType().equals("admin"))
		response.sendRedirect("admin.jsp");
}
%>