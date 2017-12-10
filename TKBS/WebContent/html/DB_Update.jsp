<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DB Update</title>
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
<p><h5 style= "margin-left:20px;">&nbsp;  Welcome <%= session.getAttribute("username") %>&nbsp;! </h5></p>
<br/>
<%
try 
{
String id = null;
String connectionURL = "jdbc:mysql://localhost:3306/tkbs";
Connection connection = null;
Statement statement = null;
Statement s2 = null;
Statement s3 = null;
ResultSet rs = null;
ResultSet rs2 = null;
ResultSet rs3 = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "");

statement = connection.createStatement();
String QueryString = "SELECT * from user";
rs = statement.executeQuery(QueryString);

s2 = connection.createStatement();
String QueryString2 = "SELECT * from doctrinerule";
rs2 = s2.executeQuery(QueryString2);

s3 = connection.createStatement();
String QueryString3 = "SELECT * from controllingcases";
rs3 = s3.executeQuery(QueryString3);

%>
<section>
<br/>
<h5><center>User Table Dump</center></h5>
<br/>
<center><TABLE cellpadding="2" border="1">
<tr>
                <th>Date and Timestamp</th>
                <th>Status</th>
                <th>User Id</th>
                <th>First Name</th>               
                <th>Last Name</th>
                <th>Email</th>
                <th>Username</th>
                <th>Password</th>
                <th>Unique Password</th>
                <th>Security Question</th>
                <th>Answer</th>
                <th>Type</th>
                <th>Action</th>
</tr>
<%
//int i = 0;
int i;
while (rs.next()) 
{
%>
                      
	<TR>
	<TD><%=rs.getString(12)%></TD>
	<TD><%=rs.getString(11)%></TD>
	
	<TD><%=rs.getInt(1)%></TD>
	<%id = rs.getString(1); %>
	<TD><%=rs.getString(2)%></TD>
	<TD><%=rs.getString(3)%></TD>
	<TD><%=rs.getString(4)%></TD>
	<TD><%=rs.getString(5)%></TD>
	<TD><%=rs.getString(6)%></TD>
	<TD><%=rs.getString(7)%></TD>
	<TD><%=rs.getString(8)%></TD>
	<TD><%=rs.getString(9)%></TD>
	<TD><%=rs.getString(10)%></TD>
	<%String status = rs.getString(11);
	if(status.equals("N")||status.equals("C")) 
	{%>

	<TD><a class="nav-link dropdown-toggle" href="#" id="reportsLink" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Action </a>
				<div class="dropdown-menu" aria-labelledby="reportsLink">
					<a class="dropdown-item" href="#">Query</a> 
					<a class="dropdown-item" href="ChangeInfo.jsp?ID=<%=id %>">Change</a> 
					<a class="dropdown-item" href="DeleteUser.jsp?ID=<%=id %>">Delete</a> 
				</div></TD><%}
	else
	{%><TD style="color:#d80a0a;cursor:not-allowed"><center>Deleted</center></TD><%} %>
	</TR>
	<% 
} %>

</TABLE>
</center>
<br/>
<br/>
<h5><center>Policy/ Rule Table Dump</center></h5>
<br/>
<center><TABLE cellpadding="5" border="1">
<tr>
                <th>Date and Timestamp</th>
                <th>Status</th>
                <th>Policy Id</th>
                <th>Policy Name</th>               
                <th>Type</th>
                <th>Section Number</th>
                <th>Chapter Number</th>
                <th>Summary</th>
                <th>Keyword</th>
                <th>Action</th>
