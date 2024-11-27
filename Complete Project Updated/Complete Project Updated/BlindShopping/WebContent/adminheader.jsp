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
<link rel="stylesheet" type="text/css" href="assets/font/font.css" />
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css" media="screen" />
<link rel="stylesheet" type="text/css" href="assets/css/style.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="assets/css/responsive.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="assets/css/jquery.bxslider.css" media="screen" />
<script type="text/javascript" src="assets/js/jquery-min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="assets/js/selectnav.min.js"></script>
<style>
         blink {
           color:#fff;
           -webkit-animation: blink 1s step-end infinite;
           animation: blink 1s step-end infinite
         }
 
          @-webkit-keyframes blink {
          67% { opacity: 0 }
         }
 
         @keyframes blink {
         67% { opacity: 0 }
        }
 </style>
</head>
<body>
<%
Integer id=(Integer)session.getAttribute("id");
%>
	<div class="body_wrapper">
		<div class="center">
			<div class="header_area">
				<div class="logo floatleft">
					<a href="AdminHome.jsp?Result=">
					<h1>Shopping Cart</h1></a>
				</div>
				<div class="logo floatright" style="text-align: center;height: auto">
					<h3 style="font-size: 20px"><u><%="Admin" %></u></h3>
				</div>
			</div>
			<div class="main_menu_area" style="margin-top: 10px">
				<ul id="nav">
					<li><a href="AdminHome.jsp?Result=">Home</a></li>
					<li><a href="AddProduct.jsp?Result=">Add Product</a></li>
					<li><a href="ViewProduct.jsp?Result=">View Product</a></li>
					
					<li><a href="ViewUsers.jsp?Result=">View Users</a></li>
					<li><a href="./Logout?Result=admin">Logout</a></li>
                </ul>
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