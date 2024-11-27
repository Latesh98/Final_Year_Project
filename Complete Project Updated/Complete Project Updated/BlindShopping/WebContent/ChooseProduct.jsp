<%@page import="controller.ExtractNumber"%>
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
		Integer id = (Integer) session.getAttribute("id");
		String fname = session.getAttribute("fname").toString();
		String productname=request.getParameter("productname");
		ExtractNumber extractNumber=new ExtractNumber();
		
		String pid = extractNumber.extractNumber(productname);
		System.out.println("On Choose Product:"+pid);
		Connection con = DbConnection.getConnection();
		session.setAttribute("pid", pid);
		String query = "select * from product where id='"
				+ pid + "'";
//		System.out.println(query);
	%>
	<div class="body_wrapper">
		<div class="center">

			<div class="container">
				<div class="row" style="padding: 1%;">
					<div class="col-sm-12 col-md-12 col-lg-12">
						<div
							class="col-xs-12 col-sm-offset-1 col-sm-10 col-md-offset-1 col-md-10 col-lg-offset-1 col-lg-10">
							<br>



							<div class="pageform">
								<div class="table-responsive">
									<h1>Your Selected Product is</h1>
									<table class="table "
										style="width: 100%; margin: 0; border: 1px solid #fff; color: #000; font-size: 15px">
										<thead>
											<tr>
												<th>Sr. No</th>
												<th>Product ID</th>
												<th>Product Name</th>
												<th>Image</th>
												<th>Price</th>
												<th>Speak</th>


											</tr>
											<tr>
												<%
												Voicemsg msg=new Voicemsg();
													String price = "";
													String name = "";
													int pid1;
													int i = 0;
													PreparedStatement ps = con.prepareStatement(query);
													ResultSet rs = ps.executeQuery();
													if (rs.next()) {
														pid1=rs.getInt("id");
														name = rs.getString("name");
														price = rs.getString("price");
														String image = rs.getString("image");
														i++;
														msg.talk("You choose+"+name+" Price is"+price+" Please choose which type payment you want to choose online or cash on delivery");
												%>
												<td><%=i%></td>
												<td><%=pid%></td>
												<td><%=name%></td>
												<td><img src="products/<%=image%>"
													style="width: 70px; height: 70px;" /></td>
												<td><%=price%></td>
												<td><button class="btn btn-xs btn-bullhorn"
														onclick='window.open("Texttospeech2.jsp?pid=<%=pid%>&productname=<%=name%>&itemname=<%=name%>&price=<%=price%>")'">
														<i class="fa fa-bullhorn fa-2x"></i>
													</button></td>
												</td>

											</tr>
											<%
												}
											%>
											<tr>

												<td></td>
											</tr>
										</thead>
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
									<h1>Choose Which type you want to payment</h1>
									<table class="table "
										style="width: 100%; margin: 0; border: 1px solid #fff; color: #82e0aa; font-size: 15px">
										<form id="labnol" name="ureg" method="get"
											action="https://www.google.com/search">
											<div class="speech">
												<textarea rows="5" cols="100" placeholder="Payment type" name="pid"
													id="transcript" onblur="return getData()"></textarea>


												<!-- <input type="text"   />  -->
												<!-- <img onclick="startDictation()" src="//i.imgur.com/cHidSVu.gif" /> -->
											</div>
										</form>



									</table>
								</div>

							</div>
							</form>

						</div>
					
						
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function getData() {
			var text = document.ureg.pid.value;
		//	alert(text);
			window.location.replace("PaymentChoose.jsp?payment="+text);

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