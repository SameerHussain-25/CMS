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

textarea {
	height: 200px !important;
}

@keyframes swing {
  0% {
    transform: rotate(0deg);
  }
  10% {
    transform: rotate(10deg);
  }
  30% {
    transform: rotate(0deg);
  }
  40% {
    transform: rotate(-10deg);
  }
  50% {
    transform: rotate(0deg);
  }
  60% {
    transform: rotate(5deg);
  }
  70% {
    transform: rotate(0deg);
  }
  80% {
    transform: rotate(-5deg);
  }
  100% {
    transform: rotate(0deg);
  }
}

@keyframes sonar {
  0% {
    transform: scale(0.9);
    opacity: 1;
  }
  100% {
    transform: scale(2);
    opacity: 0;
  }
}
body {
  font-size: 0.9rem;
}

.nav-link{
color: white !important;
}

#inputGroupFileAddon01{
	height: 36px;
}

</style>
</head>
<body class="main_body">

<jsp:include page="/checksession" />
		
   <div class="d-flex" id="wrapper">
   
   <jsp:include page="/resources/parts/side-nav.html" /> 

    <!-- Page Content -->
    <div id="page-content-wrapper">

		<jsp:include page="/resources/parts/topnav.html" /> 
      		
		<div class="container-fluid">
			<div class="card justify-content-center">
				<div class="card-header">Complain Insertion</div>
				<form>

					<div class="form-group">
						<label for="complain_category_label">Hello <h1>${sessionScope.bean.Name} </h1>  Enter
							your Complain</label>
					</div>

					<div class="form-group">
						<label for="complain_category_label">Complain Category</label> <select
							class="browser-default custom-select">
							<option selected="">Open this select menu</option>
							<option value="1">One</option>
							<option value="2">Two</option>
							<option value="3">Three</option>
						</select>
					</div>

					<div class="form-group">
						<label for="exampleFormControlTextarea1">Enter Complain</label>
						<textarea class="form-control" id="exampleFormControlTextarea1"
							rows="3"></textarea>
					</div>
					
					<div class="input-group my-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
						</div>
						
						<div class="custom-file mb-3">
					      <input type="file" class="custom-file-input" id="customFile" name="filename">
					      <label class="custom-file-label" for="customFile">Choose file</label>
					    </div>
					</div>

					<button type="submit" class="btn btn-primary float-right">Add
						Complain</button>
					<button type="submit" class="btn btn-info">Back</button>
				</form>
			</div>
			
			</div>
    <jsp:include page="/resources/parts/footer.html" /> 
    <!-- /#page-content-wrapper -->

  </div>
  <!-- /#wrapper -->
		
  </div>
  	
  	<script src="${pageContext.request.contextPath}/resources/js/js.js"></script>
  		
	</body>
</html>
