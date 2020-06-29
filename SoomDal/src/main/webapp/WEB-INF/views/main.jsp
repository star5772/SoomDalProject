<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<title>SoomDal</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">  
<!-- Bootstrap core CSS -->
<link type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link type="text/css" href="${pageContext.request.contextPath}/resources/css/modern-business.css" rel="stylesheet">
<link rel="stylesheet" href="/dal/css/main.css">
<style>
#main .container-fluid{
	overflow: auto;
}
#footer {
	clear: both;
}
</style>
</head>

<body>
<div id="page">
  <header>
	<jsp:include page="include/header.jsp"/>
  </header>
  
  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-md navbar-dark bg-light fixed-top" style="height: 100px;">
	<jsp:include page="include/nav.jsp"/>
  </nav>
  
  <div id="main">	
	  <section class="container-fluid">
	  	<jsp:include page="${viewName}"/>
	  </section>
  </div>
  <!-- Footer -->
  <footer class="py-4 bg-light" id="footer">
  	<div class="container-fluid">
		<jsp:include page="include/footer.jsp"/>
	</div>
  </footer>
</div>
  <!-- Bootstrap core JavaScript -->
  <script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
  <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
</body>

</html>
