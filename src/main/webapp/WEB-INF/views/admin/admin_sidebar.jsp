<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
            <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>





</head>
<body>
	
		   <!-- Sidebar -->
		   <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
		   id="accordionSidebar">

		   <!-- Sidebar - Brand -->
		   <a class="sidebar-brand d-flex align-items-center justify-content-center"
			   href="../admin/list.do">
			   <div class="sidebar-brand-icon rotate-n-15">
				   <i class="fas fa-laugh-wink"></i>
			   </div>
			   <div class="sidebar-brand-text mx-3"> Admin</div>
		   </a>

		   <!-- Divider -->
		   <hr class="sidebar-divider my-0">

		   <!-- Nav Item - Dashboard -->
		   <li class="nav-item active">
			   <a class="nav-link" href="../admin/list.do">
				   <i class="fas fa-fw fa-tachometer-alt"></i>
				   <span>Manu</span></a>
		   </li>

		   <!-- Divider -->
		   <hr class="sidebar-divider">

		   <!-- Heading -->
		   <div class="sidebar-heading">
			   회원관리
		   </div>

		   <!-- Nav Item - Pages Collapse Menu -->
		   <li class="nav-item">
			   <a class="nav-link collapsed" href="" data-toggle="collapse"
				   data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
				   <i class="fas fa-fw fa-cog"></i>
				   <span>회원관리</span>
			   </a>
			   <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
				   data-parent="#accordionSidebar">
				   <div class="bg-white py-2 collapse-inner rounded">
					   <h6 class="collapse-header">member grade</h6>
					   <a class="collapse-item" id="" href="../admin/admin_mem_grade_list.do">일반회원</a>
					   <a class="collapse-item" href="../admin/admin_o_grade_list.do">판매자회원</a>
				   </div>
			   </div>
		   </li>

		   <!-- Nav Item - Utilities Collapse Menu -->
		   <li class="nav-item">
			   <a class="nav-link collapsed" href="" data-toggle="collapse"
				   data-target="#collapseUtilities" aria-expanded="true"
				   aria-controls="collapseUtilities">
				   <i class="fas fa-fw fa-wrench"></i>
				   <span>관리자</span>
			   </a>
			   <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
				   data-parent="#accordionSidebar">
				   <div class="bg-white py-2 collapse-inner rounded">
					   <h6 class="collapse-header">master grade</h6>
					   <a class="collapse-item" href="../admin/admin_grade_list.do">관리자리스트</a>
					   <a class="collapse-item" href="../admin/insert_form.do">관리자추가</a>
					
				   </div>
			   </div>
		   </li>


	   </ul>


	<!-- End of Topbar -->
</body>


</html>