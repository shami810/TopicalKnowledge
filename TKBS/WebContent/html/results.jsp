<%@page import="bean.DoctrineRule"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Results</title>
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
<p><h5 style= "margin-left:20px;">&nbsp;  Welcome <%= session.getAttribute("username") %>&nbsp;! </h5></p>
<div id="sidebar" class="col-md-3"></div>
<div id="content" class="col-md-6">
<h5><p>Related Search Results</p></h5>

<%
List<DoctrineRule> list=(List<DoctrineRule>)request.getSession().getAttribute("doctrines");
if(list != null)
{
for(DoctrineRule d: list){
	System.out.println(d.getDoctrineSectionNo());
%>
<form id="<%=d.getDoctrineRuleId() %>" action="/TKBS/html/doctrineInfo.jsp" method="post">
<input type="hidden" name="sectionNo" value="<%=d.getDoctrineSectionNo() %>"/>
<input type="hidden" name="chapterNo" value="<%=d.getDoctrineChapterNo() %>"/>
<a class="btn" style="text-decoration:underline;cursor:pointer;font-size: 18px" onclick="document.getElementById('<%=d.getDoctrineRuleId() %>').submit();return false;" id="<%= d.getDoctrineReferenceNo()%>"><%= d.getDoctrineName() %></a><br/>
</form>

<%
}
}
else
{%>
	
	<h5 style='color:red'>No relevant results found.</h5>
<%}
%>
</div>
</div>
</div>
</body>
</html>