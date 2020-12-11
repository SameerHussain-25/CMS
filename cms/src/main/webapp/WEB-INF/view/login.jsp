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
	.form-group input[type=text],input[type=password]{
		padding-left:33px; 
		min-width: 300px !important;
	}
	.form-group{
	position: relative;	
	}
	.form-group i{
	position: absolute;
	top: 0;
	left:10px;
	padding: 42px 0;
	color: #152f4f;
	}
</style>
</head>
<body>

<%
response.setHeader("cache-control", "no-store");

String uname=request.getParameter("username");
String pass=request.getParameter("password");

try {

if(uname != null && pass != null){
	if(model.CMSDbManager.checkStudentUnamePassword(uname, pass)) {
		model.StudentBean bean=model.CMSDbManager.getStudentByStdRollNum(uname);
		  
	    session.setAttribute("user",bean);
	    response.sendRedirect("insertComplain");
	}
	else {
		response.sendRedirect("login?error");
	}
}
	request.getRequestDispatcher("insertComplain").include(request,response);
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
 }



%>


	
	<jsp:include page="/resources/parts/topnavlogin.html" />

	<div class="col-lg-12 d-flex justify-content-center">
		<div class="card login">
			<div class="card-header">Login Form</div>
			<form action="" method="post">
				<c:if test="${param.error != null}">					
					<div class="alert alert-danger" role="alert">
  						Failed To Login User Not Found
					</div>
				</c:if>
				<c:if test="${param.logout != null}">
				<div class="alert alert-primary" role="alert">
  						You have been logged out
				</div>
				</c:if>
				<div class="form-group">
					<label for="Username">Username</label> 
					<div class="row">
						
						<div class="col-lg-10"> 
							<input type="text"class="form-control" id="username" name="username" placeholder="Enter Username">
						</div>	
						<i class="fas fa-user"></i>
					</div>	
				</div>

					<div class="form-group">
					<label for="Username">Password</label> 
					<div class="row">
						<div class="col-lg-10"> 
							<input type="password" class="form-control" id="password" name="password" placeholder="Enter password">
						</div>
						<i class="fas fa-lock"></i>	
					</div>	
				</div>

				<div class="form-group">
					<label for="password">Don't have account? <a href="register.jsp">Create
							Account</a></label>
				</div>

				<button type="submit" class="btn btn-primary btn_login">Login</button>
			</form>
		</div>
		</div>
	
	
	<jsp:include page="/resources/parts/footer.html" />
	
	<c:if test="${param.error != null}">
	<script>
		document.querySelector(".login").style.height = "27rem";
		$(".alert-danger").fadeTo(2000, 500).slideUp(500, function(){
			 document.querySelector(".login").style.height = "22rem";
		    $(".alert-danger").slideUp(500);
		    window.history.replaceState({}, document.title, "/" + "cms/login");
		});
	</script>
	</c:if>
	
	<c:if test="${param.logout != null}">
	<script>
		document.querySelector(".login").style.height = "27rem";
		$(".alert-primary").fadeTo(2000, 500).slideUp(500, function(){
			 document.querySelector(".login").style.height = "22rem";
		    $(".alert-primary").slideUp(500);
		    window.history.replaceState({}, document.title, "/" + "cms/login");
		});
	</script>
	</c:if>
</body>
</html>
