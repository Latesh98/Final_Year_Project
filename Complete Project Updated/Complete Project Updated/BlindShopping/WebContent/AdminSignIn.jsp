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
<body>
<%
String Result=request.getParameter("Result");
if(Result.equals("failed"))
{
	out.print("<script>alert('Invalid Email or Password')</script>");
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
            <form action="AdminSigninServlet" method="post" name="ureg">
            <div class="pageform">
            <label style="color: #0084b4;text-align: center;margin-bottom: 7%">Admin Login</label><br>
            <label>User Name</label><br>
            <input type="text" name="email" required="required"><br>
          	<label>Password</label><br>
            <input type="password" name="password" required="required"><br>
            <button type="submit">Sign In</button>
            </div>
            </form>
            </div>
            </div>
            </div>
            </div>
		</div>
	</div>
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

</body>
</html>