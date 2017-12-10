package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	String secAns= null;
	String secQues= null;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		//doGet(request, response);
		String result = temp(request,response);
		HttpSession session=request.getSession();
		if(result.isEmpty())
		{
			//out.println("Invalid Credentials");
			//request.setAttribute("errorMessage", "Invalid Credentials");
			session.setAttribute("logid", "1");
			response.sendRedirect("/TKBS/html/InvalidePassword.jsp");
		}
		else
		{			
			session.setAttribute("logid", "4");
			response.sendRedirect("/TKBS/html/login.jsp");
		}
	}
	
	private String temp(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		HttpSession session=request.getSession();
		Connection connection;
		PreparedStatement preparedStatement;
		ResultSet rs;
		
		PreparedStatement ps2;
		//ResultSet rs2;
	
		String query="SELECT * FROM `tkbs`.`user` WHERE `user`.`password`=?";
		//String query1="UPDATE `tkbs`.`user` SET `user`.`password` = ? WHERE `user`.`password`=?";
		
		String firstName= null;
		String type = null;
		
		
		String newps = request.getParameter("password");
		session.setAttribute("newpass", newps);
		//String type = null;
		//pen.write("name : "+request.getParameter("name"));
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
			
			String temp = (String)session.getAttribute("temp");
			String userid= null;
			preparedStatement=connection.prepareStatement(query); 
			preparedStatement.setString(1, temp);
			rs=preparedStatement.executeQuery();
				
				if(rs.next())
				{
					userid=rs.getString(1);
					firstName = rs.getString(2);
					session.setAttribute("username", rs.getString(2));
					session.setAttribute("lastname", rs.getString(3));
					session.setAttribute("email", rs.getString(4));
					session.setAttribute("firstname", rs.getString(5));
					session.setAttribute("unique", rs.getString(7));
					//session.setAttribute("email", request.getParameter("email"));
					session.setAttribute("secQues", rs.getString(8));
					session.setAttribute("secAns", rs.getString(9));
					session.setAttribute("type",rs.getString(10));					
				
				}
				
				return firstName;
				
		}
		catch (ClassNotFoundException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
		
	}
}

			
			
		
		
		
	


