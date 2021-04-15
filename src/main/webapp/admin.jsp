<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style type="text/css">
.courses, .user {
	background-color: #bfd4ec;
	margin: 10px;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
	border-radius: 5px;
	text-align: center;
}

.customFlexCard {
	min-width: 200px;
	text-align: center;
	margin: 4px 7px;
}

.card {
	padding: 0px;
}
</style>
<title>Admin | DevellpersPoint</title>
</head>
<body style="background-color: rgb(186, 226, 238);">
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
	</div>

	<h2 class="display-3 text-center m-1">This will stay</h2>

	<hr>

	<h2 class="display-3 text-center m-1">Courses</h2>
	<hr>
	<div class="courses">
		<div class="p-2 customFlexCard">
			<div class="card border-secondary mb-3 col" style="max-width: 18rem;">
				<div class="card-header">
					<b>View List of All courses</b>
				</div>
				<div class="card-body text-secondary">
					<h5 class="card-title">A list of all courses available</h5>
					<p class="card-text">
						Will show a list of courses with details and 'Two buttons' <br>⦾
						One to do editing to the course <br> ⦾ Another to delete the
						course
					</p>
					<a class="btn btn-info" href="">View all courses</a>
				</div>
			</div>
		</div>
		<div class="p-2 customFlexCard">
			<div class="card border-secondary mb-3 col" style="max-width: 18rem;">
				<div class="card-header">
					<b>Add new coures</b>
				</div>
				<div class="card-body text-secondary">
					<h5 class="card-title">Add more courses</h5>
					<p class="card-text">
						Contains a form with input fields:- <br> ⦾ Course title <br>
						⦾ Price of course<br> ⦾ Description<br> ⦾ For which
						subject it is for<br>
					</p>
					<a class="btn btn-info" href="">Add new course</a>

				</div>
			</div>
		</div>
	</div>
	<hr>

	<h2 class="display-3 text-center m-1">User</h2>
	<hr>
	<div class="user">
		<div class="p-2 customFlexCard">
			<div class="card border-secondary mb-3 col" style="max-width: 18rem;">
				<div class="card-header">
					<b>All users</b>
				</div>
				<div class="card-body text-secondary">
					<h5 class="card-title">List of current user</h5>
					<p class="card-text">
						Will show a list of users with details with 'Two buttons' <br>⦾
						One to do editing of that user <br> ⦾ Another to delete the
						course
					</p>
					<a class="btn btn-info" href="">View all users</a>
				</div>
			</div>
		</div>
		<div class="p-2 customFlexCard">
			<div class="card border-secondary mb-3 col" style="max-width: 18rem;">
				<div class="card-header">
					<b>All faculty</b>
				</div>
				<div class="card-body text-secondary">
					<h5 class="card-title">List of Faculties</h5>
					<p class="card-text">
						Shows a list of faculty in details with 'Two buttons' <br>⦾
						Edit that user <br>⦾ Delete the user
					</p>
					<a class="btn btn-info" href="">View all faculty</a>
				</div>
			</div>
		</div>
		<div class="p-2 customFlexCard">
			<div class="card border-secondary mb-3 col" style="max-width: 18rem;">
				<div class="card-header">
					<b>All student</b>
				</div>
				<div class="card-body text-secondary">
					<h5 class="card-title">List of Students</h5>
					<p class="card-text">
						Shows a list of students in details with 'Two buttons' <br>⦾
						Edit that user <br>⦾ Delete the user
					</p>
					<a class="btn btn-info" href="">View all student</a>
				</div>
			</div>
		</div>
		<div class="p-2 customFlexCard">
			<div class="card border-secondary mb-3 col" style="max-width: 18rem;">
				<div class="card-header">
					<b>Add User</b>
				</div>
				<div class="card-body text-secondary">
					<h5 class="card-title">Add a User</h5>
					<p class="card-text">
						To add a new user fill: <br>⦾ First and Last Name of user <br>⦾
						Email, Password of user <br>⦾ Type of user
					</p>
					<a class="btn btn-info" href="">Add new user</a>
				</div>
			</div>
		</div>
	</div>
	<hr>



	<%@include file="common/footer.jsp"%>
</body>
</html>