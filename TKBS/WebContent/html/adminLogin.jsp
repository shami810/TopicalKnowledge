<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<script type="text/javascript" src="/TKBS/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/TKBS/js/popper.min.js"></script>
<script type="text/javascript" src="/TKBS/js/bootstrap.js"></script>
<script type="text/javascript" src="/TKBS/js/Main.js"></script>
<link rel="stylesheet" href="/TKBS/css/bootstrap-grid.css">
<link rel="stylesheet" href="/TKBS/css/bootstrap-reboot.css">
<link rel="stylesheet" href="/TKBS/css/bootstrap.css">
<link rel="stylesheet" href="/TKBS/css/Main.css">
</head>
<%String id =(String)session.getAttribute("logid"); 
String name =(String)session.getAttribute("name"); %>
<body onload = "shows_form_part(<%=id%>)">

<jsp:include page="header1.jsp" />
<section style="margin: 0 auto; width: 30%; margin-top: 10px;">
		<br />
		
		<div id ="form_part1">
		<div class="col-sm-10">
			<p>Don't have an account yet? &nbsp; <a href="./SignUp.html">Register</a></p>
			
		</div>
		<form class="form-horizontal" action="/TKBS/LoginAdmin" method="post" id ="login">
			<legend class="col-sm-4">Login</legend>
			<hr class="">
			<div class="form-group">
				<label for="inputEmail" class="col-sm-6 control-label">Username</label>
				<div class="col-sm-11">
					<input type="text" class="form-control" id="inputUsername" name="username"
						placeholder="Enter your username" required>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-6 control-label">Password</label>
				<div class="col-sm-11">
					<input type="password" class="form-control" id="inputPassword" name="org_password"
						placeholder="Password">
						<input type="checkbox" onchange="document.getElementById('inputPassword').type = this.checked ? 'text' : 'password'"> Show password
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-6 control-label">Unique Password</label>
				<div class="col-sm-11">
					<input type="password" class="form-control" id="inputPassword" name="uniquepassword"
						placeholder="Unique Password">
				</div>
			</div>
		
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary" name="frgt" 
					style="background:none!important; border:none; padding:0!important;  
					font-family:arial,sans-serif; color:#069; text-decoration:underline; cursor:pointer">Forgot your Password?</button>
				</div>
			</div>
			<br/>
			
			<div class="form-inline">
			<div class="col-sm-3">
					<a href="logout.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Back</a>
			</div>
			<div class="col-sm-3">
					<a href="#" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:grey;">Home</a>
			</div>
			<div class="col-sm-3">
					<button type="submit" class="btn btn-primary" name="log" style="background-color:white; border-color:black; color:black;">Submit</button>
			</div>
			<div class="col-sm-3">
					<a href="#" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:grey;">Next</a>
			</div>
			
			</div>		
		</form>
	</div>
	
	<div id ="form_part2">
	<form class="form-horizontal" action="/TKBS/TemporaryPassword" method="post" id ="login">
			<h6 style="margin-top:20px; color:#e53222;">Temporary password sent on the registered email id.</h6>	
			<br/>
			<legend class="col-sm-4">Login</legend>
			<hr class="">			
			<div class="form-group">
				<div class="form-group">
				<label for="inputEmail" class="col-sm-3 control-label">Username</label>
				<div class="col-sm-11">
					<input type="text" class="form-control" id="inputUsername" name="username"
						 placeholder="<%=name%>" readonly style="color:#000000;">
						
						<%--session.setAttribute("user", request.getParameter("username")); 
						String user = request.getParameter("username");--%>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-6 control-label">Temporary Password</label>
				
				<div class="col-sm-11">
					<input type="password" class="form-control" id="inputPassword" name="tempPass"
						placeholder="Enter Temporary Password" required>
				</div>
			</div>
			<br/><br/>
			
			<div class="form-inline">
			<div class="col-sm-3">
					<a href="logout.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Back</a>
			</div>
			<div class="col-sm-3">
				<a href="#" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:grey;">Home</a>
			</div>
			
			<div class="col-sm-3">
				<button type="submit" class="btn btn-primary" name="temp" onclick="shows_form_part(3)" style="background-color:white; border-color:black; color:black;">Submit</button>
			</div>
			<div class="col-sm-3">
					<a href="#" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:grey;">Next</a>
			</div>
			</div>
		</div>
		
	

		</form>
		</div>
		
		<div id ="form_part3">		
			<form class="form-horizontal" action="/TKBS/ChangePassword" method="post" id ="login">
			
			<legend class="col-sm-4">Login</legend>
			<hr class="">			
			<div class="form-group">
				<div class="form-group">
				<label for="inputEmail" class="col-sm-3 control-label">Username</label>
				<div class="col-sm-11">
					<input type="text" class="form-control" id="inputUsername" name="username"
						 placeholder="<%=name%>" readonly style="color:#000000;">
						
						<%--session.setAttribute("user", request.getParameter("username")); 
						String user = request.getParameter("username");--%>
				</div>
			</div>
			</div>
			<div class="form-group">
				<label for="inputEmail" class="col-sm-6 control-label">New Password</label>
				<div class="col-sm-11">
				
					<input type="password" class="form-control" id="inputPassword"
						placeholder="Enter new password" name="password" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required>
				</div>
				</div>
				
			
			<div class="form-group">
				<label for="inputEmail" class="col-sm-11 control-label">Confirm new Password</label>
				<div class="col-sm-11">
					<input type="password" class="form-control" id="inputPassword1"
						placeholder="Confirm Password*" name="confirmPassword" required>
				</div>
			</div>
			
				<div id="passwordError" style="display : none ">Password doesn't Match.</div>
			<br/><br/>
			
			<div class="form-inline">
			<div class="col-sm-3">
					<a href="logout.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Back</a>
			</div>
			<div class="col-sm-3">
				<a href="#" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:grey;">Home</a>
			</div>
				<div class="col-sm-3">
					<button type="submit" class="btn btn-primary" name="temp" onclick="shows_form_part(3)">Submit</button>
				</div>
				<div class="col-sm-3">
					<a href="#" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:grey;">Next</a>
			</div>
			</div>
		
		
		</form>
		</div>
		<div id ="form_part4">		
			<form class="form-horizontal" action="/TKBS/Validation" method="post" id ="login">
			
			<legend class="col-sm-4">Login</legend>
			<hr class="">			
			<div class="form-group">
			<%String ques = (String)session.getAttribute("secQues"); %>
				<div class="form-group">
				<label for="inputEmail" class="col-sm-11 control-label"><%=ques %></label>
				<div class="col-sm-11">
					<input type="text" class="form-control" id="inputUsername" name="ans"
						 placeholder="Enter answer">
						
				</div>
				</div>
				</div>
			<br/><br/>
			<div class="form-inline">
			<div class="col-sm-3">
					<a href="logout.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Back</a>
			</div>
			<div class="col-sm-3">
				<a href="#" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:grey;">Home</a>
			</div>
			<div class="col-sm-3">
					<button type="submit" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Submit</button>
			</div>
			<div class="col-sm-3">
					<a href="#" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Next</a>
			</div>	
			</div>
		
		
		</form>
		</div>
	
		
	</section>
	<script>
	function shows_form_part(n)
	{
    	var i = 1, p = document.getElementById("form_part"+1);
    	while (p !== null)
    	{
        	if (i === n)
        	{
            	p.style.display = "";
        	}
        	else
        	{
            	p.style.display = "none";
        	}
        	i++;
        	p = document.getElementById("form_part"+i);
    	}
	}
</script>
</body>
</html>