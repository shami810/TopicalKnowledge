package servlets;

import java.io.IOException;
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

/**
 * Servlet implementation class Validation
 */
@WebServlet("/Validation")
public class Validation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Validation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String ans = (String)session.getAttribute("secAns");
		if(ans.equals(request.getParameter("ans")))
		{
			check(request,response);
		}
		else
		{
			session.setAttribute("logid", "1");
			response.sendRedirect("/TKBS/html/InvalidePassword.jsp");
		}
	}
	
	private void check(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		HttpSession session=request.getSession();
		Date d = new Date();
		DateFormat d1 = DateFormat.getInstance();
		String date = d1.format(d);
		Connection connection;
		PreparedStatement preparedStatement;
		ResultSet rs;
		
		PreparedStatement ps2;
		//ResultSet rs2;
	
		String query="INSERT INTO `tkbs`.`user`(`firstName`, `lastName`, `email`, `username`, `password`, `secQues`, `secAns`, `type`, `status`, `uniquepassword`, `dateCreated`, `Active`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
		String query1="UPDATE `tkbs`.`user` SET `user`.`Active` = ? WHERE `user`.`password`=?";
		
		String firstName= (String)session.getAttribute("username");
		String lastName= (String)session.getAttribute("lastname");
		String email= (String)session.getAttribute("email");
		String username=(String)session.getAttribute("firstname");
		String password=(String)session.getAttribute("newpass");
		String type=(String)session.getAttribute("type");
		String unique=(String)session.getAttribute("unique");
		String ques = (String)session.getAttribute("secQues");
		String secans = (String)session.getAttribute("secAns");
		//String type = null;
		//pen.write("name : "+request.getParameter("name"));
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
			//HttpSession session=request.getSession();
			String temp = (String)session.getAttribute("temp");
			String userid= null;
			preparedStatement=connection.prepareStatement(query1); 
			preparedStatement.setString(1, "0");
			preparedStatement.setString(2, temp);				
			if(preparedStatement.executeUpdate()!=0)
				{
					ps2 =connection.prepareStatement(query); 
					ps2.setString(1, firstName);
					ps2.setString(2, lastName);
					ps2.setString(3,email);
					ps2.setString(4, username);
					ps2.setString(5, password);
					ps2.setString(6, ques);
					ps2.setString(7, secans);
					ps2.setString(8, type);
					ps2.setString(9, "C");
					ps2.setString(10, unique);
					ps2.setString(11, date);
					ps2.setString(12, "1");
					int count=ps2.executeUpdate();
					
					session.setAttribute("type", type);
					session.setAttribute("username", firstName);
					response.sendRedirect("/TKBS/html/home.jsp");				
				
				}
								
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
		
		
	}

}
