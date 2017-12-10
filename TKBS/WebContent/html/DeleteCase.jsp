<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
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
	
	String QueryString = "Update controllingcases SET status = 'D' where controllingCasesId = '"+id+"' AND status != 'D'";
	int count1 = statement.executeUpdate(QueryString);
	response.sendRedirect("/TKBS/html/DB_Update.jsp");
	%>
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
