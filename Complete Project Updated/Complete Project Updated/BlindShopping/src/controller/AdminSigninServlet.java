package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbConnector.DbConnection;

/**
 * Servlet implementation class SignInServlet
 */
@WebServlet("/AdminSigninServlet")
public class AdminSigninServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    String emailaddress,password,query;
	DbConnection dbConnection;
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	Connection con;
	public void init(ServletConfig config) throws ServletException {
		try {
			con=dbConnection.getConnection();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		emailaddress=request.getParameter("email");
		password=request.getParameter("password");
		query="SELECT * FROM admin WHERE username='"+emailaddress+"' And password='"+password+"'";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
			response.sendRedirect("AdminHome.jsp?Result=Done");
			}
			else
			{
				response.sendRedirect("AdminSignIn.jsp?Result=failed");	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			
		} 
	}


