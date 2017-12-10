<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>
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
<%
request.getSession().removeAttribute("doctrines");
%>
<jsp:include page="header.jsp" />
<p><h5 style= "margin-left:10px;">&nbsp;  Welcome <%= session.getAttribute("username") %>&nbsp;! </h5></p>
<br/><br/><br/><br/><br/><br/><br/>
	<div class="text-center">
		<form class="form-horizontal" action="/TKBS/Search" method="post">
			<div class="form-group">
				<input type="text" class="col-sm-4 col-sm-6" id="searchText" name="searchText"
					placeholder="Search for Policy" required>
			</div> 
			<br />
			<br/><br/>
			<div class="form-inline text-center" style="margin-left:500px;width:500px">
			<div class="col-sm-3">
					<a href="/TKBS/html/home.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Back</a>
			</div>
			<div class="col-sm-3">
				<a href="/TKBS/html/logout.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:grey;">Home</a>
			</div>
			<div class="col-sm-3">
					<button type="submit" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Search</button>
			</div>
			<div class="col-sm-3">
					<a href="#" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:grey; cursor:not-allowed">Next</a>
			</div>	
			</div>
		</form>
	</div>
</body> 
</html>