<%@page import="services.DoctrineService"%>
<%@page import="bean.DoctrineCases"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case Details</title>
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

	<jsp:include page="../header.jsp" />
	<div id="sidebar" class="col-md-3"></div>
	<div id="content" class="col-md-6">
	
	<%
		String caseId=request.getParameter("caseId");
		String dName=request.getParameter("doctrineName");
		DoctrineCases cases=null;
		if(caseId!=null||!caseId.isEmpty()){
			cases =new DoctrineService().getCaseById(Integer.parseInt(caseId));
		}
		if(cases==null){
	%>
		<h3 class="errorMessage">Unable to fetch Case details</h3>
		<%
		}
		else{
		%>

			<h4><%=cases.getCaseName() %></h4>
			<hr>
			<table>
					<tr>
						<td>Doctrine Name</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><%= (dName==null) ? "Unable to Fetch Name." : dName %></td>
					</tr>
					<tr>
						<td>Case Code</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><%=cases.getCaseCode() %></td>
					</tr>
					<tr>
						<td>Case Year</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><%=cases.getCaseYear() %></td>
					</tr>
				</table>
				<br/>
			<h5>Summary</h5>
			<hr>
			<div id="summary"><%=cases.getCaseSummary()==null ? "No summary added" : cases.getCaseSummary() %></div>
				<br />
					<div class="form-inline">
			<div class="col-sm-3">
					<a href="/TKBS/html/home.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Back</a>
			</div>
			<div class="col-sm-3">
					<a href="/TKBS/html/logout.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:grey;">Home</a>
			</div>
			<div class="col-sm-3">
					<a href="#" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:grey;">Submit</a>
			</div>
			<div class="col-sm-3">
					<a href="#" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:grey; cursor:not-allowed">Next</a>
			</div>
			
			</div>
		</div>
		<br/>
	</div>
		<%} %>
</body>
</html>