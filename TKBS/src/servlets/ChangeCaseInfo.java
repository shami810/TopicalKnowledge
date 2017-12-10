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
 * Servlet implementation class ChangeCaseInfo
 */
@WebServlet("/ChangeCaseInfo")
public class ChangeCaseInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeCaseInfo() {
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
		//doGet(request, response);
		
		HttpSession session=request.getSession();
		
		Date d = new Date();
		DateFormat d1 = DateFormat.getInstance();
		String date = d1.format(d);
		Connection connection;
		PreparedStatement preparedStatement;
		PreparedStatement ps2;
		
		String cname= (String)session.getAttribute("cname");
		String year= (String)session.getAttribute("year");
		String code = (String)session.getAttribute("code");
		String casesec= (String)session.getAttribute("casesec");
		String casechp= (String)session.getAttribute("casechp");
		String count = (String)session.getAttribute("count");
		
		String query="INSERT INTO `tkbs`.`controllingcases`(`caseName`, `caseCode`, `caseYear`, `sectionNo`, `chapterNo`, `caseSummary`, `count`, `dateCreated`,`status`, `Active`) VALUES (?,?,?,?,?,?,?,?,?,?)";
		String query2 = "UPDATE `tkbs`.`controllingcases` SET `controllingcases`.`Active` = '0' WHERE `controllingcases`.`sectionNo`=? AND `controllingcases`.`chapterNo`=?  AND `controllingcases`.`caseName`=? AND `controllingcases`.`Active`='1'";
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
			
			ps2=connection.prepareStatement(query2); 
			ps2.setString(1,casesec);
			ps2.setString(2,casechp);
			ps2.setString(3,cname);
			
			if(ps2.executeUpdate()!=0)
			{
				preparedStatement=connection.prepareStatement(query); 
				preparedStatement.setString(1, cname);
				preparedStatement.setString(2, code);
				preparedStatement.setString(3, year);
				preparedStatement.setString(4, casesec);
				preparedStatement.setString(5, casechp);
				preparedStatement.setString(6, request.getParameter("casesum"));
				preparedStatement.setString(7, count);
				preparedStatement.setString(8, date);
				preparedStatement.setString(9, "C");
				preparedStatement.setString(10, "1");
				int count1=preparedStatement.executeUpdate();						
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
