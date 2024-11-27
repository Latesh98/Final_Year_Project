package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String result=request.getParameter("Result");
			if(result.equals("user")){
			session.removeAttribute("id");
			session.removeAttribute("firstname");
			session.removeAttribute("lastname");
			session.removeAttribute("username");
			session.invalidate();
			response.sendRedirect("UserSignIn.jsp?Result=Logoutsucessful");
			
		}
		else
		{
			session.removeAttribute("id");
			session.invalidate();
			response.sendRedirect("AdminSignIn.jsp?Result=Logoutsucessful");	
		}
	}

}
