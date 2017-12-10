<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up</title>
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
<jsp:include page="header1.jsp" />
<h3 style="margin-left:20px;  ">Register as Data Admin</h3>
	<section style="margin: 0 auto; width: 40%;">
		<form class="form-horizontal" method="post" action="/TKBS/RegisterAdmin" id="signupadmin">
			<div class="form-inline">
			<div class="col-sm-6">
					<input type="text" class="form-control" id="inputText"
						placeholder="Enter Your First Name*"  name="firstName" pattern="[a-zA-Z ]+[a-zA-Z0-9]+" required>
						</div>
						<div class="col-sm-6">
					<input type="text" class="form-control" id="inputText2"
						placeholder="Enter Your Last Name*"  name="lastName" pattern="[a-zA-Z ]+[a-zA-Z0-9]+" required>
						</div>
			</div>
			<br/>
			
			<!--div class="form-group">
				<div class="col-sm-6">
					<select id="idgender">
						<option value="gender" name = "gender">Please select your gender*</option>
 						<option value="Female" name = "gender">Female</option>
  						<option value="Male" name = "gender">Male</option>
  						<option value="Other"name = "gender">Other</option>
					</select>
				</div>
			</div-->
			<div class="form-group">
				<div class="col-sm-12">
					<input type="email" class="form-control" id="inputEmail"
						placeholder="Enter your email address*" name="email" required>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					<input type="username" class="form-control" id="inputUsername"
						placeholder="Enter your Username*" name="username" required>
				</div>
			</div>
			<div class="form-inline">
				<div class="col-sm-6">
					<input type="password" class="form-control" id="inputPassword"
						placeholder="Password*" name="password" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required>
				</div>
				<div class="col-sm-6">
					<p style="font-size:12px">*Password should include atleast 1 uppercase,lowercase and special character</p>
				</div>
			</div>
			<br/>
			<div class="form-inline">
				<div class="col-sm-6">
					<input type="password" class="form-control" id="inputPassword1"
						placeholder="Confirm Password*" name="confirmPassword" required>
				</div>
			</div><br/>
			<div id="passwordError" style="display : none ">Password doesn't Match.
				</div>
			<div class="form-inline">
				<div class="col-sm-6">
					<input type="password" class="form-control" id="uniquePassword"
						placeholder="Unique Password*" name="uniquePassword" required>
				</div>
			</div>
				<div id="uniquepasswordError" style="display : none ">Unique Password Incorrect.
				</div>
			<br>
			<div class="form-group">
				<div class="col-sm-12">
					<select id="question" class="form-control" name="question">
					
						<option>Please select your security question?*</option>
 						<option>What is your mother's maiden name?</option>
  						<option>What is your first school's name?</option>
  						<option>What is your dog's breed?</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-12">
					<input type="username" class="form-control" id="idanswer"
						placeholder="Enter your answer of security question*" name="answer" required>
				</div>
			</div>
			
						
			  <!--  div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<label> <input type="checkbox" name="terms" required> I have read and
							agree to be bound by the Terms and Conditions and Privacy Policy
						</label>
					</div>
				</div>
			</div-->
			<br/>
			
			<div class="form-inline">
			<div class="col-sm-3">
					<a href="#" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Back</a>
			</div>
			<div class="col-sm-3">
				<a href="#" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:grey;">Home</a>
			</div>
				<div class="col-sm-3">
					<button type="submit" class="btn btn-primary" name="signUp" style="background-color:white; border-color:black; color:black;">Submit</button>
				</div>
			<div class="col-sm-3">
					<a href="#" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:grey;">Next</a>
			</div>
		</div>
			
		</form>
	</section>
	<footer> </footer>
</body>
</html>