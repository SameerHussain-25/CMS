<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
response.setHeader("cache-control", "no-store");
%>
<jsp:include page="/resources/adminParts/adminCSS.jsp">
 	
 	 <jsp:param name="listComplain" value="yes"/>
 	 <jsp:param name="file" value="Dashboard"/>
 	
 </jsp:include>
 <jsp:include page="/resources/adminParts/adminNav.jsp" />
 <jsp:include page="/resources/adminParts/adminSidebar.jsp">
 	
 	<jsp:param name="dashboard" value="active"/>
 
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

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
      	
      	  <jsp:include page="/resources/adminParts/adminColorBox.jsp" />
        
          <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title" style="font-family: Arial Black;">CMS Registerd Students Data</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped" aria-describedby="DataTable">
                  <thead>
                  <tr>
                    <th scope="header_table">Student Reg ID</th>
                    <th scope="header_table">Student Name</th>
                    <th scope="header_table">CNIC number</th>
                    <th scope="header_table">Login Username</th>
                    <th scope="header_table">Password</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:if test="${list2 != null}">
            
                  <c:forEach var="bean" items="${list2}">
	                  <tr>
	                 	<td>${bean.stdRegId}</td>
	                 	<td>${bean.stdName}</td>
	                 	<td>${bean.cnic}</td>
	                 	<td>${bean.logId}</td>
	                 	<td>${bean.password}</td>
	                  </tr>
                  
                  </c:forEach>
                  </c:if>
                  </tbody>
                  <tfoot>
                  <tr>
               <th scope="header_table">Student Reg ID</th>
                    <th scope="header_table">Student Name</th>
                    <th scope="header_table">CNIC number</th>
                    <th scope="header_table">Login Username</th>
                    <th scope="header_table">Password</th>
                  </tr>
                  </tfoot>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
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
</body>
</html>
