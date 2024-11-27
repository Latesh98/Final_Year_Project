package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbConnector.DbConnection;

/**
 * Servlet implementation class StudentRegisteration
 */
@WebServlet("/StudentRegisteration")
public class StudentRegisteration extends HttpServlet {
	private static final long serialVersionUID = 1L;
    String firstname,lastname,address,birthday,emailaddress,gender,password,query,mobilenumber;
	
    DbConnection dbConnection;
    /**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
	try {
		dbConnection=new DbConnection();
	} catch (ClassNotFoundException | SQLException e) {
		System.out.println(e);
	}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	firstname=request.getParameter("fname");
	lastname=request.getParameter("lname");
	address=request.getParameter("address");
	mobilenumber=request.getParameter("mnumber");
	emailaddress=request.getParameter("email");
	birthday=request.getParameter("dob");
	gender=request.getParameter("gender");
	password=request.getParameter("password");
	query="INSERT INTO `user`(`fname`, `lname`, `address`, `mobile`, `email`, `date`, `gender`, `password`) VALUES ('"+firstname+"','"+lastname+"','"+address+"','"+mobilenumber+"','"+emailaddress+"','"+birthday+"','"+gender+"','"+password+"')";
	
	try {
		int status=dbConnection.inupdelOperation(query);
		response.sendRedirect("UserSignUp.jsp?Result=Done");
		
	} catch (SQLException e) {
		if(e.getMessage().contains("Duplicate entry"))
				{
			    response.sendRedirect("UserSignUp.jsp?Result=Duplicate");
				}
	}
	
	}

}
