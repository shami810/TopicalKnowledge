<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
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
<p><h2 align=center style= "margin-left:20px;">&nbsp;  Welcome <%= session.getAttribute("username") %>&nbsp;! </h2></p>

	<!--div class="text-center">
		<form class="form-horizontal">
			<div class="form-group">
				<input type="text" class="col-sm-4 col-sm-6" id="searchText"
					placeholder="Search" style = "margin-left: 300px">
			</div>
			<br />
			<button type="submit" class="btn btn-primary" style = "margin-left: 600px">Search</button>
		</form>
	</div-->
	
	<!--section style="margin: 0 auto; width: 20%;margin-top: 20px;">
		<br />
		<form class="form-horizontal">
			<div class="form-group">
                    <p align="justify">Already a Member?<a href = "./Login.html">  Login</a></p>
                    <br/>
                    <p align="justify">Not a member yet?<a href = "./SignUp.html"> Register</a></p>
                    </div>
            </form>
    </section-->
    <hr>
    
<section style="margin: 0 auto; width: 100%;margin-top: 50px; "> <center>
<div class="form-inline" style="margin-left:580px; " >
				
				<br/><br/>
			<div class="form-inline">
			<div class="col-sm-3">
					<a href="/TKBS/html/logout.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Back</a>
			</div>
			<div class="col-sm-3">
				<a href="/TKBS/html/logout.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black;">Home</a>
			</div>
			<div class="col-sm-3">
					<button type="submit" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Submit</button>
			</div>
			<div class="col-sm-3">
					<a href="/TKBS/html/search.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Next</a>
			</div>	
			</div>
				
				
			</div>
			</center>
			</section>
    
</body>
</html>