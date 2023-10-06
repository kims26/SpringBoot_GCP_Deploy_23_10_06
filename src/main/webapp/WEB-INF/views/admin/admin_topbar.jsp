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

		


		 <!-- Topbar Navbar -->
		 <ul class="navbar-nav ml-auto">


			 <div class="topbar-divider d-none d-sm-block"></div>

			 <!-- Nav Item - User Information -->
			 <li class="nav-item dropdown no-arrow">
				 <a class="nav-link dropdown-toggle" href="#" id="userDropdown"
					 role="button" data-toggle="dropdown" aria-haspopup="true"
					 aria-expanded="false">

					 <span class="mr-2 d-none d-lg-inline text-gray-600 small">
						 <c:if test="${ empty sessionScope.admin_user }">
							 <input class="btn btn-primary" type="button" value="로그인"
								 onclick="location.href='login_form.do'">
						 </c:if>

						 <!-- 로그인 된경우 -->
						 <c:if test="${ not empty sessionScope.admin_user }">
							 <b style="color: #4D72DE;">${ admin_user.admin_name }</b>님 환영합니다
							 <input class="btn btn-primary" type="button" style="margin-left: 15px;" value="로그아웃"
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