<%@page import="controller.Voicemsg"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<title>Blind Shoping</title>
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
<style>
.speech {
	border: 1px solid #DDD;
	width: 360px;
	padding: 0;
	margin: 0
}
</style>

<script>
    function AllowAlphabet() {
		if (!ureg.fname.value.match(/^[a-zA-Z]+$/) && ureg.fname.value != "") {
			ureg.fname.value = "";
			ureg.fname.focus();
			alert("Please Enter only alphabet in UserName");
		}
	}
	function validuaernameandpass() {
	      var pass = document.ureg.password.value;
	       if (pass != "") 
			{
				if (pass.length < 6) 
				{
					document.ureg.password.focus();
					document.ureg.password="";
					alert("Password must contain at least 6 characters!");
					
					return false;
				}
			}
	       else
	    	   {
	    	   document.ureg.password.focus();
				document.ureg.password="";
				alert("Please Insert password");
				
				return false;
	    	   
	    	   }
		}
</script>
</head>
<body onkeydown="CheckKey()">
<%
//int uid = Integer.parseInt((String)session.getAttribute("uid"));
String Result=request.getParameter("Result");
if(Result.equals("failed"))
{
	out.print("<script>alert('Invalid UserId')</script>");
}

%>
	<div class="body_wrapper">
		<div class="center">
			<div class="header_area">
				<div class="logo floatleft">
					<a href="index.jsp"><img src="imgs/logo.png" alt="" /></a>
				</div>
			</div>
			<div class="main_menu_area" style="margin-top: 10px">
				<ul id="nav">
					<li><a href="index.jsp">Home</a></li>
					<li><a href="UserSignIn.jsp?Result=">User</a>
						<ul>
							<li><a href="UserSignIn.jsp?Result=">Sign In</a></li>
							<li><a href="UserSignUp.jsp?Result=">Sign Up</a></li>
						</ul></li>
					<li><a href="AdminSignIn.jsp?Result=">Admin</a></li>
					<li><a href="#">About Project</a></li>
                </ul>
            </div>
            <div class="container">
            <div class="row" style="padding:1%;">
            <div class="col-sm-12 col-md-12 col-lg-12">
            <div class="col-xs-12 col-sm-offset-2 col-sm-8 col-md-offset-2 col-md-8 col-lg-offset-2 col-lg-8">
            
            <%
				Voicemsg msg = new Voicemsg();
					msg.talk("Please say your Login UserId");
			%>
            
            <form id="labnol" action="UserSignIn" method="get" name="ureg">
            <div class="pageform">
            <label style="color: #0084b4;text-align: center;margin-bottom: 7%">User Login</label><br>
            <div class="speech">
            <!-- <label>UserName</label><br>
            <input type="text" name="fname" placeholder="Speak username" onblur="return getData()" required="required"><br>
          	<label>Password</label><br>
            <input type="password" name="password" placeholder="Speak password" onblur="return getData()" required="required"><br> -->
            
            <input type="text" placeholder="Speak Your UserId" name="uid"
				id="transcript" onblur="return getData()" maxlength="2">
			<button type="submit">Sign In</button>
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
			var text = document.ureg.uid.value;
		//	alert(text);
			window.location.replace("UserSignIn?uid="+text);
			//window.location.replace("UserSignIn?fname="+fname+ "password="+password);
		}
	</script>
			

<script type="text/javascript" src="assets/js/jquery-min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="assets/js/selectnav.min.js"></script>
<script type="text/javascript">
selectnav('nav', {
    label: 'Menu',
    nested: true,
    indent: '>'
});

</script>

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