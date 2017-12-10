<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Account Report</title>
<script type="text/javascript" src="/TKBS/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/TKBS/js/popper.min.js"></script>
<script type="text/javascript" src="/TKBS/js/bootstrap.js"></script>
<script type="text/javascript" src="/TKBS/js/Main.js"></script>
<link rel="stylesheet" href="/TKBS/css/bootstrap-grid.css">
<link rel="stylesheet" href="/TKBS/css/bootstrap-reboot.css">
<link rel="stylesheet" href="/TKBS/css/bootstrap.css">
<link rel="stylesheet" href="/TKBS/css/Main.css">
<link rel="stylesheet" href="/TKBS/css/style.css">
</head>
<body>
<jsp:include page="header.jsp" />
<p><h6>&nbsp;  Welcome <%= session.getAttribute("username")%>!!!</h6></p>
<br/>
<%
String id = null;
try {
String uname = (String) session.getAttribute("username");
String connectionURL = "jdbc:mysql://localhost:3306/tkbs";
Connection connection = null;
Statement statement = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "");
statement = connection.createStatement();
String QueryString = "SELECT * from user where firstName = '"+uname+"'";
rs = statement.executeQuery(QueryString);
%>
<h5><center><%= session.getAttribute("username") %>'s Account Report</center></h5>
<center><TABLE cellpadding="5" border="1" style = "margin-top: 50px";>
<tr>
                <th>Creation Date and Time</th>
                <th>Status</th>
                <th>User Id</th>
                <th>First Name</th>
                <th>Last Name</th>               
                <th>Email</th>
                <th>Username</th>
                <th>Password</th>
                <th>Security Question</th>
                <th>Security Answer</th>
                               
                <th>Action</th>
</tr>
<%
while (rs.next()) {
%>
                      
<TR>
<TD><%=rs.getString(12)%></TD>
<TD><%=rs.getString(11)%></TD>
<TD><%=rs.getString(1)%></TD>
<%id = rs.getString(1); %>
<TD><%=rs.getString(2)%></TD>
<TD><%=rs.getString(3)%></TD>
<TD><%=rs.getString(4)%></TD>
<TD><%=rs.getString(5)%></TD>
<TD><%=rs.getString(6)%></TD>
<TD><%=rs.getString(8)%></TD>
<TD><%=rs.getString(9)%></TD>
<%String status = rs.getString(11);
	if(status.equals("N")||status.equals("C")) 
	{%>

	<TD><a class="nav-link dropdown-toggle" href="#" id="reportsLink" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Action </a>
				<div class="dropdown-menu" aria-labelledby="reportsLink">
					
					<a class="dropdown-item" href="ChangeInfo.jsp?ID=<%=id %>">Change</a> 
					
				</div></TD><%}
	else
	{%><TD style="color:#d80a0a;cursor:not-allowed"><center>Deleted</center></TD><%} %>
	</TR>
	<% 
} %>

<%
// close all the connections.
rs.close();
statement.close();
connection.close();
} catch (Exception ex) {
%>
<%
out.println("Unable to connect to database.");
}
%>
</TABLE>
</center>
<hr>	
<section style="margin: 0 auto; width: 100%;margin-top: 50px; ">
<div class="form-inline" style="margin-left:680px; " >
				
				<br/><br/>
			<div class="form-inline">
			<div class="col-sm-3">
					<a href="/TKBS/html/home.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Back</a>
			</div>
			<div class="col-sm-3">
				<a href="/TKBS/html/logout.jsp" " class="btn btn-primary" name="temp" style="background-color:white; border-color:black;">Home</a>
			</div>
			<div class="col-sm-3">
					<button type="submit" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Submit</button>
			</div>
			<div class="col-sm-3">
					<a href="/TKBS/html/user/doctrineReport.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black; ">Next</a>
			</div>	
			</div>
				
				
			</div>
			
			</section>
</body>
</html>
