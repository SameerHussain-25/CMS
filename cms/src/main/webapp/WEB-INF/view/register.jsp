<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<jsp:include page="/resources/parts/headers.jsp" />

<style>
.form-group {
padding: 0 10px;
}

.form-control.success input {
	border-color: #2ecc71;
}

.form-control.error input {
	border-color: #e74c3c;
}

</style>
</head>
<body>

<% 
	String std_idstr=request.getParameter("stdid");
	String cnicstr=request.getParameter("cnic");
	String password=request.getParameter("password");
	
	if(std_idstr != null && cnicstr != null && password != null){
	
		int std_id=Integer.parseInt(std_idstr);
		
		model.RegistrationBean bean=new model.RegistrationBean(std_id, cnicstr, password);
		try {
			model.CMSDbManager.registerdStudent(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

%>
	
	<jsp:include page="/resources/parts/topnavlogin.html" />
	
	
		<div class="col-lg-12 d-flex justify-content-center" style="margin-top:50px">
				<div class="card registration">
					<div class="card-header">Student Registration</div>
						<div class="form-group"  id="usernameform">
							<label for="Name">Roll_Number</label> <input type="text"
								class="form-control" id="rollnum" name="rollnum" required="required"  placeholder="eg.2k17/ite/93" >
						</div>
							
						<div id="data">
						</div>
							
						<button type="submit" class="btn btn-primary float-right" id="search">Search</button>
					
				</div>
			</div>
			
	
	<jsp:include page="/resources/parts/footer.html" />
	
	<script>
		
	$("#search").click(function(){
	    	
	        var rollno = $("#rollnum").val();
	        
	        $.ajax({
	            url: 'checkrollnum',
	            type: 'post',
	            data: {rollno:rollno},
	            dataType: 'html',
	            success:function(response){
					document.querySelector("#data").innerHTML = response;

					if(!(response.toString().indexOf("alert") > -1)){
						$('#search').html("Create Account");
						$('#search').attr('onclick','addStd()');
						$('#rollnum').attr('readonly',true);
						$('#cnic').attr('required',required);
						$('#password').attr('required',required);
						$('#usernameform').addClass('error');
						$('#search').attr('id','createaccount');
					}
	            }
	        });
	  });

	
	  function addStd(){
	   
	 	        var stdid = $("#stdid").val();
	 	        var cnic = $("#cnic").val();
	 	        var password = $("#confirm_password").val();
	 	        $.ajax({
	 	            url: 'registration',
	 	            type: 'post',
	 	            data: { stdid: stdid, cnic: cnic, password:password},
	 	            dataType: 'html',
	 	            success:function(response){
	 	            $('#data').html("");
					$('#data').html("<div class=\"alert alert-success\" role=alert>Created Successfully!</div>");
					$('#rollnum').attr('readonly',false);
					$('#rollnum').val("");
					$('#createaccount').html('id','search');
					$('#search').html('Search');
	 	            }
	 	        });
	  }
		   
	  
		$(".alert-success").fadeTo(2000, 500).slideUp(500, function(){
		    $(".alert-success").slideUp(500);
		   
		});

	
	</script>
</body>
</html>