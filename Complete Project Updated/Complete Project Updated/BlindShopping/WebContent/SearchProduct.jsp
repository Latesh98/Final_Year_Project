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
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
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
		StringConvert st = new StringConvert();
		Integer id = (Integer) session.getAttribute("id");
		String fname = session.getAttribute("fname").toString();
		String productname = request.getParameter("hello");
		Connection con = DbConnection.getConnection();
		String str = String.valueOf(productname);
	//	System.out.println("STR:" + str);

		String query = "select * from product where producttype='"
				+ productname + "'";
//		System.out.println(query);

/* Voicemsg msg=new Voicemsg();
msg.talk("Hello you are choose"+productname+" Please choose the product id from the below");
 */
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
									<h1><%=productname%></h1>
									<table class="table "
										style="width: 100%; margin: 0; border: 1px solid #fff; color: #000; font-size: 15px">
										<thead>
											<tr>
												<th>Sr. No</th>
												<th>Product ID</th>
												<th>Product Name</th>
												<th>Image</th>
												<th>Price</th>
												<th>Description</th>
												<th>Speak</th>
											</tr>
											<tr>
												<%
													String price = "";
													String name = "";
													int pid;
													int i = 0;
													PreparedStatement ps = con.prepareStatement(query);
													ResultSet rs = ps.executeQuery();
													while (rs.next()) {
														pid=rs.getInt("id");
														name = rs.getString("name");
														price = rs.getString("price");
														String image = rs.getString("image");
														String description = rs.getString("description");
														i++;
													//	msg.talk("Product no is "+i+"Product name is"+name+" And product is is"+pid);
												%>
												<td><%=i%></td>
												<td><%=pid%></td>
												<td><%=name%></td>
												<td><img src="products/<%=image%>"
													style="width: 70px; height: 70px;" /></td>
												<td><%=price%></td>
												<td><%=description%></td>
												<td><button
														onclick='window.open("Texttospeech.jsp?pid=<%=pid%>&productname=<%=productname%>&itemname=<%=name%>&price=<%=price%>&description=<%=description%>")'">
														<img src="imgs/speaker.png" />
												<%-- <td><button class="btn btn-xs btn-bullhorn"
														onclick='window.open("Texttospeech.jsp?pid=<%=pid%>&productname=<%=productname%>&itemname=<%=name%>&price=<%=price%>&description=<%=description%>")'">
														<i class='fas fa-bullhorn' style='font-size:36px'></i> --%>
														<!-- <i class="fa-solid fa-volume"></i> -->
														<!-- <i class="fa fa-bullhorn fa-2x"></i> -->
													</button></td>
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
									<h1>Which Number Product you want to buy</h1>
									<table class="table "
										style="width: 100%; margin: 0; border: 1px solid #fff; color: #82e0aa; font-size: 15px">
										<form id="labnol" name="ureg" method="get"
											action="https://www.google.com/search">
											<div class="speech">
												<textarea rows="5" cols="100" placeholder="Speak" name="pid"
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
	//		alert(text);
			window.location.replace("ChooseProduct.jsp?productname="+text);

		}
	</script>
	<!-- HTML5 Speech Recognition API cash on delivery -->
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