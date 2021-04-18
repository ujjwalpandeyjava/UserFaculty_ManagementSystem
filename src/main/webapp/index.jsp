<%@page import="connection.DBConnection"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.Query"%>
<%@page import="entities.CourseList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="stylesheet/index.css">
<title>Developers' Point | IGNOU PROJECT</title>
</head>
<body>
	<%@include file="common/navbar.jsp"%>
	<div class="jumbotron m-3 fs-4">
		<div class="primary-container">
			<div class="section section-1 text-center">
				<h1
					style="color: #fb8c00; margin-top: 0px; margin-bottom: -20px; font-family: 'Belleza'; font-weight: bold;">Our
					Latest Course</h1>
				<%
				Session sess = DBConnection.getFactory().openSession();
				sess.beginTransaction();
				Query query = sess.createQuery("from CourseList ORDER BY courseAddedDate desc");
				query.setFirstResult(0);
				query.setMaxResults(3);
				List<CourseList> col1 = query.list();//will return the records from 5 to 10th number
				Iterator<CourseList> itr1 = col1.iterator();
				CourseList cl = itr1.next();
				%>
				<hr>
				<div class="rows">
					<div class="of2">
						<div class="imagediv">
							<img src="imges/coursesPic/<%=cl.getCourseImage()%>"
								alt="New Batch, join fast"> <br>
						</div>
						<div>
							<p>
								<b>Title:</b>
								<%=cl.getCourseName()%><br> <b>Description:</b>
								<%=cl.getCouseDescription()%><br> <b>Price: </b>Rs
								<%=cl.getCoursePrice()%><br> <b>Launch Date: </b><%=cl.getCourseAddedDate()%><br>
								<a class="btn btn-info px-3 float-right" role="button"
									href="contact.jsp" onclick="batchCourseEnquary()">More
									Detail</a>
							</p>
						</div>
					</div>
					<%
					cl = itr1.next();
					%>
					<div class="of2">
						<div class="imagediv">
							<img src="imges/batches/new_batch2.jpg"
								alt="New Batch, join fast"> <br>
						</div>
						<div>
							<p>
								<b>Title:</b>
								<%=cl.getCourseName()%><br> <b>Description:</b>
								<%=cl.getCouseDescription()%><br> <b>Price: </b>Rs
								<%=cl.getCoursePrice()%><br> <b>Launch Date: </b>
								<%=cl.getCourseAddedDate()%><br> <a
									class="btn btn-info px-3 float-right" href="contact.jsp"
									role="button" onclick="batchCourseEnquary()">More Detail</a>
							</p>
						</div>
					</div>
					<%
					sess.getTransaction().commit();
					sess.close();
					%>
				</div>
				<h1
					style="color: #fb8c00; margin-top: 20px; margin-bottom: 10px; font-family: 'Belleza'; font-weight: bold;">New
					Batch</h1>
				<div class="rows">
					<div class="of1">
						<div class="imagediv">
							<img src="imges/batches/new_batch1.jpg"
								alt="New Batch, join fast">
						</div>
						<div class="text-left">
							<p class="text-left">
								Teaching:Front-end Web Development<br>Description: Learn
								how to develop the web with the help of HTML, CSS, JavaScript,
								Ract, Bootstrap, etc<br> Batch Days: MWF <br> <sub
									class="text-muted">Things are flexible before starting
									the batch, take your step and bend them according to your
									sutiability</sub><br> <a class="btn btn-info px-3 float-right"
									role="button" href="contact.jsp" onclick="batchCourseEnquary()">More
									Detail</a>
							</p>
						</div>
					</div>
					<div class="of1">
						<div class="imagediv">
							<img src="imges/batches/new_batch4.jpg"
								alt="New Batch, join fast">
						</div>
						<div>
							<p>
								Subject: Full Stack Development<br>Description: How to use
								HTML, CSS, JavaScript, Java, Advanced Java, SQL, etc...<br>Batch
								Days: TTS <br> <sub class="text-muted">Things are
									flexible before starting the batch, take your step and bend
									them according to your sutiability</sub></b><br> <a
									class="btn btn-info px-3 float-right" href="contact.jsp"
									onclick="batchCourseEnquary()" role="button">More Detail</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="section section-2 text-center w-100">
				<h1
					style="color: #fb8c00; margin: 20px auto; font-family: 'Belleza'; font-weight: bold;">Our
					Exemplar</h1>
				<div class="students">
					<h2 class="glow">Some of our brilliant students</h2>
					<div class="d-flex justify-content-center flex-wrap">
						<div class="col w-30 p-2" style="min-width: 170px">
							<img width="100%" class="pb-2" src="imges/students/student4.png"
								alt=""> <br>
							<h4>Alina Gomes</h4>
							<strong>Our Silver-ranked</strong> <br> Best AI developer of
							2107 with salary of 35 L.P.A.
						</div>
						<div class="col w-30 p-2" style="min-width: 170px">
							<img width="100%" class="pb-2" src="imges/students/student1.png"
								alt=""> <br>
							<h4>UJJWAL PANDEY</h4>
							<strong>Our Golden student</strong> <br> Got placement in
							google with salary of 40 L.P.A.
						</div>
						<div class="col w-30 p-2" style="min-width: 170px">
							<img width="100%" class="pb-2" src="imges/students/student5.png"
								alt=""> <br>
							<h4>Madara Uchia</h4>
							<strong>Our Bronze student</strong> <br> Best Data Scientist
							of year 2019 with salary of 30 L.P.A.

						</div>
					</div>
				</div>
				<div class="section teachers text-center">
					<div class="mx-auto">
						<img src="imges/teachers/teacher1.png" alt="Mr. Mohit, from india">
						<img src="imges/teachers/teacher2.png"
							alt="Mrs. Jeene, from mexico"> <img
							src="imges/teachers/teacher3.png" alt="Mr. Roy, from usa">
						<img src="imges/teachers/teacher4.png"
							alt="Mr. Ranjeet, from india"> <img
							src="imges/teachers/teacher5.png" alt="Mr. Jay, from india">
					</div>
					<div>Our world wide best m best faculty</div>
				</div>
			</div>
			<div class="section bg-white">
				<div>

					<div class="d-flex">
						<a href="register.jsp"
							class="btn btn-custom btn-outline-dark mx-1 size-Custome"
							style="font-size: 2.1rem;"><i class="fa fa-user-plus ">
								Register</i> </a> <a href="login.jsp"
							class="btn btn-custom btn-outline-dark mx-1 size-Custome"
							style="font-size: 2.1rem;"><i class="fa fa-user-circle ">
								login</i> </a>
					</div>
				</div>
			</div>
			<div class="section section-3">
				<footer class="page-footer font-small blue pt-4">
					<div class="container-fluid text-center text-md-left">
						<div class="row">
							<div class="col-md-5 mt-md-0 mt-3">
								<h5 class="text-uppercase ">Providng excelence to the
									future</h5>
								<p>We are those who provide the best m best faculty to teach
									student ensuring the best future for them</p>
							</div>
							<div class="col-md-3 mb-md-0 mb-3">
								<h5 class="text-uppercase bold">Address</h5>
								<p>
									36,<br> Ground floor, <br> near bank of baroda, <br>
									Sankat Vihar,<br> Dew Delhi, Delhi 110067
								</p>
							</div>
							<div class="col-md-3 mb-md-0 mb-3">
								<h5 class="text-uppercase">Contact us</h5>
								<p>
									View Email: contactdp@Develperpoint.com<br> <a
										href="contact.jsp" class="unstyled">View form</a> from our
									site <br> Contact no: <b> 9876-5432-89</b>
								</p>
							</div>
						</div>
					</div>
				</footer>
			</div>
		</div>

	</div>
	<%@include file="common/footer.jsp"%>
	<script type="text/javascript">
		function batchCourseEnquary() {
			alert("Feel free to ask anything, and sit back freely we will reach you in 25min");
		}
	</script>
</body>
</html>