</tr>
<%
//int i = 0;
int j;
while (rs2.next()) 
{
%>
                      
	<TR>
	<TD><%=rs2.getString(5)%></TD>
	<TD><%=rs2.getString(10)%></TD>
	
	<TD><%=rs2.getInt(1)%></TD>
	<%id = rs2.getString(1); %>
	<TD><%=rs2.getString(2)%></TD>
	<TD><%=rs2.getString(3)%></TD>
	<TD><%=rs2.getString(7)%></TD>
	<TD><%=rs2.getString(6)%></TD>
	<TD><%=rs2.getString(8)%></TD>
	<TD><%=rs2.getString(9)%></TD>
	<%String status = rs2.getString(10);
	if(status.equals("N")||status.equals("C")) 
	{%>

	<TD><a class="nav-link dropdown-toggle" href="#" id="reportsLink" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Action </a>
				<div class="dropdown-menu" aria-labelledby="reportsLink">
					<a class="dropdown-item" href="#">Query</a> 
					<a class="dropdown-item" href="/TKBS/html/ChangeDocInfo.jsp?ID=<%=id %>">Change</a> 
					<a class="dropdown-item" href="/TKBS/html/DeleteDoc.jsp?ID=<%=id %>">Delete</a> 
				</div></TD><%}
	else
	{%><TD style="color:#d80a0a;cursor:not-allowed"><center>Deleted</center></TD><%} %>
	</TR>
	<% 
} %>
</TABLE>
</center>

<br/>
<br/>
<h5><center>Case Table Dump</center></h5>
<br/>
<center><TABLE cellpadding="5" border="1">
<tr>
                <th>Date and Timestamp</th>
                <th>Status</th>
                <th>Case Id</th>
                <th>Case Name</th>               
                <th>Case Code</th>
                <th>Case Year</th>
                <th>Section Number</th>
                <th>Chapter Number</th>
                <th>Case Summary</th>
                <th>Action</th>
</tr>
<%
//int i = 0;
int k;
while (rs3.next()) 
{
%>
                      
	<TR>
	<TD><%=rs3.getString(10)%></TD>
	<TD><%=rs3.getString(11)%></TD>
	
	<TD><%=rs3.getInt(1)%></TD>
	<%id = rs3.getString(1); %>
	<TD><%=rs3.getString(3)%></TD>
	<TD><%=rs3.getString(4)%></TD>
	<TD><%=rs3.getString(5)%></TD>
	<TD><%=rs3.getString(6)%></TD>
	<TD><%=rs3.getString(7)%></TD>
	<TD><%=rs3.getString(8)%></TD>
	<%String status = rs3.getString(11);
	if(status.equals("N")||status.equals("C")) 
	{%>

	<TD><a class="nav-link dropdown-toggle" href="#" id="reportsLink" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Action </a>
				<div class="dropdown-menu" aria-labelledby="reportsLink">
					<a class="dropdown-item" href="#">Query</a> 
					<a class="dropdown-item" href="/TKBS/html/ChangeDocInfo.jsp?ID=<%=id %>">Change</a> 
					<a class="dropdown-item" href="/TKBS/html/DeleteDoc.jsp?ID=<%=id %>">Delete</a> 
				</div></TD><%}
	else
	{%><TD style="color:#d80a0a;cursor:not-allowed"><center>Deleted</center></TD><%} %>
	</TR>
	<% 
} %>
</TABLE>




<%
// close all the connections.
rs.close();
statement.close();
connection.close();

rs2.close();
s2.close();
connection.close();

rs3.close();
s3.close();
connection.close();
} 
catch (Exception ex) 
{
%>
<%
out.println("Unable to connect to database.");
}
%>
</center>
</section>
<hr>	
<section style="margin: 0 auto; width: 100%;margin-top: 50px; ">
<div class="form-inline" style="margin-left:580px; " >
				
				<form action ="./MyAccount_Report.jsp" > 
				<div class="col-sm-3">
					<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary" name="" style="background-color:white; border-color:black; color:black;" >Back</button>
				</div>
				</div>
				
				</form>
				
				<form action = "/TKBS/html/logout.jsp"> 
				<div class="col-sm-3">
					<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary" name="signUp" style="background-color:white; border-color:black; color:black;">Home</button>
				</div>
				</div>
				</form>
				
				<form action = "#">
				<div class="col-sm-3">
					<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary" name="signUp" style="background-color:white; border-color:black; color:black;">Submit</button>
				</div>
				</div>
				</form>
				
				<form action = "./DoctrineReport.jsp">
				<div class="col-sm-3">
					<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary" name="signUp" style="background-color:white; border-color:black; color:black;" >Next</button>
				</div>
				</div>
				</form>
				
				
			</div>			
			</section>
</body>
</html>