<!DOCTYPE html>
<html lang="en" xmlns:th="http://thymeleaf.org"
				>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Simple Sidebar - Start Bootstrap Template</title>

<jsp:include page="/resources/parts/headers.jsp" />
</head>
</head>

<body>

  <div class="d-flex" id="wrapper">

    <!-- Sidebar -->
    <div class="bg-light border-right white" id="sidebar-wrapper">
      <div class="sidebar-heading">Start Bootstrap </div>
      <div class="list-group list-group-flush">
        <a href="#" class="list-group-item list-group-item-action bg-light">Dashboard</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Shortcuts</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Overview</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Events</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Profile</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Status</a>
      </div>
    </div>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
  	
	<div class="page-wrapper chiller-theme toggled">
		
		<jsp:include page="/resources/parts/topnav.html" />
		 <main class="page-content">
		 
		<div class="container-fluid">
			<div class="card justify-content-center">
				<div class="card-header">Complain Insertion</div>
				<form>

					<div class="form-group">
						<label for="complain_category_label">Hello Adnan! Enter
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
						
						<div class="custom-file">
							<input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
							<label  class="custom-file-input" for="inputGroupFile01">Choose File</label>	
						</div>
					</div>

					<button type="submit" class="btn btn-primary float-right">Add
						Complain</button>
					<button type="submit" class="btn btn-info">Back</button>
				</form>
			</div>
			
			</div>
		</main>
		<jsp:include page="/resources/parts/footer.html" />
	</div>
  <!-- /#wrapper -->

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Menu Toggle Script -->
  <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
  </script>

</body>

</html>
