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
import javax.servlet.http.HttpSession;

import dbConnector.DbConnection;

/**
 * Servlet implementation class UserSignIn
 */
@WebServlet("/UserSignIn")
public class UserSignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
    String fname,password,query;
    Connection con;
	public void init(ServletConfig config) throws ServletException {
		try {
			con=DbConnection.getConnection();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		fname=request.getParameter("fname");
		HttpSession session=request.getSession();
		password=request.getParameter("password");
		String uid = request.getParameter("uid");
		System.out.println("Userid= "+uid);
		query="SELECT * FROM user WHERE uid='"+uid+"'";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				//uid=rs.getInt(1);
				session.setAttribute("uid",uid);
				session.setAttribute("fname", rs.getString("fname"));
				session.setAttribute("address", rs.getString("address"));
				
			response.sendRedirect("UserHome.jsp?Result=Done");
			}
			else
			{
				response.sendRedirect("UserSignIn.jsp?Result=failed");	
			}
			
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}
