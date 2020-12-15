<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <jsp:include page="/resources/adminParts/adminCSS.jsp">
 	
 	 <jsp:param name="listComplain" value="yes"/>
 	 <jsp:param name="file" value="ComplainList"/>
 	
 </jsp:include>
 <jsp:include page="/resources/adminParts/adminNav.jsp" />
 <jsp:include page="/resources/adminParts/adminSidebar.jsp">
 	
 	<jsp:param name="complainList" value="active"/>
 	
 </jsp:include>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

	<script>
		
	function status(id){
        $.ajax({
            url: 'changeStatus',
            type: 'post',
            data: {id:id},
            
            success:function(response){
            	alert("working");
            	$("#seen"+id).addClass('btn-success').removeClass('btn-danger');
            	$("#seen"+id).prop('disbaled',true);
            }
        });
	 }
	
	</script>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
      	
      	  <jsp:include page="/resources/adminParts/adminColorBox.jsp" />

		<div class="container mt-3">
  <h2>Search From Complains</h2>
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
 
</div>
		
        <div class="row">
          <div class="col-12" id="cards">
<!--             card start -->

			<c:choose>
			<c:when test="${complains != null}">
			  <c:forEach var="bean" items="${complains}">
				
				<div class="card justify-content-center">
					<div class="card-header" style="background-color: #152f4f; color:white">
					   <b>${bean.datetime}</b>
					</div>
					<div class="card-body">
						<h5 class="card-title"><strong>Complain Text: </strong></h5>
						<p class="card-text">${bean.complain}</p>
					</div>
					
					<c:set var="catId" value="${bean.complainCatId}" />
					<c:set var="stdRegId" value="${bean.stdRegId}" />
					
					<% 
						try{
						
							int  catId = (Integer) pageContext.getAttribute("catId");
							int stdId = (Integer) pageContext.getAttribute("stdRegId");
							
							java.util.ArrayList<String> values = model.CMSDbManager.getComplainCategoryByComplainCatIdAndStdRegId(catId, stdId);
						
							pageContext.setAttribute("category",values.get(1));
							pageContext.setAttribute("studentName",values.get(0));
							
						}catch(Exception e){
							e.printStackTrace();
						}
					%>
					
					<ul class="list-group list-group-flush">
						<li class="list-group-item">Name: <strong>${studentName}</strong></li>
						<li class="list-group-item">Complain About:<strong>${category}</strong></li>
						<li class="list-group-item">File Uploaded Type:<strong></strong> </li>
					</ul>
					<div class="card-body file_status_body">
					<div class="file_status">
						
						<c:choose>
							
							<c:when test="${bean.status == 1}">
								
								<button onclick="status('${bean.complainId}')" type="button" class="btn btn-block btn-success btn-sm" id="seen${bean.complainId}" disabled>Status</button>
							
							</c:when>
						
							<c:otherwise>
								
								<button onclick="status('${bean.complainId}')" type="button" class="btn btn-block btn-danger btn-sm" id="seen${bean.complainId}">Status</button>
							
							</c:otherwise>
						</c:choose>
					
					</div>
					<div class="file_status" style="width:200px">
						<button type="button" class="btn btn-block btn-info btn-sm" onclick="window.location.href= '${pageContext.request.contextPath}/admin/downloadComplain?id=${bean.complainId}'">Download File</button>
					</div>
					</div>
				</div>
				
			  </c:forEach>
			  </c:when>
			  <c:otherwise>
			    
			    	<div class="card justify-content-center">
					<div class="card-header">
					   No Data
					</div>
					<div class="card-body">
						<h1>There are no complains yet</h1>
					</div>
					</div>	    
			  </c:otherwise>
			  </c:choose>

            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <jsp:include page="/resources/adminParts/adminFooter.jsp" />

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

 <jsp:include page="/resources/adminParts/adminScripts.jsp" />
 
 <script>
 
 $(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#cards").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
 
 </script>
</body>
</html>
