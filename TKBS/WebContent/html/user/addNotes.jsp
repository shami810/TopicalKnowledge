<%@page import="services.DoctrineService"%>
<%@page import="bean.DoctrineNotes"%>
<%@page import="java.util.List"%>
<%@page import="bean.DoctrineRule"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Notes</title>
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
String refNo=request.getParameter("doctrineRefNo");
request.getSession().setAttribute("doctrineRefNo", refNo);
List<DoctrineNotes> notes=new DoctrineService().getRelatedNotes(Integer.parseInt(refNo));
String allNotes="";
for(DoctrineNotes note : notes){
	allNotes+=note.getDoctrineNotes() + "\n";
}
DoctrineRule doctrine=new DoctrineService().validateDoctrine(Integer.parseInt(refNo));
%>
	<jsp:include page="../header.jsp" />
	<p><h5 style= "margin-left:20px;">&nbsp;  Welcome <%= session.getAttribute("username") %>&nbsp;! </h5></p>
	<div id="sidebar" class="col-md-3"></div>
	<div id="content" class="col-md-7">
		<div style="">
		<% 
		String type=(String)request.getSession().getAttribute("type"); 
		if(type==null||type.isEmpty()){
			out.println("<p style=\"color: red;\">Insufficient privilages.</p>");
		}
		else{
		%>
			<h3><%=doctrine.getDoctrineName() %></h3>
			<hr>
			<p id="successMessage"></p>
			<div class="container">
				<form action="/TKBS/AddNotes" method="post" id="addNotes">
					<div class="form-group row">
						<div class="col-sm-12">
							<textarea class="form-control" readonly placeholder="Display Doctrine summary" name="summary" id="summary"><%=doctrine.getDoctrineSummary() %></textarea>
						</div>
					</div>
					<h5>Previous Notes</h5>
					<hr>
					<div class="form-group row">
						<div class="col-sm-12">
							<textarea class="form-control" readonly placeholder="Display Previous Notes" name="notes" id="notes"><%= (allNotes==null||allNotes.isEmpty()) ? "No notes added for this doctrine." : allNotes %></textarea>
						</div>
					</div>
					<br/>
					<h5>Please Enter Your Notes</h5>										
					<div class="form-group row" Style="border-color:black;">
						<div class="col-sm-12">
							<textarea class="form-control" placeholder="Enter Related Notes" name="newNotes" id="newNotes"></textarea>
						</div>
					</div>
					<div class="form-group row" style="width:500px; margin-left:100px">
					<div class="col-sm-3">
					<a href="/TKBS/html/logout.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Back</a>
			</div>
			<div class="col-sm-3">
				<a href="/TKBS/html/logout.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:grey;">Home</a>
			</div>
					<input type="hidden" name="doctrineRefNo" value="<%=doctrine.getDoctrineRuleId() %>"/>
					<div class="col-sm-2 pull-right">
						<button type="submit" class="btn btn-primary" style="background-color:white; border-color:black; color:grey;">Submit</button>
					</div>
					
					<div class="col-sm-3">
				<a href="#" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:grey; cursor:not-allowed">Next</a>
			</div>
					</div>
				</form>
			</div>
			<%
		}
			%>
		</div>
		<br/><br/>
	</div>
</body>
</html>