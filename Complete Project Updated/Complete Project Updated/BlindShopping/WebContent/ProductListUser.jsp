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
	<jsp:include page="userheader.jsp"></jsp:include>
	<%
	Integer id = (Integer) session.getAttribute("id");
	String fname=session.getAttribute("fname").toString();
		String Result = request.getParameter("Result");
	%>
	<div class="body_wrapper">
		<div class="center">

			<div class="container">
				<div class="row" style="padding: 1%;">
					<div class="col-sm-12 col-md-12 col-lg-12">
						<div
							class="col-xs-12 col-sm-offset-1 col-sm-10 col-md-offset-1 col-md-10 col-lg-offset-1 col-lg-10">
							<br>


							<form action="./UploadNotices" method="post">
								<div class="pageform">
									<div class="table-responsive">
										<table class="table "
											style="width: 100%; margin: 0; border: 1px solid #fff; color: #000; font-size: 15px">
											<thead>
												<tr>
													<th>Sr. No</th>
													<th>Product Name</th>
													<th>Image</th>
													<th>Price</th>
														
												</tr>
												<tr>
												<%
												int i=0;
												Connection con=DbConnection.getConnection();
												PreparedStatement ps=con.prepareStatement("SELECT * FROM `product`");
												ResultSet rs=ps.executeQuery();
												while(rs.next())
												{
													String productname=rs.getString("name");
													String productimage=rs.getString("image");
													String price=rs.getString("price");
													i++;
												
												
												
												%>
												<td><%=i %></td>
												<td><%=productname %></td>
												<td><img src="products/<%=productimage%>"
									style="width: 70px; height: 70px;" /></td>
												<td><%=price %></td>
												
												</tr>
<%
												}
												%>
												
											</thead>
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


</body>
</html>