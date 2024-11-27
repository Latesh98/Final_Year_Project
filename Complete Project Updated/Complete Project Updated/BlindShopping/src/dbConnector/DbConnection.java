package dbConnector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbConnection {
PreparedStatement pst=null;
ResultSet rs=null;
private static Connection con;
String query=null;
public DbConnection() throws ClassNotFoundException, SQLException {
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingcart","root","");
}

public static Connection getConnection() 
{
	try 
	{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingcart", "root", "");
		return con;
	}
	catch (Exception e) 
	{
		System.out.println("Exception is 1 " + e);

	}

	
	return con;
}




public int inupdelOperation(String param) throws SQLException
{
	query=param;
	pst=con.prepareStatement(query);
	int result=pst.executeUpdate();
	return result;
}

public ResultSet selectOperation(String param) throws SQLException
{
	query=param;
	//System.out.println(query);
	pst=con.prepareStatement(query);
	rs=pst.executeQuery();
	return rs;
}

}
