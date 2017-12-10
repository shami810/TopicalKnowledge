<%@page import="services.DoctrineService"%>
<%@page import="bean.DoctrineRule"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Case</title>
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
	<p><h5 style= "margin-left:20px;">&nbsp;  Welcome <%= session.getAttribute("username") %>&nbsp;! </h5></p>
	<sidebar></sidebar>
	<section style="margin-left:30%">
	<div id="content" class="col-md-7">
		<div style="padding: 30px;">
	<% 
	if((request.getSession().getAttribute("type")!=null)&&(request.getSession().getAttribute("type").equals("Expert Attorney")||request.getSession().getAttribute("type").equals("Data Admin"))){			
		//request.getSession().removeAttribute("addedDoctrine");
	%>
		<%
			String errorMessage=(String) request.getSession().getAttribute("errorMessage");
			if(errorMessage!=null && !errorMessage.isEmpty()){
				//System.out.println(errorMessage);
		%>
		<h5 style="color:red">No such Doctrine exists.</h5>
		
		<%
			}
			String successMessage=(String) request.getSession().getAttribute("successMessage");
			if(successMessage!=null && !successMessage.isEmpty()){
		%>
		<h5 style="color:blue">Doctrine Added Successfully.</h5>
		<%
			}
		%>
			<h4>Enter Following Information</h4>
			<hr>
			<form class="form-inline" action="/TKBS/html/expertAttorney/addCase.jsp" method="post">
				<div class="form-group col-sm-6">
					<label for="sectionNo" class="col-sm-3">Section</label> <input type="text"
						class="form-control col-sm-9" id="sectionNo" name="sectionNo"
						placeholder="Enter Section No" required>
				</div>
				<div class="form-group  col-sm-6">
					<label for="chapterNo" class="col-sm-3">Chapter</label> <input type="text"
						class="form-control col-sm-9" id="chapterNo" name="chapterNo"
						placeholder="Enter Chapter No" required>
				</div>
				<br/>
				<br/>
				<br/>
				<br/>
			<div class="form-inline" style="margin-left:20px;">
			<div class="col-sm-3">
					<a href="/TKBS/html/search.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Back</a>
			</div>
			<div class="col-sm-3">
					<a href="/TKBS/html/logout.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Home</a>
			</div>
				<div class="col-sm-3">
					<button type="submit" class="btn btn-default" style="background-color:white; border-color:black; color:black;">Submit</button>
				</div>
				<div class="col-sm-3">
					<a href="#" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:grey; cursor:not-allowed"">Next</a>
			</div>
			</div>
			</form>
		<%

		}
		else{
			out.println("<h5 style='color:red'>You do not have access to this page.</h5>");
		}
		%>
	</div>
	</div>
</body>
</html>