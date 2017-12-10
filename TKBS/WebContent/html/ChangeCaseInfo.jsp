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
	String cname= null;
	String year= null;
	String code = null;
	String casesec= null;
	String casechp= null;
	String casesum= null;
	String count = null;
	
	String connectionURL = "jdbc:mysql://localhost:3306/tkbs";
	Connection connection = null;
	Statement statement = null;
	ResultSet rs = null;
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	connection = DriverManager.getConnection(connectionURL, "root", "");
	statement = connection.createStatement();
	
	String QueryString = "SELECT * from controllingcases where controllingCasesId = '"+id+"'";
	rs = statement.executeQuery(QueryString);
	while(rs.next())
	{
		cname= rs.getString(3);
		year= rs.getString(5);
		code = rs.getString(4);
		casesec= rs.getString(6);
		casechp= rs.getString(7);
		casesum= rs.getString(8);
		count = rs.getString(9);
	}
	
	session.setAttribute("cname", cname);
	session.setAttribute("year", year);
	session.setAttribute("code", code);
	session.setAttribute("casesec", casesec);
	session.setAttribute("casechp", casechp);
	session.setAttribute("casesum", casesum);
	session.setAttribute("count", count);%>
	
	<section style="margin: 0 auto; width: 40%;">
		<form class="form-horizontal" method="post" action = "/TKBS/ChangeCaseInfo"id="signup">
		<legend class="col-sm-6">Change Information</legend>
		<hr>
		<div class="form-group">
				<div class="col-sm-12">
					<input type="text" class="form-control" id="casename"
						placeholder="<%=cname%>" name="cname" value ="<%=cname%>" readonly style="background-color: #e1e1d0; color:#000000; ">
				</div>
		</div>
		<br/>
		<div class="form-inline">
			<div class="col-sm-6">
				<input type="text" class="form-control" id="inputText"
						placeholder="<%=year%>"  name="caseyear" value ="<%=year%>"readonly style="background-color: #e1e1d0; color:#000000; ">
			</div>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="inputText2"
						placeholder="<%=code %>"  name="lastName" value ="<%=code%>"readonly style="background-color: #e1e1d0; color:#000000; ">
			</div>
		</div>
		<br/>
		<div class="form-inline">
			<div class="col-sm-6">
				<input type="text" class="form-control" id="inputText"
						placeholder="<%=casesec%>"  name="casesec" value ="<%=casesec%>"readonly style="background-color: #e1e1d0; color:#000000; ">
			</div>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="inputText2"
						placeholder="<%=casechp%>"  name="casechp" value ="<%=casechp%>"readonly style="background-color: #e1e1d0; color:#000000; ">
			</div>
		</div>
		<br/>
		<div class="form-group">
				<div class="col-sm-12">
					<input type="text" class="form-control" id="casename"
						placeholder="<%=casesum%>" name="casesum" value ="<%=casesum%>" required>
				</div>
		</div>
		<br/>
		<br/>
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
					<a href="#" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:grey; cursor:not-allowed"">Next</a>
			</div>
		</div>
		</form>
	</section>
<%statement.close();
rs.close();
connection.close();
} catch (Exception ex) {
%>
<%
//out.println("Unable to connect to database.");
}
%>
</body>
</html>