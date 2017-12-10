<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TKBS</title>
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

    <header>
    <div class="heading">
    <h1 style ="Color: Blue">TKBS</h1> <h6>Topical Knowledge Base System</h6>
	</div>
	</header>

<%session.setAttribute("logid","1"); %>

	<nav class="navbar navbar-expand-lg navbar-light bg-light" style= "border: 1px solid black; "> 
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNavDropdown">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="#">Home</a></li>
			<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="loginLink" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Login </a>
				<div class="dropdown-menu" aria-labelledby="loginLink">
					<a class="dropdown-item" href="/TKBS/html/login.jsp">Student</a> 
					<a class="dropdown-item" href="/TKBS/html/login.jsp">Expert Attorney</a> 
					<a class="dropdown-item" href="/TKBS/html/adminLogin.jsp">Data Admin</a>
				</div></li>
				<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="loginLink" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> Register </a>
				<div class="dropdown-menu" aria-labelledby="loginLink">
					<a class="dropdown-item" href="/TKBS/html/signup.jsp">Student</a> 
					<a class="dropdown-item" href="/TKBS/html/signup.jsp">Expert Attorney</a> 
					<a class="dropdown-item" href="/TKBS/html/signup.jsp">Data Admin</a>
				</div></li>	
			<li class="nav-item"><a class="nav-link" href="#" style="color:#b4b4b4; cursor:not-allowed">Search Policy</a></li>
			<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="doctrinesLink" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false" style="color:#b4b4b4;cursor:not-allowed"> Policy </a>
				<div class="dropdown-menu" aria-labelledby="doctrinesLink" style="color:#b4b4b4;">
					<a class="dropdown-item" href="#" style="color:#b4b4b4;">Add Policy</a> 
					<a class="dropdown-item" href="#" style="color:#b4b4b4;">Add Case</a> 
					<!--  a class="dropdown-item" href="#" style="color:#b4b4b4;">Modify Policy</a-->
				</div></li>
				<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="reportsLink" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false" style="color:#b4b4b4;cursor:not-allowed"> Reports </a>
				<div class="dropdown-menu" aria-labelledby="reportsLink">
					<a class="dropdown-item" href="#" style="color:#b4b4b4;">My Account</a> 
					<a class="dropdown-item" href="#" style="color:#b4b4b4;">DB Update</a> 
				</div></li>
				<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="reportsLink" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false" style="color:#b4b4b4;cursor:not-allowed"> Query Request </a>
				<div class="dropdown-menu" aria-labelledby="reportsLink">
					<a class="dropdown-item" href="#" style="color:#b4b4b4;">Policy Report</a> 
					<a class="dropdown-item" href="#" style="color:#b4b4b4;">Most Viewed Cases</a>
					<a class="dropdown-item" href="#" style="color:#b4b4b4;">Expert Attorney Report</a>
				</div></li>
				
			    
				
				
			<li class="nav-item"><a class="nav-link" href="/TKBS/html/AboutUs.html" >About Us</a></li>
			<li class="nav-item"><a class="nav-link" href="/TKBS/html/ContactUs.html">Contact Us</a></li>	
		
		
	</div>
	</nav>
	<section style="margin: 0 auto; width: 20%;margin-top: 80px;">
		<br />
		<form class="form-horizontal">
			
			
            
			<div class="form-group">
                   
                    <p align="justify">Already a Member?<a href = "/TKBS/html/login.jsp">  Login</a></p>
                    <br/>
                    
                    <p align="justify">Not a member yet?<a href = "/TKBS/html/signup.jsp"> Register</a></p>
                        
                    </div>
                
            </form>
        

    </section>
    <br/>
	<section style="margin: 0 auto; width: 100%;margin-top: 20px; ">
	<div class="form-inline" style="margin-left:480px; " >
				<form action = "#"> 

				<div class="col-sm-3">
					<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary" name="" style="background-color:white; border-color:black; color:grey;" >Back</button>
				</div>
				</div>
				
				</form>
				<form action = "#"> 

				<div class="col-sm-3">
					<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary" name="signUp" style="background-color:white; border-color:black; color:grey;">Home</button>
				</div>
				</div>
				
				</form>
				
				<form action = "#">
				<div class="col-sm-3">
					<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary" name="signUp" style="background-color:white; border-color:black; color:grey;">Submit</button>
				</div>
				</div>
				</form>
				
				<form action ="/TKBS/html/login.jsp" >
				<div class="col-sm-3">
					<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary" name="signUp" style="background-color:white; border-color:black; color:black;" >Next</button>
				</div>
				</div>
				</form>
				
				
			</div>
			
			</section>
	

</body>
</html>