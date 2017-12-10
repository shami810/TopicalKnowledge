<%@page import="java.util.List"%>
<%@page import="bean.DoctrineNotes"%>
<%@page import="services.DoctrineService"%>
<%@page import="bean.DoctrineRule"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Doctrine Info</title>
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
String sectionNo=(String) request.getParameter("sectionNo");
String chapterNo=(String) request.getParameter("chapterNo");
DoctrineRule doctrine = new DoctrineService().validateDoctrine(sectionNo, chapterNo);
if(sectionNo==null||sectionNo.isEmpty()||chapterNo==null||chapterNo.isEmpty()){
	doctrine=new DoctrineService().validateDoctrine(Integer.parseInt((String)request.getSession().getAttribute("doctrineRefNo")));
}
List<DoctrineNotes> list=new DoctrineService().getRelatedNotes(doctrine.getDoctrineRuleId());
String notes="";
for(DoctrineNotes dn : list){
	notes+=dn.getDoctrineNotes()+"<br/>";
}
%>
	<jsp:include page="header.jsp" />
	<p><h5 style= "margin-left:20px;">&nbsp;  Welcome <%= session.getAttribute("username") %>&nbsp;! </h5></p>
	<div id="sidebar" class="col-md-3"></div>
	<div id="content" class="col-md-3">		
			<div id="doctinesInfo">
				<h4><%=doctrine.getDoctrineName() %></h4>
				<hr>
				<div id="doctrineDetails"></div>
				<table>
					<tr>
						<td>Section</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><%=doctrine.getDoctrineSectionNo() %></td>
					</tr>
					<tr>
						<td>Chapter</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><%=doctrine.getDoctrineChapterNo() %></td>
					</tr>
					<tr>
						<td>Type</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><%=doctrine.getDoctrineType() %></td>
					</tr>
					<tr>
						<td>Keyword</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><%=doctrine.getKeywords() %></td>
					</tr>
				</table>
				<br />
				
				<h5>Summary</h5>
				<hr>
				<div id="summary"><%=doctrine.getDoctrineSummary() %></div>
				<br />
				<h5>Notes</h5>
				<hr>
				<div id="summary"><%= (notes==null||notes.isEmpty()) ? "No notes added for this doctrine." : notes %></div>
				<br />
				<div class="form-group row">
				<form action="/TKBS/html/user/addNotes.jsp" method="post">
				<input type="hidden" name="doctrineRefNo" value="<%=doctrine.getDoctrineRuleId() %>"/>
					<div class="col-sm-10 pull-left" style="padding-left: 50px;">
						<button type="submit" class="btn btn-primary">Add Notes</button>
					</div>
					</form>
					<form action="/TKBS/html/user/relatedCases.jsp" method="post">
					<input type="hidden" name="doctrineRefNo" value="<%=doctrine.getDoctrineRuleId() %>"/>
					<div class="col-sm-2 pull-right">
						<button type="submit"class="btn btn-primary">View Cases</button>
					</div>
					</form>
				</div>
			</div>
		</div>
		<br/>
	</div>
</body>
</html>