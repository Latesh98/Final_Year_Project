package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dbConnector.DbConnection;

/**
 * Servlet implementation class WarnStudent
 */
@WebServlet("/WarnStudent")
public class WarnStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String qid="";

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		qid=request.getParameter("qid");
		System.out.println(qid);
		int uid=0;
		String question="",date="",name="",mobile="";
		
		try {
			DbConnection dbConnection = new DbConnection();
			String query="SELECT * FROM `newquestion` WHERE srno ='"+qid+"'";
			//System.out.println(query);
			
			ResultSet rs= dbConnection.selectOperation(query);
			if(rs.next())
			{
			question=rs.getString("question");
			//System.out.println(question);
			date=rs.getString("date");
			//System.out.println(date);
			uid=rs.getInt("askby");
			//System.out.println(uid);
			}
			query="SELECT * FROM studentrecord where sid='"+uid+"'";
			//System.out.println(query);
			ResultSet rs1=dbConnection.selectOperation(query);
			
			
			if(rs1.next())
			{
			name=rs1.getString("firstname")+" "+rs1.getString("lastname");	
			mobile=rs1.getString("mobile");
			}
			System.out.println(mobile);
			String abc = "8908";
            String msgC = "Hi "+name+",\nThis message is sent behalf of College admin to warn you for asking "+question+" on date("+date+")\nBe careful next time\nThank you";
            String myURL = "http://sms.wecreatead.com/API/WebSMS/Http/v1.0a/index.php";
            SMS.callURL(myURL,msgC,mobile);
            dbConnection.inupdelOperation("UPDATE `newquestion` SET `status` = 'Closed' WHERE `newquestion`.`srno` = "+qid+"; ");
			response.sendRedirect("NewQuestion.jsp?Result=");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
