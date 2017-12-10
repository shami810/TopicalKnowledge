package servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class RegisterUser
 */
@WebServlet("/RegisterUser")
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUser() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
					
			Date d = new Date();
			DateFormat d1 = DateFormat.getInstance();
			String date = d1.format(d);
			Connection connection;
			PreparedStatement preparedStatement;

			HttpSession session=request.getSession();
			String query="INSERT INTO `tkbs`.`user`(`firstName`, `lastName`, `email`, `username`, `password`, `secQues`, `secAns`, `type`, `status`,`dateCreated`, `Active`) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
			//pen.write("name : "+request.getParameter("name"));

			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
				preparedStatement=connection.prepareStatement(query); 
				preparedStatement.setString(1, request.getParameter("firstName"));
				preparedStatement.setString(2, request.getParameter("lastName"));
				preparedStatement.setString(3, request.getParameter("email"));
				preparedStatement.setString(4, request.getParameter("username"));
				preparedStatement.setString(5, request.getParameter("password"));
				preparedStatement.setString(6, request.getParameter("question"));
				preparedStatement.setString(7, request.getParameter("answer"));
				preparedStatement.setString(8, request.getParameter("type"));
				preparedStatement.setString(9, "N");
				preparedStatement.setString(10, date);
				preparedStatement.setString(11, "1");
				//preparedStatement.setString(10, "NULL");
				
				session.setAttribute("username", request.getParameter("firstName"));
				session.setAttribute("type", request.getParameter("type"));
				session.setAttribute("email", request.getParameter("email"));			
				int count=preparedStatement.executeUpdate();
				
				response.sendRedirect("/TKBS/html/home.jsp");
				return;

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		

}
