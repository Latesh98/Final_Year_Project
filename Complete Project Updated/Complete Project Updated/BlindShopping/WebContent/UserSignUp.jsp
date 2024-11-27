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
<script>
    function AllowAlphabet() {
		if (!ureg.fname.value.match(/^[a-zA-Z]+$/) && ureg.fname.value != "") {
			ureg.fname.value = "";
			ureg.fname.focus();
			alert("Please Enter only alphabet in First Name");
		}
	
		if (!ureg.lname.value.match(/^[a-zA-Z]+$/) && ureg.lname.value != "") {
			ureg.lname.value = "";
			ureg.lname.focus();
			alert("Please Enter only alphabets in Last Name");
		}

	}
    function ageCount() {
        var date1 = new Date();
        var  dob= document.ureg.dob.value;
        var date2=new Date(dob);
        var dd = date2.getDate();
        var mm = date2.getMonth()+1; 
        var yyyy = date2.getFullYear();
        
        if (dob !="") {
            var y1 = date1.getFullYear(); //getting current year
            var y2 = date2.getFullYear(); //getting dob year
            var age = y1 - y2;           //calculating age 
            if(age>=18)
            {
            	return true;
            }
            else
            	{
            	ureg.dob.value = "";
    			ureg.dob.focus();
            	alert("age should be 18+");
            	return false;
            	}
            
        } else {
        	
        	return false;
        }

    }

    
	function validEmail() 
	{
		var mail = document.ureg.email.value;
		if (mail == "") 
		{
			document.ureg.email.focus();
			document.ureg.email = "";
			alert("Please insert Email Address");

			return false;
		}
		if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail)) {
		} else {
			document.ureg.email = "";
			document.ureg.email.focus();
			
			alert("Email Address is Not Valid");

			return false;
		}
	}
	function Validate() 
	{
		var y = document.ureg.mnumber.value;

		if (y.charAt(0)!="7"&&y.charAt(0)!="8"&&y.charAt(0)!="9" ) 
        {
			ureg.mnumber.value = "";
			ureg.mnumber.focus();
             alert("Invalide Start Digit");
             return false;
        } 
		
		if (isNaN(y) || y.indexOf(" ") != -1) {

			ureg.mnumber.value = "";
			ureg.mnumber.focus();
			alert("Enter Only Numeric value");
			return false;
		}
		if (y.length != 10) 
		{
			ureg.mnumber.value = "";
			ureg.mnumber.focus();
			alert("Enter 10 Number");
			return false;
		}

		if (!y.match(/^[0-9]+$/) && y != "") {
			y = "";
			
			ureg.mnumber.value = "";
			ureg.mnumber.focus();
			alert("Enter only Digits");
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
	function validprn() {
	      var pass = document.ureg.prn.value;
	       if (pass != "") 
			{
				if (pass.length < 12) 
				{
					document.ureg.prn.focus();
					document.ureg.prn="";
					alert("prn must contain at least 12 characters!");
					
					return false;
				}
			}
	       else
	    	   {
	    	   document.ureg.prn.focus();
				document.ureg.prn="";
				alert("Please Insert prn");
				
				return false;
	    	   
	    	   }
		}
	

	

</script>
</head>

<body>
<%
String Result=request.getParameter("Result");
if(Result.equals("Duplicate"))
{
	out.print("<script>alert('Mobile or Email Address Already Registered')</script>");
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
            <div class="pageform">
            <h3 style="color: #0084b4;text-align: center;margin-bottom: 7%">New User Registration</h3>
            <form action="./StudentRegisteration" method="post" name="ureg">
            <br>
            <br>
            <br>
            <br><br>
            <label>First Name</label><br>
            <input type="text" name="fname" required="required" onblur="return AllowAlphabet()"><br>
            <label>Last Name</label><br>
            <input type="text" name="lname" required="required" onblur="return AllowAlphabet()"><br>
             <label>Address</label><br>
            <input type="text" name="address" required="required"><br>
            <label>Mobile Number</label><br>
            <input type="text" name="mnumber" required="required" onblur="return Validate()"><br>
            <label>Email Address</label><br>
            <input type="email" name="email" required="required" onblur="return validEmail()"><br>
            <label>Birthday</label><br>
            <input type="date" name="dob" required="required" onblur="return ageCount()"><br>
            <label>Gender</label><br>
            <input type="radio" name="gender" value="Male" checked="checked" required="required">Male
			<input type="radio" name="gender" value="Female">Female<br>
			<label>Password</label><br>
            <input type="password" name="password" required="required" onblur="return validuaernameandpass()"><br>
            <button type="submit">Register</button>
            
            </form>
            </div>
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