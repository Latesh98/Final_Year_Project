<%@page import="controller.Voicemsg"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Set"%>
<%@page import="controller.StringConvert"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbConnector.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<title>Blind Shopping</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css"
	href="assets/font/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css" media="screen" />
<link rel="stylesheet" type="text/css" href="assets/css/style.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="assets/css/responsive.css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="assets/css/jquery.bxslider.css" media="screen" />
<script type="text/javascript" src="assets/js/jquery-min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>

<script type="text/javascript" src="assets/js/selectnav.min.js"></script>
<style>
.speech {
	border: 1px solid #DDD;
	width: 360px;
	padding: 0;
	margin: 0
}

.speech textarea {
	border: 0;
	width: 350px;
	display: inline-block;
	height: 70px;
}

/* .speech img {
	float: right;
	width: 40px
} */
</style>

<style>
blink {
	color: #82e0aa;
	-webkit-animation: blink 1s step-end infinite;
	animation: blink 1s step-end infinite
}

@
-webkit-keyframes blink { 67% {
	opacity: 0
}

}
@
keyframes blink { 67% {
	opacity: 0
}
}
</style>
<body onkeydown="CheckKey()">
	<jsp:include page="userheader.jsp"></jsp:include>
	<%
		String pageid = request.getParameter("pageid");
		Integer id = (Integer) session.getAttribute("id");
		String pid = session.getAttribute("pid").toString();
		String fname = session.getAttribute("fname").toString();
		Connection con = DbConnection.getConnection();
	%>
	<div class="body_wrapper">
		<div class="center">

			<div class="container">
				<div class="row" style="padding: 1%;">

					<%
						String payment = request.getParameter("payment");
						System.out.println(payment);
						if (payment.equalsIgnoreCase("cash on delivery")) {
					%>



					<div class="col-sm-12 col-md-12 col-lg-12">



						<div
							class="col-xs-12 col-sm-offset-1 col-sm-10 col-md-offset-1 col-md-10 col-lg-offset-1 col-lg-10">
							<br>


							<div class="pageform">
								<div class="table-responsive">
									<h1>You Choose Cash On Delivery</h1>
									<table class="table "
										style="width: 100%; margin: 0; border: 1px solid #fff; color: #82e0aa; font-size: 15px">
										<%
											Voicemsg msg = new Voicemsg();
																				msg.talk("You choose Cash on delivery please say ok for complete");
										%>

									</table>
								</div>

							</div>
							</form>

						</div>
						<div
							class="col-xs-12 col-sm-offset-1 col-sm-10 col-md-offset-1 col-md-10 col-lg-offset-1 col-lg-10">
							<br>



							<div class="pageform">
								<div class="table-responsive">
									<h1>Say Ok To continue</h1>
									<table class="table "
										style="width: 100%; margin: 0; border: 1px solid #fff; color: #82e0aa; font-size: 15px">
										<form id="labnol" name="ureg" method="get"
											action="https://www.google.com/search">
											<div class="speech">
												<textarea rows="5" cols="100" placeholder="Speak" name="pid"
													id="transcript" onblur="return getData()"></textarea>


													</div>
										</form>
									</table>
								</div>
							</div>
							</form>
							<script>
								function getData() {
									var text = document.ureg.pid.value;
									//		alert(text);
									window.location = "PlaceOrder.jsp?paymenttype=cash&pid="
											+ text;

								}
							</script>
						</div>
					</div>


					<%
						} else if (payment.equalsIgnoreCase("online")) {
					%>


					<div class="col-sm-12 col-md-12 col-lg-12">



						<div
							class="col-xs-12 col-sm-offset-1 col-sm-10 col-md-offset-1 col-md-10 col-lg-offset-1 col-lg-10">
							<br>



							<div class="pageform">
								<div class="table-responsive">
									<h1>Online Payment</h1>
									<table class="table "
										style="width: 100%; margin: 0; border: 1px solid #fff; color: #82e0aa; font-size: 15px">
										<%
											Voicemsg msg = new Voicemsg();
															msg.talk("You choose Online payment please say the card details");
										%>

									</table>
								</div>

							</div>
							</form>

						</div>

						<div
							class="col-xs-12 col-sm-offset-1 col-sm-10 col-md-offset-1 col-md-10 col-lg-offset-1 col-lg-10">
							<br>



							<div class="pageform">
								<div class="table-responsive">
									<h1>Tell your card details</h1>
									<table class="table "
										style="width: 100%; margin: 0; border: 1px solid #fff; color: #82e0aa; font-size: 15px">
										

										<form id="labnol" name="ureg" method="get"
											action="https://www.google.com/search">
											<div class="speech">
												<input type="text" placeholder="Your card Number"
													name="cardnum" id="transcript" onblur="return getData()"
													maxlength="12">
												<script>
													function getData() {
														var text = document.ureg.cardnum.value;
														//		alert(text);
														window.location = "PaymentChoose2.jsp?cardno="
																+ text;

													}
												</script>


											</div>
										</form>
										
										
																			</table>
								</div>
							</div>
							</form>
							<!-- 							<script>
								function getData() {
									var text = document.ureg.card.value;
									//		alert(text);
									window.location = "PlaceOrder.jsp?paymenttype=online";

								}
							</script>

 -->
						</div>
					</div>

					<%
						} else {
							response.sendRedirect("UserHome.jsp?not=available");
						}
					%>


				</div>
			</div>
		</div>
	</div>
	<!-- HTML5 Speech Recognition API -->
	<script>
		function CheckKey() {
			if (event.keyCode === 13) {
				event.preventDefault();
				startDictation();
			}
		}
		function startDictation() {

			if (window.hasOwnProperty('webkitSpeechRecognition')
					|| window.hasOwnProperty('SpeechRecognition')) {

				var recognition = new webkitSpeechRecognition()
						|| new SpeechRecognition();

				recognition.continuous = false;
				recognition.interimResults = false;

				recognition.lang = "en-US";
				recognition.start();

				recognition.onresult = function(e) {
					console.log(e.results);
					document.getElementById('transcript').value = e.results[0][0].transcript;
					recognition.stop();
					//   document.getElementById('labnol').submit();
				};

				recognition.onerror = function(e) {
					recognition.stop();
				}

			}
		}
	</script>
</body>
</html>