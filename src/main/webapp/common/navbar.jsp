<!-- Bootstrap 5 CDN Dependencies -->
<link href="webjars/bootstrap/5.0.0-beta3/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font-awesome CDN Dependencies -->
<link href="webjars/font-awesome/5.15.2/css/all.min.css"
	rel="stylesheet"><!-- 
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">-->
<!-- Custom -->
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
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="#"><i class="fa fa-home"> Courses</i></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fa fa-plus" aria-hidden="true"> New Batches</i></a></li>
				<li class="nav-item"><a class="nav-link" href="contact.jsp"><i
						class="fa fa-shopping-basket"> Contact</i></a></li>
			</ul>
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title text-center fs-2" id="exampleModalLabel">Profile
								Details</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close">hii</button>
						</div>
						<div class="modal-body">
							<table class="table table-striped text-center">
								<thead>
									<tr>
										<th scope="col" colspan="2"><i
											class="fa fa-user-plus fs-4"> Register</i></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">Id:</th>
										<td>id here</td>
									</tr>
									<tr>
										<th scope="row">Name:</th>
										<td>name here</td>
									</tr>
									<tr>
										<th scope="row">Email id:</th>
										<td>email id here</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">---</button>
						</div>
					</div>
				</div>
			</div>
			<div class="d-flex">
				<a href="register.jsp" class="btn btn-custom btn-outline-dark mx-1"><i
					class="fa fa-user-plus"> Register</i> </a> <a href="login.jsp"
					class="btn btn-custom btn-outline-dark mx-1"><i
					class="fa fa-user-circle"> login</i> </a>
			</div>
		</div>
	</div>
</nav>
<!-- Navigation Bar ends here -->

