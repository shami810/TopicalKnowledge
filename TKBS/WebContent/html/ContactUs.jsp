<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact Us</title>
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
<p><h5>&nbsp;  Welcome <%= session.getAttribute("username") %>!!!!</h5></p>
<br/>
<section style="margin: 0 auto; width: 50%;">
		<br />
		<form class="form-horizontal">
			
			<legend class="col-sm-6">Contact Us</legend>
			<hr class="">
            
			<div class="form-group">
                   
                     <ul>
                    <li><h6>Front-End Design:</h6></li>
                    <li style="list-style: none">Nikita Shinde</li>
                    <li style="list-style: none">shinden3@mail.sacredheart.edu</li>
                </ul>
                <br/>
                 <ul>
                    <li><h6>System builder:</h6></li>
                    <li style="list-style: none">Shami Waghmare</li>
                    <li style="list-style: none">waghmares@mail.sacredheart.edu</li>
                </ul>
                <br/>
                <ul>
                   <li><h6>Database-related queries:</h6></li>
                    <li style="list-style: none">Sanchita Ghuge</li>
                    <li style="list-style: none">ghuges@mail.sacredheart.edu</li>
                </ul>
                <br/>
                <ul>
                    <li><h6>System Analyst:</h6></li>
                    <li style="list-style: none">Ajay Rane</li>
                    <li style="list-style: none">ranea@mail.sacredheart.edu</li>
                </ul>
                    
                        
                    </div>
                
            </form>
        

    </section>
	   <br/><hr>	
<section style="margin: 0 auto; width: 100%;margin-top: 50px; ">
<div class="form-inline" style="margin-left:480px; " >
				
				<form> 
				<br/>
			<div class="form-inline">
			<div class="col-sm-3">
					<a href="/TKBS/html/home.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black;">Back</a>
			</div>
			<div class="col-sm-3">
				<a href="/TKBS/html/logout.jsp" " class="btn btn-primary" name="temp" style="background-color:white; border-color:black;">Home</a>
			</div>
			<div class="col-sm-3">
					<button type="submit" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:grey;">Submit</button>
			</div>
			<div class="col-sm-3">
					<a href="#" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:grey; ">Next</a>
			</div>	
			</div>
				</form>
				
				
			</div>
			
			</section>
	<footer> </footer>
</body>
</html>