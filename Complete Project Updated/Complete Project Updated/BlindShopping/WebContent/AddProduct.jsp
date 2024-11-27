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
	<jsp:include page="adminheader.jsp"></jsp:include>
	<div class="body_wrapper">
		<div class="center">

			<div class="container">
				<div class="row" style="padding: 1%;">
					<div class="col-sm-12 col-md-12 col-lg-12">
						<div
							class="col-xs-12 col-sm-offset-1 col-sm-10 col-md-offset-1 col-md-10 col-lg-offset-1 col-lg-10">
							<br>


							<form action="./AddProduct" method="post"enctype="multipart/form-data">>
								<div class="pageform">
									<div class="table-responsive">
										<table class="table "
											style="width: 100%; margin: 0; border: 1px solid #fff; color: #82e0aa; font-size: 15px">
											<thead>
												<tr>
													<td>
														<h3
															style="color: #0084b4; text-align: center; margin-bottom: 7%">Product Type
															:</h3>
													</td>
													<td><input type="text" name="producttype" required="required"></td>
												</tr>
												<tr>
													<td>
														<h3
															style="color: #0084b4; text-align: center; margin-bottom: 7%">Product Name
															:</h3>
													</td>
													<td><input type="text" name="productname" required="required"></td>
												</tr>
												<tr>
													<td>
														<h3
															style="color: #0084b4; text-align: center; margin-bottom: 7%">Product Image
															:</h3>
													</td>
													<td><input type="file" name="file" required="required"></td>
												</tr>
												<tr>
													<td>
														<h3
															style="color: #0084b4; text-align: center; margin-bottom: 7%">Price
															:</h3>
													</td>
													<td><input type="text" name="price" required="required"></td>
												</tr>
												
												<tr>
													<td>
														<h3
															style="color: #0084b4; text-align: center; margin-bottom: 7%">Description
															:</h3>
													</td>
													<td><textarea name="description" rows="4" placeholder="Description..." required="required"></textarea>
													<!-- <input type="text" name="description" required="required"> --></td>
												</tr>
												
												
												
											</thead>
										</table>
									</div>

									<input type="submit" style="width: 100%; padding: 2%"
										value="Add Product">
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