<%@page import="controller.Voicemsg"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbConnector.DbConnection"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<title>Blind Shopping</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css"
	href="assets/font/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="assets/font/font.css" />
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
<script type="text/javascript" src="assets/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="assets/js/selectnav.min.js"></script>
</head>
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


<jsp:include page="userheader.jsp"></jsp:include>
<%
if(request.getParameter("not")!=null)
{
	out.println("<script>alert('This type of payment is not available')</script>");
}
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0
	response.setHeader("Cache-Control", "no-store"); // HTTP 1.1
	response.setDateHeader("Expires", 0);
	//Integer uid = (Integer) session.getAttribute("uid");
	String uid = session.getAttribute("uid").toString();
	//String fname = session.getAttribute("fname").toString();
/* 	Voicemsg msg=new Voicemsg();
	msg.talk("Hello please tell us which type product you want to choose");
 */%>
<body onkeydown="CheckKey()">

	<div class="body_wrapper">
		<div class="center">
			<div class="container" style="height: 250px">
				<div class="row" style="padding: 1%;">
					<div class="col-sm-12 col-md-12 col-lg-12">
						<div
							class="col-xs-12 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-lg-offset-2 col-lg-8">
							<div class="table-responsive">
							
								<table class="table "
									style="width: 100%; height: auto; margin: 0; border: 1px solid #fff; color: #82e0aa; font-size: 15px">
									<thead>
										<tr>
											<form id="labnol" name="ureg" method="post">
												<div class="speech">
										<tr>
											<td><textarea rows="5" cols="100" placeholder="Speak"
													name="productname" id="transcript"
													onblur="return getData()"></textarea></td>
										</tr>
										<!-- <tr>
											<td>
												<button type="submit">Search</button>

											</td>
										</tr>
 -->							</div>
							</form>


							</tr>

							</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row" style="padding: 1%;">
				<div class="col-sm-12 col-md-12 col-lg-12">
					<div
						class="col-xs-12 col-sm-offset-10 col-sm-2 col-md-offset-10 col-md-2 col-lg-offset-10 col-lg-2">
						<div class="pageform" style="border: 0px solid;">
							<img alt="" src="imgs/chat.JPG">
							<label style="font-size: 20px; text-align: center;"
								onclick="location.href='ChatbotInteraction.jsp?Result='">Chat
								Bot</label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

	<script>
		function getData() {
			var text = document.ureg.productname.value;
			alert(text);
			window.location = "ChatBotClass?productname="+text;

		}
	</script>
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