<%@page import="bean.DoctrineRule"%>
<%@page import="services.DoctrineService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Doctrine</title>
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
	<div id="sidebar" class="col-md-3"></div>
	<div id="content" class="col-md-6">
		<h3>Doctrine Entry</h3>
		<div>
	<%
	
String sectionNo=request.getParameter("sectionNo");
String chapterNo=request.getParameter("chapterNo");
//System.out.println(sectionNo+" "+chapterNo);

%>
		<% 
			DoctrineRule addedDoctrine=(DoctrineRule) request.getSession().getAttribute("addedDoctrine");
			//System.out.println(addedDoctrine);
			if(addedDoctrine!=null){
					sectionNo=(String) request.getSession().getAttribute("sectionNo");
					chapterNo=(String) request.getSession().getAttribute("chapterNo");
		%>
		<h4 style="color: blue">Doctrine added/updated Successfully</h4>
		<%
			}
		%>
			<p><b>Statutory Information</b></p>
			<hr>
			<div class="container">
				<form name="addDoctrine" action="/TKBS/AddDoctrine" method="post">
					<div class="form-group row">
						<label for="section" class="col-sm-2 col-form-label">Section</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="section" name="sectionNo"
								value="<%=sectionNo %>" placeholder="Section No." required
								readonly>
						</div>
					</div>
					<div class="form-group row">
						<label for="chapter" class="col-sm-2 col-form-label">Chapter</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="chapter" name="chapterNo"
								value="<%=chapterNo %>" placeholder="Chapter No." required
								readonly>
						</div>
					</div>
					<p><b>Doctrine/Rules Information</b></p>
					<hr>
					<%

DoctrineRule doctrineRule= new DoctrineService().validateDoctrine(sectionNo, chapterNo);
if(doctrineRule!=null && doctrineRule.getDoctrineName()!=null){
	
	//System.out.println("in doctrine");

    %>
					<div class="form-group row">
						<label for="name" class="col-sm-2 col-form-label">Name</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="name" value="<%=doctrineRule.getDoctrineName() %>" name="name"
								placeholder="Enter Doctrine Name" required readonly>
						</div>
					</div>
					<div class="form-group row">
						<label for="type" class="col-sm-2 col-form-label">Type</label>
						<div class="col-sm-10">
							<select id="type" class="form-control" name="type" required  disabled>
								<option>Choose..</option>
								<%
								if(doctrineRule.getDoctrineType().equalsIgnoreCase("Doctrine")){
								%>
								<option value="Doctrine" selected>Doctrine</option>
								<option value="Rule">Rule</option>
								<%
								}
								else{
								%>
								
								<option value="Doctrine">Doctrine</option>
								<option value="Rule" selected>Rule</option>
								<%
								}
								%>
							</select>

						</div>
					</div>
					<div class="form-group row">
						<label for="keyword" class="col-sm-2 col-form-label">Keyword</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="keyword" value="<%= doctrineRule.getKeywords() %>" name="keyword"
								placeholder="Extra Keyword">
						</div>
					</div>
					<div class="form-group row">
						<label for="summary" class="col-sm-2 col-form-label">Summary</label>
						<div class="col-sm-10">
							<textarea name="summary" class="form-control"
								placeholder="Enter Doctrine Summary" id="summary" name="summary" required ><%=doctrineRule.getDoctrineSummary() %></textarea>
						</div>
					</div>
					<div class="col-md-12 text-center">
						<button type="submit" class="btn btn-primary">Save</button>
					</div>
<%
}
else{

%><div class="form-group row">
						<label for="name" class="col-sm-2 col-form-label">Name</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="name" name="name"
								placeholder="Enter Doctrine Name" required>
						</div>
					</div>
					<div class="form-group row">
						<label for="type" class="col-sm-2 col-form-label">Type</label>
						<div class="col-sm-10">
							<select id="type" class="form-control" name="type" required>
								<option selected>Choose..</option>
								<option value="Doctrine">Doctrine</option>
								<option value="Rule">Rule</option>
								
							</select>

						</div>
					</div>
					<div class="form-group row">
						<label for="keyword" class="col-sm-2 col-form-label">Keyword</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="keyword" name="keyword" required
								placeholder="Extra Keyword">
						</div>
					</div>
					<div class="form-group row">
						<label for="summary" class="col-sm-2 col-form-label">Summary</label>
						<div class="col-sm-10">
							<textarea name="summary" class="form-control"
								placeholder="Enter Doctrine Summary" id="summary" name="summary" required></textarea>
						</div>
					</div>
					
					<div class="form-inline" style="margin-left:40px;">
			<div class="col-sm-3">
					<a href="/TKBS/html/home.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Back</a>
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

<%
}
%>
				</form>
			</div>
		</div>
	
	</div>

	<br/>
	<br/>
</body>
</html>