package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.TreeSet;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbConnector.DbConnection;

/**
 * Servlet implementation class KeyExtractNumber
 */
@WebServlet("/KeyExtractNumber")
public class KeyExtractNumber extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TreeSet<String>data=new TreeSet<String>();
	
	Connection con=null;
	int wordcount=0,checkall=0;
	DbConnection dbConnection=null;
	TreeSet <String> afterStopwords=new TreeSet<String>();

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		try {
			dbConnection=new DbConnection();
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		data.clear();
		HttpSession session=request.getSession();
		
		Integer id=(Integer)session.getAttribute("id");
		
		String typeofquestion="";
		String questiontag="";
		String keyvalue="";
		checkall=0;
		
		String keyword=request.getParameter("productname");
		System.out.println("keyword is "+keyword);
		System.out.println(typeofquestion);
		ExtractDataAndCreateTokens extractDataAndCreateTokens=new ExtractDataAndCreateTokens();
		extractDataAndCreateTokens.setData(keyword);
		TreeSet <String> tokens=new TreeSet<String>();
		tokens=extractDataAndCreateTokens.getTokens();
		System.out.println(tokens);
		StopWordRemove stopWordsRemoval=new StopWordRemove();
		stopWordsRemoval.setTokens(tokens);
	
		try {
			afterStopwords=stopWordsRemoval.getTokens();
			System.out.println(afterStopwords +"After stop word removal");
			Iterator<String> itr=afterStopwords.iterator();
			  while(itr.hasNext())
			   {
				    keyvalue=itr.next();
					System.out.println("Key Value:"+keyvalue);
					if(afterStopwords.contains(keyvalue))
					{
					System.out.println();
					
					}
				}
			  System.out.println();
		    response.sendRedirect("ChooseProduct.jsp?pid="+keyvalue+"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
    /*
 */
	}

}
