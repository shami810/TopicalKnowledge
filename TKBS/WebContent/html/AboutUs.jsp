<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About Us</title>
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
<p><h6>&nbsp;  Welcome <%= session.getAttribute("username") %>!!!!</h6></p>
<br/>
<section style="margin: 0 auto; width: 40%; margin-top: 10px;">

            <form class="form-horizontal">
                <fieldset class="fieldset">
            <legend class="col-sm-6">About Us</legend>
			<hr class="">
			
			<div class="form-group">
                    <p align = "justify">Topical Knowledge Base of Doctrines and Rules System is a knowledge based system, which will retrieve the doctrines and related information from the database. The system will use keywords that the law students and/or naïve lawyers would enter and provide the results that are found related to the keywords. Besides, searching for doctrines or rules, the system will also work as a platform where Expert Attorneys can add their knowledge related to a doctrine or rule and can also update the system for new doctrines or rules. If the system is unable to find requested information, the Data Admin will notify the Expert Attorney to update the knowledge base with the question and the related answer.</p>
                    <br/>
                        
                    </div>
                </fieldset>
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
					<a href="/TKBS/html/ContactUs.jsp" class="btn btn-primary" name="temp" style="background-color:white; border-color:black; color:black; ">Next</a>
			</div>	
			</div>
				</form>
				
				
			</div>
			
			</section>
    
	<footer> </footer>
</body>
</html>