<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
            <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="../../../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
	href="../../../resources/https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../../../resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="../../../resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">


</head>
<body>
	     <!-- Topbar -->
		 <nav
		 class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

		 <!-- Sidebar Toggle (Topbar) -->
		 <button id="sidebarToggleTop"
			 class="btn btn-link d-md-none rounded-circle mr-3">
			 <i class="fa fa-bars"></i>
		 </button>

		  <!-- Topbar Search -->
		<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
		 <div class="input-group">
			 <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
				 aria-label="Search" aria-describedby="basic-addon2">
			 <div class="input-group-append">
				 <button class="btn btn-primary" type="button">
					 <i class="fas fa-search fa-sm"></i>
				 </button>
			 </div>
		 </div>
	 </form>


		 <!-- Topbar Navbar -->
		 <ul class="navbar-nav ml-auto">


			 <div class="topbar-divider d-none d-sm-block"></div>

			 <!-- Nav Item - User Information -->
			 <li class="nav-item dropdown no-arrow">
				 <a class="nav-link dropdown-toggle" href="#" id="userDropdown"
					 role="button" data-toggle="dropdown" aria-haspopup="true"
					 aria-expanded="false">

					 <span class="mr-2 d-none d-lg-inline text-gray-600 small">
						 <c:if test="${ empty sessionScope.owner }">
							 <input class="btn btn-primary" type="button" value="로그인"
								 onclick="location.href='login_form.do'">
						 </c:if>

						 <!-- 로그인 된경우 -->
						 <c:if test="${ not empty sessionScope.owner }">
							 <b>${ owner.o_name }</b>판매자님 환영합니다
							 <input class="btn btn-primary" type="button" value="로그아웃"
								 onclick="location.href='logout.do'">
						 </c:if>
					 </span>

				 </a>

			 </li>

		 </ul>

	 </nav>
	<!-- End of Topbar -->
</body>
  <!-- End of Content Wrapper -->
            <!-- Bootstrap core JavaScript-->
            <script src="../../../resources/vendor/jquery/jquery.min.js"></script>
            <script src="../../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

            <!-- Core plugin JavaScript-->
            <script src="../../../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

            <!-- Custom scripts for all pages-->
            <script src="../../../resources/js/sb-admin-2.min.js"></script>

            <!-- Page level plugins -->
            <script src="../../../resources/vendor/datatables/jquery.dataTables.min.js"></script>
            <script src="../../../resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

            <!-- Page level custom scripts -->
            <script src="../../../resources/js/demo/datatables-demo.js"></script>

</html>