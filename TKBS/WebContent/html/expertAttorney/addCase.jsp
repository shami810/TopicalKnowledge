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
	<div id="sidebar" class="col-md-3"></div>
	<div id="content" class="col-md-6">
		<h3>Case Entry</h3>
		<br />
		<div >
<%

	String sectionNo=request.getParameter("sectionNo");
	String chapterNo=request.getParameter("chapterNo");
	
	if((sectionNo!=null && !sectionNo.isEmpty()) && (chapterNo!=null && !chapterNo.isEmpty()))
	{
		//System.out.println("in addCase");
		DoctrineRule doctrineRule=new DoctrineService().validateDoctrine(sectionNo, chapterNo);
		if(doctrineRule==null)
		{
			request.getSession().setAttribute("errorMessage", "No such Doctrine Exists");
			response.sendRedirect("/TKBS/html/expertAttorney/validateCase.jsp");	
		}
		else
		{
			request.getSession().setAttribute("doctrineId", doctrineRule.getDoctrineRuleId());
			request.getSession().removeAttribute("errorMessage");
			request.getSession().removeAttribute("successMessage");
		}
	}

%>
			<div class="container">
				<p>Statutory Information</p>
				<hr>
				<form action="/TKBS/AddCase" method="post">
					<div class="form-group row">
						<label for="section" class="col-sm-3 col-form-label">Section</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="section" value="<%= sectionNo %>"
								name="sectionNo" placeholder="Section No." required readonly>
						</div>
					</div>
					<div class="form-group row">
						<label for="chapter" class="col-sm-3 col-form-label">Chapter</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="chapter" value="<%=chapterNo %>"
								name="chapterNo" placeholder="Chapter No." required readonly>
						</div>
					</div>
					<p>Enter Case Information</p>
					<hr>
					<div class="form-group row">
						<label for="caseName" class="col-sm-3 col-form-label">Case
							Name</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="caseName"
								name="caseName" placeholder="Enter Case Name" required>
						</div>
					</div>
					<div class="form-group row">
						<label for="caseCode" class="col-sm-3 col-form-label">Case
							Code</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="caseCode"
								name="caseCode" placeholder="Enter Case Code" required>
						</div>
					</div>
					<div class="form-group row">
						<label for="caseYear" class="col-sm-3 col-form-label">Case
							Year</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="caseYear"
								name="caseYear" placeholder="Enter Case Code" required>
						</div>
					</div>
					<div class="form-group row">
						<label for="caseSummary" class="col-sm-3 col-form-label">Case
							Summary</label>
						<div class="col-sm-12">
								<textarea rows="" cols="" class="form-control text-center" id="caseSummary" name="caseSummary" required>Enter Case Summary</textarea>
						</div>
					</div>
					
				<div class="form-inline" style="margin-left:20px;">
			<div class="col-sm-3">
					<a href="/TKBS/html/expertAttorney/validateCase.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Back</a>
			</div>
			<div class="col-sm-3">
					<a href="/TKBS/html/logout.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Home</a>
			</div>
				<div class="col-sm-3">
					<button type="submit" class="btn btn-default" style="background-color:white; border-color:black; color:black;">Submit</button>
				</div>
				<div class="col-sm-3">
<a href="#" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:grey; cursor:not-allowed">Next</a>			
			</div>
			</div>
				</form>
			</div>
		</div>
	<br /><br/>
		
	</div>
</body>
</html>