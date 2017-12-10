package services;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpServletRequest;

import bean.User;

public class UserService 
{

	Connection connection;
	PreparedStatement preparedStatement;
	ResultSet resultSet;

	public boolean checkIfUserAlreadyExists(String email){

		String query="SELECT `user`.`firstName` FROM `tkbs`.`user` WHERE `user`.`email`=?";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
			preparedStatement=connection.prepareStatement(query); 
			preparedStatement.setString(1, email);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next())
				return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return false;
	}

	/*public void insertUser(HttpServletRequest request)
	{
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
			//response.sendRedirect("/TKBS/html/home.jsp");

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		
	}*/

	/*public User loginUser(HttpServletRequest request)
	{
		String query="SELECT `users`.`name`, `users`.`type`, `users`.`email`, `users`.`userid` FROM `tkbs`.`users` WHERE `users`.`email`=? AND `users`.`password`=?";
		//pen.write("name : "+request.getParameter("name"));
		User user=null;
		try {
			user =new User();
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","root123");
			preparedStatement=connection.prepareStatement(query); 
			preparedStatement.setString(1, request.getParameter("email"));
			preparedStatement.setString(2, request.getParameter("password"));
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()){
				user.setEmail(resultSet.getString("email"));
				user.setName(resultSet.getString("name"));
				user.setUserId(resultSet.getInt("userid"));
				user.setType(resultSet.getString("type"));
				System.out.println(resultSet.getString("email"));
				return user;				
			} 
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}*/
	
	public List<User> getExpertAttorneyReport(){
		List<User> list=null;
		String query="SELECT `users`.`name`,`users`.`email` FROM `tkbs`.`users` WHERE `users`.`type`=?";
		try {
			list=new ArrayList<User>();
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
			preparedStatement=connection.prepareStatement(query); 
			preparedStatement.setString(1, "Expert Attorney");
			resultSet = preparedStatement.executeQuery();
			User user=null;
			while(resultSet.next()){
				user=new User();
				user.setfname(resultSet.getString("firstName"));
				user.setlname(resultSet.getString("lastName"));
				user.setEmail(resultSet.getString("email"));
				list.add(user);
			}
				
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return list;
	}
	
	public String updatePassword(String email, String password,String newPassword){
		String checkPassword="SELECT `users`.`email` FROM `tkbs`.`users` WHERE `users`.`email`=? AND `users`.`password`=?";
		String updatequery="UPDATE `tkbs`.`users` SET `password` =? WHERE `email` =?";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
			preparedStatement=connection.prepareStatement(checkPassword); 
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()){
				connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
				preparedStatement=connection.prepareStatement(updatequery); 
				preparedStatement.setString(1, newPassword);
				preparedStatement.setString(2, email);
				int count=preparedStatement.executeUpdate();
				System.out.println(count);
				if(count>0){
					return "Password Updated Successfully.";
				}
				else{
					return "Password Updated Successfully.";
				}
			}
			return "Incorrect Old Password";
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public String updateName(String name, String email){

		String query="UPDATE `tkbs`.`users` SET `name` =? WHERE `email` =?;";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
			preparedStatement=connection.prepareStatement(query); 
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, email);
			int count=preparedStatement.executeUpdate();
			if(count>0){
				return "Name Updated Successfully";
			}
			else{
				return "Unable to update.";
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return "";
	}
	


	public boolean insertAdmin(HttpServletRequest request)
	{
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				Date d = new Date();
				DateFormat d1 = DateFormat.getInstance();
				String date = d1.format(d);
				Connection connection;
				PreparedStatement preparedStatement;
				String query="INSERT INTO `tkbs`.`user`(`firstName`, `lastName`, `email`, `username`, `password`, `secQues`, `secAns`, `type`, `status`, `uniquepassword`, `dateCreated`, `Active`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
				//pen.write("name : "+request.getParameter("name"));
				String unique = request.getParameter("uniquePassword");
				HttpSession session=request.getSession();
				//if(unique.equals("Admin_1234"))
				//{
					try 
					{
						if(unique.equals("Admin_1234"))
						{
							Class.forName("com.mysql.jdbc.Driver");
							connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
							preparedStatement=connection.prepareStatement(query); 
							preparedStatement.setString(1, request.getParameter("fname"));
							preparedStatement.setString(2, request.getParameter("lname"));
							preparedStatement.setString(3, request.getParameter("email"));
							preparedStatement.setString(4, request.getParameter("username"));
							preparedStatement.setString(5, request.getParameter("password"));
							preparedStatement.setString(6, request.getParameter("question"));
							preparedStatement.setString(7, request.getParameter("answer"));
							preparedStatement.setString(8, "Data Admin");
							preparedStatement.setString(9, "N");
							preparedStatement.setString(10, "Admin_1234");
							preparedStatement.setString(11, date);
							preparedStatement.setString(12, "1");
							int count=preparedStatement.executeUpdate();
							session.setAttribute("username", request.getParameter("firstName"));
							session.setAttribute("type", "Data Admin");
							session.setAttribute("email", request.getParameter("email"));
							return true;
						}
						else
						{
							return false;
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
		return false;
	}
}
