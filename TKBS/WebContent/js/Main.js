$(document).ready(function(){
	$("#signup").on('submit',function(e){
		//$("#inputPassword1")[0].setCustomValidity("");
		e.preventDefault();
		var password =$("#inputPassword").val();
		var confirm_password=$("#inputPassword1").val();
		if(password != confirm_password) {
			//$("#inputPassword1")[0].setCustomValidity("Passwords Doesn't Match");
			$("#passwordError").css('display','block');
			$("#passwordError").css('color','red');
			$("#passwordError").css('margin','20px');
		} else {
			//alert("in else");
			//$("#inputPassword1")[0].setCustomValidity("");
			$("#passwordError").css('display','none');
			//this.submit();
			$.ajax({
				url: $("#signup").attr("action"),
				method:"POST",
				data:$("#signup").serialize(),
				success:function(data) {
                    $("#formResult").html(data+"<br/>");
                    $("#formResult").addClass("successMessage");
                    $("#signup")[0].reset();
                 }
			});
		}
			
	});
	
	$("#changePassword").on('submit', function(e){
		e.preventDefault();
		var password =$("#newPassword").val();
		var confirm_password=$("#confirmNewPassword").val();
		if(password != confirm_password) {
			//$("#inputPassword1")[0].setCustomValidity("Passwords Doesn't Match");
			$("#passwordError").css('display','block');
			$("#passwordError").css('color','red');
			$("#passwordError").css('margin','20px');
			$("#passwordError").html("Passwords doesn't match.");
		}
		else{
			$.ajax({
				url: $("#changePassword").attr("action"),
				method:"POST",
				data:$("#changePassword").serialize(),
				success:function(data) {
                    $("#passwordError").html(data+"<br/>");
                 }
			});			
		}		
	});
	
	$("#changeName").on('submit', function(e){
		console.log('in js1');
		e.preventDefault();
		console.log("in js");
			$.ajax({
				url: $("#changeName").attr("action"),
				method:"POST",
				async:true,
				data:$("#changeName").serialize(),
				success:function(data) {
					console.log("in ajax success");
					$("#passwordError").css('display','block');
					console.log(data);
                    $("#passwordError").html(data+"<br/>");
                 }
			});		
	});
	
	$("#deleteDoctrine").on('submit', function(e){
		e.preventDefault();
			$.ajax({
				url: $("#deleteDoctrine").attr("action"),
				method:"POST",
				async:true,
				data:$("#deleteDoctrine").serialize(),
				success:function(data) {
					$("#errorMessage").css('display','block');
                    $("#errorMessage").html(data+"<br/>");
                 }
			});		
	});
	
	$("#addNotes").on('submit', function(e){
		e.preventDefault();
			$.ajax({
				url: $("#addNotes").attr("action"),
				method:"POST",
				async:true,
				data:$("#addNotes").serialize(),
				success:function(data) {
					$("#successMessage").css('display','block');
                    $("#successMessage").html(data+"<br/>");
                 }
			});		
	});
	
	
});