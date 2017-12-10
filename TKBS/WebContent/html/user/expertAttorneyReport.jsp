<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Expert Attorney Report</title>
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
 
<jsp:include page="/html/header.jsp" />
<p><h5 style= "margin-left:20px;">&nbsp;  Welcome <%= session.getAttribute("username") %>&nbsp;! </h5></p>
<br/>
 <%
try {
String connectionURL = "jdbc:mysql://localhost:3306/tkbs";
Connection connection = null;
Statement statement = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "");
statement = connection.createStatement();
String QueryString = "SELECT * from user where type = 'Expert Attorney' AND status !='D'";
rs = statement.executeQuery(QueryString);
%>
<h5><center>Expert Attorney Report</center></h5>
<br/>
<br/>
<center><TABLE cellpadding="10" border="1" style = "margin-top: 10px">
<tr>
 				<th>Registration Date and Time</th>
				<th>Status</th>
                <th>First name</th>
                <th>Last name</th>
                <th>Email</th>
               
</tr>
<%
while (rs.next()) {
%>
                      
<TR>
<TD><%=rs.getString(12)%></TD>
<TD><%=rs.getString(11)%></TD>
<TD><%=rs.getString(2)%></TD>
<TD><%=rs.getString(3)%></TD>
<TD><%=rs.getString(4)%></TD>



</TR>
<% } %>
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
<br/><hr>	
<section style="margin: 0 auto; width: 100%;margin-top: 50px; ">
<div class="form-inline" style="margin-left:480px; " >
				
				<form> 
				<br/>
			<div class="form-inline">
			<div class="col-sm-3">
					<a href="/TKBS/html/home.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Back</a>
			</div>
			<div class="col-sm-3">
				<a href="/TKBS/html/logout.jsp" " class="btn btn-primary" name="temp" style="background-color:white; border-color:black;">Home</a>
			</div>
			<div class="col-sm-3">
					<button type="submit" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:grey;">Submit</button>
			</div>
			<div class="col-sm-3">
					<a href="/TKBS/html/user/Student_Report.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black; ">Next</a>
			</div>	
			</div>
				</form>
				
				
				
			</div>
			
			</section>

</body>
</html>