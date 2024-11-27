<%@page import="javax.swing.plaf.SliderUI"%>
<%@page import="controller.Voicemsg"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
function loaded()
{
   
    window.setTimeout(CloseMe, 500);
}

function CloseMe() 
{
    window.close();
}
</script>
</head>
<body style="background-image: url('imgs/speaker.gif');" onload="loaded()">
<%
String pid=request.getParameter("pid");
Voicemsg voicemsg=new Voicemsg();
voicemsg.talk("You choose cash on delivery please say ok to place your order");

%>

</body>
</html>