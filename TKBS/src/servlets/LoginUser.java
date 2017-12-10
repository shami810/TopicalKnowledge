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
import java.util.Random;

import services.Mail;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class LoginUser
 */
@WebServlet("/LoginUser")
public class LoginUser extends HttpServlet 
{
	String rnd_pass = null;
	
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginUser() {
        super();
        // TODO Auto-generated constructor stub
    }
    private String host;
    private String port;
    private String user;
    private String pass;
    

    public void init() 
    {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
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
		
		//doGet(request, response);
		PrintWriter out=response.getWriter();
		
		if(request.getParameter("frgt")!=null)
		{
			String result=valide(request,response);
			if(result.isEmpty())
			{
				
				//out.println("Invalid Credentials");
				//request.setAttribute("errorMessage", "Invalid Credentials");
				HttpSession session=request.getSession();
				session.setAttribute("logid","1");
				response.sendRedirect("/TKBS/html/InvalidePassword.jsp");
			}
			else
			{
				HttpSession session=request.getSession();
				//session.setAttribute("userid", result);
				String resultMessage = "";
				String name = request.getParameter("username");
				int len=8;
		        String Capital_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		        String Small_chars = "abcdefghijklmnopqrstuvwxyz";
		        String numbers = "0123456789";
		        
		        
				
				String values = Capital_chars + Small_chars +
		                        numbers;
		 
		        // Using random method
		        Random rndm_method = new Random();
		 
		        char[] password = new char[len];
		 
		        for (int i = 0; i < len; i++)
		        {
		            // Use of charAt() method : to get character value
		            // Use of nextInt() as it is scanning the value as int
		            password[i] =values.charAt(rndm_method.nextInt(values.length()));
		 
		        }	        
		        rnd_pass = new String(password);
		        String p = rnd_pass;
		        session.setAttribute("temp", p);
		       
				try 
				{
	        	
					Mail.sendEmail(host, port, user, pass, result, "Reset",
	                    "Hello..!!! Your Temporary Password is: "+p);
					resultMessage = "The e-mail was sent successfully";
				} 
				catch (Exception ex) 
				{
					ex.printStackTrace();
					resultMessage = "There were an error: " + ex.getMessage();
				} 
				finally 
				{
					request.setAttribute("Message", resultMessage);
					session.setAttribute("name", name);
					session.setAttribute("logid", "2");
					update(result,request,response);
					
				}
			}
		}
		
		
		else
		{
			String result=loginUser(request,response);
			if(result.isEmpty())
			{
				//out.println("Invalid Credentials");
				//request.setAttribute("errorMessage", "Invalid Credentials");
				response.sendRedirect("/TKBS/html/InvalidePassword.jsp");
			}
			else
			{
				HttpSession session=request.getSession();
				session.setAttribute("username", result);
				session.setAttribute("email", request.getParameter("email"));
			
				response.sendRedirect("/TKBS/html/home.jsp");
			}
		}
	}
	
	private String loginUser(HttpServletRequest request, HttpServletResponse response)
	{
	
		Connection connection;
		//PreparedStatement preparedStatement;		
		PreparedStatement ps2;
		HttpSession session=request.getSession();
		ResultSet rs2;		
		String query1="SELECT `user`.`firstName`, `user`.`type` FROM `tkbs`.`user` WHERE `user`.`username`=? AND `user`.`password`=? AND `user`.`type`!='Data Admin' AND `user`.`Active`='1'";
		//String type = null;
		//pen.write("name : "+request.getParameter("name"));

		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
			ps2=connection.prepareStatement(query1);
			ps2.setString(1, request.getParameter("username"));
			ps2.setString(2, request.getParameter("org_password"));
			rs2=ps2.executeQuery();
			if(rs2.next())
			{
				session.setAttribute("type", rs2.getString("type"));
				return rs2.getString("firstName");
											
			}
			else
				return "";
				
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
	
	private String valide(HttpServletRequest request, HttpServletResponse response)
	{
		
		Connection connection;
		PreparedStatement preparedStatement;		
		ResultSet rs;
		//String result = null;
		String query="SELECT `user`.`email` FROM `tkbs`.`user` WHERE `user`.`username`=? AND `user`.`Active`!='0'";
		//pen.write("name : "+request.getParameter("name"));
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
			preparedStatement=connection.prepareStatement(query); 
			preparedStatement.setString(1, request.getParameter("username"));
			//preparedStatement.setString(2, request.getParameter("email"));
			rs=preparedStatement.executeQuery();
			if(rs.next())
			{
				return rs.getString("email");				
			}
			else
				return "";
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
	
	private void update(String result, HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String username = request.getParameter("username"); 
		String email = result;
		
		String fname = null;
		String lname = null;
		
		String uname = null;
		String pswd = rnd_pass;
		String unique = null;
		String ques = null;
		String ans = null;
		String type = null;
		//String status = "C";
		
		Date d = new Date();
		DateFormat d1 = DateFormat.getInstance();
		String date = d1.format(d);
		
		Connection connection;
		PreparedStatement preparedStatement;
		PreparedStatement ps2;
		PreparedStatement ps3;
		ResultSet rs;
		//ResultSet rs2;
 
		String query = "SELECT * FROM `tkbs`.`user` WHERE `user`.`username`= ? AND `user`.`email`=? AND `user`.`Active`!='0'";
		String query2 = "UPDATE `tkbs`.`user` SET `user`.`Active` = '0' WHERE `user`.`username`=? AND `user`.`Active`='1'";
		String query3 = "INSERT INTO `tkbs`.`user`(`firstName`, `lastName`, `email`, `username`, `password`, `secQues`, `secAns`, `type`, `status`, `uniquepassword`, `dateCreated`, `Active`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");	
			preparedStatement=connection.prepareStatement(query); 
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, email);
			
			rs = preparedStatement.executeQuery();
			while(rs.next())
			{
				fname = rs.getString(2);
				lname = rs.getString(3);
				email = rs.getString(4);
				uname = rs.getString(5);
				//pswd = rs.getString(6);
				unique = rs.getString(7);
				ques = rs.getString(8);
				ans =  rs.getString(9);
				type =  rs.getString(10);
			}	
			ps2=connection.prepareStatement(query2); 
			ps2.setString(1, uname);			
			if(ps2.executeUpdate()!=0)
			{
					ps3=connection.prepareStatement(query3); 
					ps3.setString(1, fname);
					ps3.setString(2, lname);
					ps3.setString(3, email);
					ps3.setString(4, uname);
					ps3.setString(5, pswd);
					ps3.setString(6, ques);
					ps3.setString(7, ans);
					ps3.setString(8, type);
					ps3.setString(9, "C");
					ps3.setString(10, unique);
					ps3.setString(11, date);
					ps3.setString(12, "1");
					
					int count = ps3.executeUpdate();
					response.sendRedirect("/TKBS/html/login.jsp");
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
