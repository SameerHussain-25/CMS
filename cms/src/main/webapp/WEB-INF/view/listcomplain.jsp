<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

@
keyframes swing { 0% {
	transform: rotate(0deg);
}

10








%
{
transform








:








rotate






(








10deg








)






;
}
30








%
{
transform








:








rotate






(








0deg








)






;
}
40








%
{
transform








:








rotate






(








-10deg








)






;
}
50








%
{
transform








:








rotate






(








0deg








)






;
}
60








%
{
transform








:








rotate






(








5deg








)






;
}
70








%
{
transform








:








rotate






(








0deg








)






;
}
80








%
{
transform








:








rotate






(








-5deg








)






;
}
100








%
{
transform








:








rotate






(








0deg








)






;
}
}
@
keyframes sonar { 0% {
	transform: scale(0.9);
	opacity: 1;
}

100








%
{
transform








:








scale






(








2








)






;
opacity








:








0






;
}
}
body {
	font-size: 0.9rem;
}

.nav-link {
	color: white !important;
}

.nav-link:hover {
	color: #4180cb !important;
}

#inputGroupFileAddon01 {
	height: 36px;
}
</style>
</head>
<body class="main_body">

	<%
		response.setHeader("cache-control", "no-store");
	%>

	<div class="d-flex" id="wrapper">

		<jsp:include page="/resources/parts/side-nav.html" />

		<!-- Page Content -->
		<div id="page-content-wrapper">

			<jsp:include page="/resources/parts/topnav.jsp" />

			<div class="container-fluid">
				<c:choose>
					<c:when test="${complains != null}">
						<c:forEach var="bean" items="${complains}">

							<div class="card justify-content-center">
								<div class="card-header">${bean.datetime}</div>
								<div class="card-body">
									<h5 class="card-title">Complain Text</h5>
									<p class="card-text">${bean.complain}</p>
								</div>

								<c:set var="catId" value="${bean.complainCatId}" />
								<c:set var="stdRegId" value="${bean.stdRegId}" />

								<%
									try {

									int catId = (Integer) pageContext.getAttribute("catId");
									int stdId = (Integer) pageContext.getAttribute("stdRegId");

									java.util.ArrayList<String> values = model.CMSDbManager.getComplainCategoryByComplainCatIdAndStdRegId(catId, stdId);

									pageContext.setAttribute("category", values.get(1));
									pageContext.setAttribute("studentName", values.get(0));

								} catch (Exception e) {
									e.printStackTrace();
								}
								%>

								<ul class="list-group list-group-flush">
									<li class="list-group-item">Name: <strong>${studentName}</strong></li>
									<li class="list-group-item">Complain About:<strong>${category}</strong></li>
									</li>
								</ul>
								<div class="card-body">
									<a href="#" class="card-link">Card link</a> <a href="#"
										class="card-link">Another link</a>
									<div class="text-right">
										<c:choose>
											<c:when test="${bean.status == 0}">
												
												<i class="fas fa-eye-slash fa-lg" style="color:red;"></i>
											
											</c:when>
											<c:otherwise>

												<i class="fas fa-eye fa-lg"  style="color:green;"></i>

											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>

						</c:forEach>
					</c:when>
					<c:otherwise>

						<div class="card justify-content-center">
							<div class="card-header">No Data</div>
							<div class="card-body">
								<h1>There are no complains yet</h1>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<jsp:include page="/resources/parts/footer.html" />
			<!-- /#page-content-wrapper -->

		</div>
		<!-- /#wrapper -->

	</div>

	<script src="${pageContext.request.contextPath}/resources/js/js.js"></script>

</body>
</html>
