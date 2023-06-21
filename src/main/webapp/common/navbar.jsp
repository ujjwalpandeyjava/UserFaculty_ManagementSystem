<!-- Bootstrap 5 CDN Dependencies -->
<%@page import="entities.UserDetails"%>
<link href="webjars/bootstrap/5.0.0-beta3/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font-awesome CDN Dependencies -->
<link href="webjars/font-awesome/5.15.2/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="common/css/style.css">
<link rel="image/x-icon" href="fa fa-icon">
<!-- Navigation Bar starts here -->
<nav class="px-3 navbar navbar-expand-lg navbar-dark bg-custom">
	<div class="container-fluid">
		<a class="navbar-brand fst-italic" href="index.jsp"><i
			class="fa fa-bookmark"> Developers' Point</i></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<%
				UserDetails userDetails = (UserDetails) session.getAttribute("logedInUser");
				if (userDetails != null) {
				%>
				<li class="nav-item"><a class="nav-link" href="home.jsp"><i class="fa fa-home" aria-hidden="true">Home</i></a></li>
				<% } %>
				<li class="nav-item"><a class="nav-link" aria-current="page" href="courses.jsp"><i class="fa fa-user-graduate"> Courses</i></a></li>
				<li class="nav-item"><a class="nav-link" href="contact.jsp"><i class="fa fa-shopping-basket"> Contact</i></a></li>
			</ul>
			<% if (userDetails != null) { %>
			<div class="d-flex">
				<a class="btn btn-custom btn-outline-dark mx-1"
					data-bs-toggle="modal" data-bs-target="#exampleModal"><i
					class="fa fa-user-circle"> <%=userDetails.getFullName()%></i> </a> <a
					href="LogoutServlet" class="btn btn-custom btn-oFutline-dark mx-1"><i
					class="fa fa-sign-out-alt"> logout</i> </a>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title text-center fs-2" id="exampleModalLabel">Profile
								Details</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<table class="table table-striped text-center">
								<thead>
									<tr>
										<th scope="col" colspan="2"><i class="fa fa-user-circle fs-4"> DETAILS</i></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">Email ID:</th>
										<td><i><%=userDetails.getEmail()%></i></td>
									</tr>
									<tr>
										<th scope="row">Name:</th>
										<td><%=userDetails.getFullName()%></td>
									</tr>
									<tr>
										<th scope="row">User since:</th>
										<td><%=userDetails.getRegistraionDate()%></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<a class="btn btn-info px-3 w-100" role="button"
								href="updateUser.jsp?userId=<%=userDetails.getEmail()%>">Edit</a>
						</div>
					</div>
				</div>
			</div>

			<% } else { %>
			<div class="d-flex">
				<a href="register.jsp" class="btn btn-custom btn-outline-dark mx-1"><i
					class="fa fa-user-plus"> Register</i> </a> <a href="login.jsp"
					class="btn btn-custom btn-outline-dark mx-1"><i
					class="fa fa-user-circle"> login</i> </a>
			</div>
			<% } %>
		</div>
	</div>
</nav>