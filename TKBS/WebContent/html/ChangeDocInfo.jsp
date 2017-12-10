<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
	<%@ page import="java.io.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Doctrine Information</title>
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
	String docname= null;
	String doctype= null;
	String sec= null;
	String chp = null;
	String sum = null;
	String key = null;
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
	String QueryString = "SELECT * from doctrinerule where doctrineRuleId = '"+id+"'";
	rs = statement.executeQuery(QueryString);
	while(rs.next())
	{
		docname = rs.getString(2);
		doctype = rs.getString(3);
		sec = rs.getString(7);
		chp = rs.getString(6);
		sum = rs.getString(8);
		key = rs.getString(9);
		
	}
	session.setAttribute("docname", docname);
	session.setAttribute("doctype", doctype);
	session.setAttribute("sec", sec);
	session.setAttribute("chp", chp);
	session.setAttribute("sum", sum);
	session.setAttribute("key", key);%>
	
	
	<section style="margin: 0 auto; width: 40%;">
	<form class="form-horizontal" method="post" action = "/TKBS/ChangeDocInfo" id="docSub">
		<legend class="col-sm-12">Change Policy Information</legend>
		<hr>
			
				<div class="col-sm-12">
					<input type="text" class="form-control" id="inputText"
						placeholder="<%=docname%>"  name="docname" value ="<%=docname%>"readonly style="background-color: #e1e1d0; color:#000000; ">
						</div>
						<br/>
					<div class="col-sm-12">
					<input type="text" class="form-control" id="inputText2"
						placeholder="<%=doctype%>"  name="doctype" value ="<%=doctype%>" readonly style="background-color: #e1e1d0; color:#000000; ">
						</div>
			
			<br/>
			
			<div class="form-inline">
				<div class="col-sm-6">
					<input type="text" class="form-control" id="inputText"
						placeholder="<%=sec%>"  name="sec" value ="<%=sec%>"readonly style="background-color: #e1e1d0; color:#000000; ">
						</div>
					<div class="col-sm-6">
							<input type="text" class="form-control" id="inputText2"
						placeholder="<%=chp%>"  name="doctype" value ="<%=chp%>" readonly style="background-color: #e1e1d0; color:#000000; ">
					</div>
			</div>			
			<br/>
			<div class="form-group">
				<div class="col-sm-12">
					<input type="text" class="form-control" id="inputEmail"
						placeholder="Enter new keyword" name="key" value ="<%=key%>" required>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					<input type="username" class="form-control" id="inputUsername"
						placeholder="Enter new summary" name="sum" value="<%=sum%>"required>
				</div>
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
					<button type="submit" class="btn btn-primary" name="sub" style="background-color:white; border-color:black; color:black;">Submit</button>
				</div>
			<div class="col-sm-3">
					<a href="#" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:grey; cursor:not-allowed"">Next</a>
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