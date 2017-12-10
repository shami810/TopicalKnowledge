<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<header>
    <div class="heading">
    <h1 style ="Color: Blue">TKBS</h1> <h6>Topical Knowledge Base System</h6>
	</div>
	</header>
	
	<% if(session.getAttribute("username")!=null)
	{  				
				String username = (String)session.getAttribute("username");			 
    			session.setAttribute("username", username);%>
    			
    							
    <% } %>	
    
    <%String type = (String) session.getAttribute("type"); %>	
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light" style= "border: 1px solid black; "> 
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNavDropdown">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="/TKBS/html/logout.jsp">Home</a></li>
			<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="loginLink" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false" style="color:#b4b4b4; cursor:not-allowed"> Login </a>
				</li>
			<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="loginLink" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false" style="color:#b4b4b4; cursor:not-allowed"> Register </a>
				</li>	
				
			<li class="nav-item"><a class="nav-link" href="/TKBS/html/search.jsp">Search</a></li>
			<%if((type.equals("Expert Attorney")||type.equals("Data Admin")) ) 
			{%>
			
			
			<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="doctrinesLink" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Policy</a>
				<div class="dropdown-menu" aria-labelledby="doctrinesLink">
					<a class="dropdown-item" href="/TKBS/html/expertAttorney/validateDoctrine.jsp">Add Policy</a> 
					<a class="dropdown-item" href="/TKBS/html/expertAttorney/validateCase.jsp">Add Case</a> 
					<!-- <a class="dropdown-item" href="#">Modify Doctrine</a> -->
				</div></li>
			<%}
			
			else
			{%>			
			<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="doctrinesLink" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false" style="color:#b4b4b4; cursor:not-allowed"> Policy</a>
				<!-- div class="dropdown-menu" aria-labelledby="doctrinesLink">
					<!-- a class="dropdown-item" href="#" style="color:#b4b4b4;">Add Policy</a--> 
					<!-- >a class="dropdown-item" href="#" style="color:#b4b4b4;">Add Case</a--> 
					<!-- <a class="dropdown-item" href="#">Modify Doctrine</a>>
				</div--></li>
			<%}%>
				<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="reportsLink" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Reports </a>
				<div class="dropdown-menu" aria-labelledby="reportsLink">
					<a class="dropdown-item" href="/TKBS/html/MyAccountReport.jsp">My Account</a>
					
					<%if(type.equals("Data Admin")) 
					{%> 
					<a class="dropdown-item" href="/TKBS/html/DB_Update.jsp">DB Update</a> 
					<%}
					
					else
					{%> 
					<a class="dropdown-item" href="#" style="color:#b4b4b4; cursor:not-allowed">DB Update</a> 
					<%}%>
				</div></li>
				<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="reportsLink" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Query Request </a>
				<div class="dropdown-menu" aria-labelledby="reportsLink">
					<a class="dropdown-item" href="/TKBS/html/user/doctrineReport.jsp">Policy Report</a> 
					<a class="dropdown-item" href="/TKBS/html/user/ruleReport.jsp">Rule Report</a>
					<a class="dropdown-item" href="/TKBS/html/user/expertAttorneyReport.jsp">Expert Attorney Report</a>
					<a class="dropdown-item" href="/TKBS/html/user/Student_Report.jsp">Student Report</a>
				</div></li>
			<li class="nav-item"><a class="nav-link" href="/TKBS/html/AboutUs.jsp">About Us</a></li>
			<li class="nav-item"><a class="nav-link" href="/TKBS/html/ContactUs.jsp">Contact Us</a></li>				
		</ul>
	</div>
	</nav>