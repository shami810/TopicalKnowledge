<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
	<%@ page import="java.io.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Information</title>
<script type="text/javascript" src="/TKBS/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/TKBS/js/popper.min.js"></script>
<script type="text/javascript" src="/TKBS/js/bootstrap.js"></script>
<script type="text/javascript" src="/TKBS/js/Main.js"></script>
<link rel="stylesheet" href="/TKBS/css/bootstrap-grid.css">
<link rel="stylesheet" href="/TKBS/css/bootstrap-reboot.css">
<link rel="stylesheet" href="/TKBS/css/bootstrap.css">
<link rel="stylesheet" href="/TKBS/css/Main.css">
</head>
<body>
<jsp:include page="header.jsp" />
<p><h5 style= "margin-left:20px;">&nbsp;  Welcome <%= session.getAttribute("username") %>&nbsp;! </h5></p>
<br/>
<%String id = (String)request.getParameter("ID");
try 
{
	String fname= null;
	String lname= null;
	String email= null;
	String username = null;
	String password = null;
	String uniquepassword = null;
	String type = null;
	String secQues = null;
	String ans = null;
	
	String connectionURL = "jdbc:mysql://localhost:3306/tkbs";
	Connection connection = null;
	Statement statement = null;
	Statement s2 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	connection = DriverManager.getConnection(connectionURL, "root", "");
	statement = connection.createStatement();
	String QueryString = "SELECT * from user where userid = '"+id+"'";
	rs = statement.executeQuery(QueryString);
	while(rs.next())
	{
		fname = rs.getString(2);
		lname = rs.getString(3);
		email = rs.getString(4);
		username = rs.getString(5);
		password = rs.getString(6);
		uniquepassword = rs.getString(7);
		secQues = rs.getString(8);
		ans = rs.getString(9);
		type = rs.getString(10);

	}
	session.setAttribute("fname", fname);
	session.setAttribute("lname", lname);
	session.setAttribute("email", email);
	session.setAttribute("username", username);
	session.setAttribute("password", password);
	session.setAttribute("uniquepassword", uniquepassword);
	session.setAttribute("type", type);
	session.setAttribute("secQues", secQues);
	session.setAttribute("ans", ans);%>
	
	
	<section style="margin: 0 auto; width: 40%;">
		<form class="form-horizontal" method="post" action = "/TKBS/ChangeInfo"id="signup">
		<legend class="col-sm-6">Change Information</legend>
		<hr>
			<div class="form-inline">
			<div class="col-sm-6">
					<input type="text" class="form-control" id="inputText"
						placeholder="<%=fname%>"  name="firstName" value ="<%=fname%>"readonly style="background-color: #e1e1d0; color:#000000; ">
						</div>
						<div class="col-sm-6">
					<input type="text" class="form-control" id="inputText2"
						placeholder="Enter last Name"  name="lastName" value ="<%=lname%>" pattern="[a-zA-Z ]+[a-zA-Z0-9]+" required>
						</div>
			</div>
			<br/>
			
			
			
			<div class="form-group">
				<div class="col-sm-12">
					<input type="email" class="form-control" id="inputEmail"
						placeholder="Enter email" name="email" value ="<%=email%>" required>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					<input type="username" class="form-control" id="inputUsername"
						placeholder="<%=username%> %>" name="username" value="<%=username%>"readonly style="background-color: #e1e1d0; color:#000000; ">
				</div>
			</div>
			<div class="form-inline">
				<div class="col-sm-6">
					<input type="password" class="form-control" id="inputPassword"
						placeholder="Enter Password*" name="password" value="<%=password%>" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required>
				</div>
				<div class="col-sm-6">
					<p style="font-size:12px">*Password should include atleast 1 uppercase,lowercase and special character</p>
				</div>
			</div>
			<br/>
			<div class="form-inline">
				<div class="col-sm-6">
					<input type="password" class="form-control" id="inputPassword1"
						placeholder="Confirm Password*" name="confirmPassword" required>
				</div>
			</div>
				<div id="passwordError" style="display : none "required>Password doesn't Match.
				</div>
			<br>
			
			<div class="form-inline">
			<div class="col-sm-3">
					<a href="/TKBS/html/home.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Back</a>
			</div>
			<div class="col-sm-3">
				<a href="/TKBS/html/logout.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Home</a>
			</div>
				<div class="col-sm-3">
					<button type="submit" class="btn btn-primary" name="signUp" style="background-color:white; border-color:black; color:black;">Submit</button>
				</div>
			<div class="col-sm-3">
<a href="#" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:grey; cursor:not-allowed">Next</a>			
		</div>
		
			
			</div>
		</form>
	</section>
<%statement.close();
rs2.close();
s2.close();
connection.close();
} catch (Exception ex) {
%>
<%
//out.println("Unable to connect to database.");
}
%>
	



	
</body>
</html>