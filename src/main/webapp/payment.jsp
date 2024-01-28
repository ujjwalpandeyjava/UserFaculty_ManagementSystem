<%@page import="entities.CourseList"%>
<%@page import="connection.DBConnection"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="stylesheet/payment.css">
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=KoHo&family=Varela+Round&display=swap')
	;

.bg-cus {
	background-color: #f5eaf7;
}

.main {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	flex-wrap: nowrap;
	min-height: 70vh;
	margin: 0;
}

.main-in {
	min-width: 75%;
	max-width: 80%;
	height: 100%;
	border-bottom-right-radius: 30px;
	border-top-left-radius: 18px;
	box-shadow: 11px -11px 14px 2px #9ac1ff, -9px 9px 10px 0px #f2c8ff;
	margin: 80px auto;
	padding: 12px 15px;
	position: relative;
	transition: all .7s ease;
	height: 100%
}

.tag {
	top: 100px;
	visibility: hidden;
	background: transparent;
	right: -5px;
	position: absolute;
	padding: 3px 15px 3px 21px;
	border-radius: 59px 0 0 10px;
	box-shadow: 0px 0px 3px #39ecf8;
	z-index: -1;
	background: transparent;
	transition-delay: 0.91s;
	transition: all .6s cubic-bezier(0, 0.34, 0.33, 1.06), visibility 0.7s
		ease 0.001s;
}

.main-in:hover {
	border-top-right-radius: 30px;
	border-bottom-left-radius: 30px;
	box-shadow: 0px 0px 8px 1px #2141d5, 13px -15px 14px 0px #9ac1ff, -13px
		13px 15px 0px #d869f9;
	/*border-top-left-radius: 0px;*/
}

.main-in:hover  .tag {
	z-index: 1;
	visibility: visible;
}

.main-in:hover .payment-heading {
	transition: text-shadow .7s ease;
	text-shadow: 0px 0px 2.7px blue, 4px 8px 7px #9de0f0;
}

.tag:hover {
	border-radius: 59px 0 0 10px;
	box-shadow: -14px 0px 2px 2px #6b41fc;
	font-size: larger;
	transition-delay: 0.001s;
}

.payment-description {
	font-family: 'KoHo', sans-serif;
	line-height: 3.3rem;
}

.payment-description span {
	font-family: 'Varela Round', sans-serif;
}

.button {
	color: blue;
	text-decoration: blink;
	margin-top: 10px;
	margin-right: 5px;
	padding: 5px 10px;
	display: inline-block;
}

.button:hover, button:hover {
	color: blue;
	text-shadow: 0px 0px 4px #5df0f7;
	margin-top: 5px;
	box-shadow: 1px 3px 2px blue;
	border-radius: 20px;
	border: 1px solid blue;
	margin-top: 5px;
	box-shadow: 1px 3px 2px blue;
	border-radius: 20px;
	box-shadow: 1px 3px 2px blue;
	border-radius: 20px;
	border-radius: 20px;
}

