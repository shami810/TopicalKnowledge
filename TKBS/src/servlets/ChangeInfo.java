package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
 * Servlet implementation class ChangeInfo
 */
@WebServlet("/ChangeInfo")
public class ChangeInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		
		Date d = new Date();
		DateFormat d1 = DateFormat.getInstance();
		String date = d1.format(d);
		Connection connection;
		PreparedStatement preparedStatement;
		PreparedStatement ps2;
		
		String unique = (String)session.getAttribute("uniquepassword");
		String type = (String)session.getAttribute("type");
		String secQues = (String)session.getAttribute("secQues");
		String ans = (String)session.getAttribute("ans");
		String fname = (String)session.getAttribute("fname");
		
		String query="INSERT INTO `tkbs`.`user`(`firstName`, `lastName`, `email`, `username`, `password`, `secQues`, `secAns`, `type`, `status`, `uniquepassword`, `dateCreated`, `Active`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
		String query2 = "UPDATE `tkbs`.`user` SET `user`.`Active` = '0' WHERE `user`.`firstName`=? AND `user`.`Active`='1'";
		//pen.write("name : "+request.getParameter("name"));
		//String unique = request.getParameter("uniquePassword");
		//if(unique.equals("Admin_1234"))
		//{
			try 
			{
				
					Class.forName("com.mysql.jdbc.Driver");
					connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
					
					ps2=connection.prepareStatement(query2); 
					ps2.setString(1, fname);
						
					
					if(ps2.executeUpdate()!=0)
					{
						preparedStatement=connection.prepareStatement(query); 
						preparedStatement.setString(1, request.getParameter("firstName"));
						preparedStatement.setString(2, request.getParameter("lastName"));
						preparedStatement.setString(3, request.getParameter("email"));
						preparedStatement.setString(4, request.getParameter("username"));
						preparedStatement.setString(5, request.getParameter("password"));
						preparedStatement.setString(6, secQues);
						preparedStatement.setString(7, ans);
						preparedStatement.setString(8, type);
						preparedStatement.setString(9, "C");
						preparedStatement.setString(10, unique);
						preparedStatement.setString(11, date);
						preparedStatement.setString(12, "1");
						int count=preparedStatement.executeUpdate();
						response.sendRedirect("/TKBS/html/DB_Update.jsp");
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
