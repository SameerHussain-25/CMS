<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminPanel 3 | Dashboard</title>
  
  <jsp:include page="/resources/adminParts/adminCSS.jsp" />
  
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

 <jsp:include page="/resources/adminParts/adminNav.jsp" />
 <jsp:include page="/resources/adminParts/adminSidebar.jsp" />

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
                <h3 class="card-title">Students Data</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped" aria-describedby="DataTable">
                  <thead>
                  <tr>
                    <th scope="header_table">Student ID</th>
                    <th scope="header_table">Student Name</th>
                    <th scope="header_table">Father Name</th>
                    <th scope="header_table">Surname</th>
                    <th scope="header_table">Religion</th>
                    <th scope="header_table">Country</th>
                    <th scope="header_table">Gender</th>
                    <th scope="header_table">Roll No</th>
                    <th scope="header_table">Department</th>
                    <th scope="header_table">Program</th>
                    <th scope="header_table">Batch</th>
                  </tr>
                  </thead>
                  <tbody>
                  
                  <c:if test="${list != null}">
                  
                  <c:forEach var="bean" items="${list}">
                  
	                  <tr>
	                 	<td>${bean.stdId}</td>
	                 	<td>${bean.name}</td>
	                 	<td>${bean.fatherName}</td>
	                 	<td>${bean.surname}</td>
	                 	<td>${bean.religion}</td>
	                 	<td>${bean.country}</td>
	                 	<td>${bean.gender}</td>
	                 	<td>${bean.rollNum}</td>
	                 	<td>${bean.department}</td>
	                 	<td>${bean.program}</td>
	                 	<td>${bean.batch}</td>
	                  </tr>
                  
                  </c:forEach>
                  </c:if>
                  </tbody>
                  <tfoot>
                  <tr>
                    <th scope="footer_table">Student ID</th>
                    <th scope="footer_table">Student Name</th>
                    <th scope="footer_table">Father Name</th>
                    <th scope="footer_table">Surname</th>
                    <th scope="footer_table">Religion</th>
                    <th scope="footer_table">Country</th>
                    <th scope="footer_table">Gender</th>
                    <th scope="footer_table">Roll No</th>
                    <th scope="footer_table">Department</th>
                    <th scope="footer_table">Program</th>
                    <th scope="footer_table">Batch</th>
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