.bg-linear-grad {
	background: linear-gradient(180deg, #9458ca, #BE63FF, #b977f4, #BE63FF, #9978db);
}

.flex-modal {
	display: flex;
	justify-content: center;
	align-items: center;
	align-content: center;
	flex-direction: column;
	flex-wrap: nowrap;
	flex-direction: column;
}

.flex-modal-in {
	min-height: 10vh;
	display: flex;
	flex-direction: column;
	justify-content: center;
	flex-wrap: nowrap;
	align-items: center;
	width: 90%;
}

.flex-modal-in>div {
	width: 100%;
	margin: 10px 0;
	background: linear-gradient(180deg, #7706d8, #ae67ec);
	/*box-shadow: -1px 2px 6px #88b6a5;*/
	border-radius: 6px;
	padding: 15px;
	font-size: 45px;
	margin: 10px 0;
}

.cardDetails {
	background: white;
	display: flex;
	color: black;
	border-radius: 0px;
	font-size: 15px;
	flex-direction: column;
	flex-wrap: nowrap;
	justify-content: center;
	align-items: flex-start;
}

.cardDetails>div {
	padding: 6px;
	width: 100%;
	display: flex;
	flex-direction: column;
	align-items: flex-start;
}

.cardDetails>div>input[type="text"] {
	width: 100%
}

.modal-footer>a {
	color: white;
}

.payment-heading {
	margin-top: 30px;
	font-family: cursive;
	font-size: 2.5rem;
	font-weight: bold;
	text-shadow: 0px 0px 2.7px blue;
}

.main-in:hover>.payment-heading:hover {
	text-shadow: 0px 0px 2.7px blue, -9px 6px 7px #9de0f0
}
</style>
<title>Course detail | DevelpersPoint</title>
</head>
<body>
	<%@include file="common/navbar.jsp"%>
	<%
	int id = Integer.parseInt(request.getParameter("courseId"));
	Session sess = DBConnection.getFactory().openSession();
	sess.beginTransaction();
	CourseList specific = (CourseList) sess.get(CourseList.class, id);
	%>
	<div class="main">
		<div class="main-in text-center">
			<h2 class="payment-heading">
				Buying
				<%=specific.getLang()%>
				Course
			</h2>
			<div class="tag">Great choice</div>
			<br>
			<div class="paymentSecv fs-3">
				<i class="fas fa-rupee-sign fs-1"> <%=specific.getCoursePrice() - (specific.getDiscount() * specific.getCoursePrice() / 100)%></i>
				<br> This is the best course for the people who are at
				<%=specific.getLevel()%>
				level
				<hr>
				<br>
				<div class="payment-description">
					Price: <i class="fas fa-rupee-sign fs-5"></i> <span> <%=specific.getCoursePrice()%></span><br>
					Discount: <span><%=specific.getDiscount()%>%</span><br> <i
						class="fas fa-rupee-sign fs-5"></i><span>-<%=specific.getCoursePrice() * specific.getDiscount() / 100%></span>
					<hr
						style="width: 40%; margin: 0 auto; color: #dd4c12; height: 2.5px; margin-bottom: 5px; margin-top: 10px;">
					Total price: <i class="fas fa-rupee-sign fs-5"></i><%=specific.getCoursePrice() - (specific.getCoursePrice() * specific.getDiscount() / 100)%>
				</div>
				<br> <br>
				<div style="padding: 8px;">
					<a class="button" data-toggle="modal" data-target="#creditCardPay"
						data-placement="top"><i class="fas fa-credit-card"></i> Credit
						card</a> <a class="button" data-toggle="modal"
						data-target="#debitCardPay" data-placement="top"><i
						class="far fa-credit-card"></i> Debit card </a> <a class="button"
						data-toggle="modal" data-target="#paypalPay" data-placement="top"><i
						class="fab fa-cc-paypal"></i> Pay pal </a> <a class="button"
						data-toggle="modal" data-target="#upiPay" data-placement="top"><i
						class="fas fa-globe-asia"></i> UPI</a> <a class="button"
						data-toggle="modal" data-target="#netBankingPay"
						data-placement="top"><i class="fas fa-university"></i> Net
						Banking </a>
				</div>
				<br> <br>
				<!-- Models begin here -->
				<!-- Modal Credit card-->
				<div class="modal fade" id="creditCardPay" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content bg-linear-grad" style="color: #f4f8c3;">
							<div class="modal-header" style="display: block !Important;">
								<h3 class="modal-title mt-2 display-7"
									id="exampleModalLongTitle">Checkout</h3>
							</div>
							<div class="modal-body flex-modal" style="">
								<div class="flex-modal-in">
									<div>
										<%=specific.getCoursePrice() - (specific.getCoursePrice() * specific.getDiscount() / 100)%>
										<sup><i class="fas fa-rupee-sign"></i></sup> <br> <span
											style="font-size: 15px;">Pay to Developers' Point pvt.
											ltd.</span>
									</div>
									<div
										style="background: white; color: black; border-radius: 0px; font-size: 15px;"
										class="cardDetails">
										<div style="font-size: 18px;">Pay using Credit Card</div>
										<div class=".text-muted">
											Card Number <br> <input type="text"
												placeholder="XXXX-XXXX-XXXX-XXXX" maxlength="16">
										</div>
										<div class=".text-muted">
											<div style="text-align: left;">
												Expiry date<br> <input type="text" placeholder="mm"
													maxlength="2"> <input type="text"
													placeholder="yyyy" maxlength="4">
											</div>
											<div style="text-align: left;">
												<small>CVC</small><br> <input type="text"
													placeholder="mm" maxlength="3">
											</div>
										</div>
										<div class=".text-muted">
											Card Holder Name <br> <input type="text"
												placeholder="Full Name">
										</div>
										<div>
											<a type="button" style="width: 100%;"
												href="BuyCourseServlet?userId=<%=userDetails.getEmail()%>"
												class="button rounded text-center">Pay Now</a>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<a type="button" class="button" data-dismiss="modal">Close</a> <a
									type="button" style="width: 75%;"
									href="BuyCourseServlet?userId=<%=userDetails.getEmail()%>"
									class="button rounded text-center">Pay Now</a>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal Debit card-->
				<div class="modal fade" id="debitCardPay" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content bg-linear-grad" style="color: #f4f8c3;">
							<div class="modal-header" style="display: block !Important;">
								<h3 class="modal-title mt-2 display-7"
									id="exampleModalLongTitle">Checkout</h3>
							</div>
							<div class="modal-body flex-modal" style="">
								<div class="flex-modal-in">
									<div>
										<%=specific.getCoursePrice() - (specific.getCoursePrice() * specific.getDiscount() / 100)%>
										<sup><i class="fas fa-rupee-sign"></i></sup> <br> <span
											style="font-size: 15px;">Pay to Developers' Point pvt.
											ltd.</span>
									</div>
									<div
										style="background: white; color: black; border-radius: 0px; font-size: 15px;"
										class="cardDetails">
										<div style="font-size: 18px;">Pay using Debit Card</div>
										<div class=".text-muted">
											Card Number <br> <input type="text"
												placeholder="XXXX-XXXX-XXXX-XXXX" maxlength="16">
										</div>
										<div class=".text-muted">
											<div style="text-align: left;">
												Expiry date<br> <input type="text" placeholder="mm"
													maxlength="2"> <input type="text"
													placeholder="yyyy" maxlength="4">
											</div>
											<div style="text-align: left;">
												<small>CVC</small><br> <input type="text"
													placeholder="mm" maxlength="3">
											</div>
										</div>
										<div class=".text-muted">
											Card Holder Name <br> <input type="text"
												placeholder="Full Name">
										</div>
										<div>
											<a type="button" style="width: 100%;"
												href="BuyCourseServlet?userId=<%=userDetails.getEmail()%>"
												class="button rounded text-center">Pay Now</a>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<a type="button" class="button" data-dismiss="modal">Close</a> <a
									type="button" style="width: 75%;"
									href="BuyCourseServlet?userId=<%=userDetails.getEmail()%>"
									class="button rounded text-center">Pay Now</a>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal Pay pal  -->
				<div class="modal fade" id="paypalPay" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content bg-linear-grad" style="color: #f4f8c3;">
							<div class="modal-header" style="display: block !Important;">
								<h3 class="modal-title mt-2 display-7"
									id="exampleModalLongTitle">Checkout</h3>
							</div>
							<div class="modal-body flex-modal" style="">
								<div class="flex-modal-in">
									<div>
										<%=specific.getCoursePrice() - (specific.getCoursePrice() * specific.getDiscount() / 100)%>
										<sup><i class="fas fa-rupee-sign"></i></sup> <br> <span
											style="font-size: 15px;">Pay to Developers' Point pvt.
											ltd.</span>
									</div>
									<div
										style="background: white; color: black; border-radius: 0px; font-size: 15px;"
										class="cardDetails">
										<div style="font-size: 18px;">Pay using PayPal</div>
										<div class=".text-muted">
											Enter Pay pal id: <br> <input type="text"
												placeholder="XXXX@paypal.com" maxlength="30">
										</div>

										<div>
											<a type="button" style="width: 100%;"
												href="BuyCourseServlet?userId=<%=userDetails.getEmail()%>"
												class="button rounded text-center">Pay Now</a>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer ">
								<a type="button" class="button fs-6" data-dismiss="modal">Close</a>
								<a type="button" style="width: 75%;"
									href="BuyCourseServlet?userId=<%=userDetails.getEmail()%>"
									class="button rounded text-center fs-6">Pay Now</a>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal upi -->
				<div class="modal fade" id="upiPay" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content bg-linear-grad" style="color: #f4f8c3;">
							<div class="modal-header" style="display: block !Important;">
								<h3 class="modal-title mt-2 display-7"
									id="exampleModalLongTitle">Checkout</h3>
							</div>
							<div class="modal-body flex-modal" style="">
								<div class="flex-modal-in">
									<div>
										<%=specific.getCoursePrice() - (specific.getCoursePrice() * specific.getDiscount() / 100)%>
										<sup><i class="fas fa-rupee-sign"></i></sup> <br> <span
											style="font-size: 15px;">Pay to Developers' Point pvt.
											ltd.</span>
									</div>
									<div
										style="background: white; color: black; border-radius: 0px; font-size: 15px;"
										class="cardDetails">
										<div style="font-size: 18px;">Pay using PayPal</div>
										<div class=".text-muted">
											Enter upi id: <br> <input type="text"
												placeholder="XXXX@upiProvider.com" maxlength="30">
										</div>

										<div>
											<a type="button" style="width: 100%;"
												href="BuyCourseServlet?userId=<%=userDetails.getEmail()%>"
												class="button rounded text-center">Pay Now</a>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer ">
								<a type="button" class="button fs-6" data-dismiss="modal">Close</a>
								<a type="button" style="width: 75%;"
									href="BuyCourseServlet?userId=<%=userDetails.getEmail()%>"
									class="button rounded text-center fs-6">Pay Now</a>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal Net Banking -->
				<div class="modal fade" id="netBankingPay" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content bg-linear-grad" style="color: #f4f8c3;">
							<div class="modal-header" style="display: block !Important;">
								<h3 class="modal-title mt-2 display-7"
									id="exampleModalLongTitle">Checkout</h3>
							</div>
							<div class="modal-body flex-modal" style="">
								<div class="flex-modal-in">
									<div>
										<%=specific.getCoursePrice() - (specific.getCoursePrice() * specific.getDiscount() / 100)%>
										<sup><i class="fas fa-rupee-sign"></i></sup> <br> <span
											style="font-size: 15px;">Pay to Developers' Point pvt.
											ltd.</span>
									</div>
									<div
										style="background: white; color: black; border-radius: 0px; font-size: 15px;"
										class="cardDetails">
										<div style="font-size: 18px;">Pay using Net Banking</div>
										<div class=".text-muted">
											Enter Net Banking id: <br> <input type="text"
												placeholder="XXXX@bank.com" maxlength="30">
										</div>

										<div>
											<a type="button" style="width: 100%;"
												href="BuyCourseServlet?userId=<%=userDetails.getEmail()%>"
												class="button rounded text-center">Pay Now</a>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer ">
								<a type="button" class="button fs-6" data-dismiss="modal">Close</a>
								<a type="button" style="width: 75%;"
									href="BuyCourseServlet?userId=<%=userDetails.getEmail()%>"
									class="button rounded text-center fs-6">Pay Now</a>
							</div>
						</div>
					</div>
				</div>
				<!-- Models begin here -->
			</div>
		</div>
	</div>
	<%
	sess.getTransaction().commit();
	sess.close();
	%>
	<script type="text/javascript">
		function batchCourseEnquary() {
			alert("Feel free to ask anything, and sit back freely we will reach you in 25min");
		}
		//onclick="batchCourseEnquary()"
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<%@include file="common/footer.jsp"%>
</body>
</html>