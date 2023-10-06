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
		   onclick="location.href='my_product_list.do?o_idx=${sessionScope.owner.o_idx}'">
			   <div class="sidebar-brand-icon rotate-n-15">
				   <i class="fas fa-laugh-wink"></i>
			   </div>
			   <div class="sidebar-brand-text mx-3">상품페이지</div>
		   </a>

		   <!-- Divider -->
		   <hr class="sidebar-divider my-0">

		   <!-- Nav Item - Dashboard -->
		   <li class="nav-item active">
			   <a class="nav-link" href="owner_chart.do">
				   <i class="fas fa-fw fa-tachometer-alt"></i>
				   <span>MAIN</span></a>
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
				   <span>결제관리</span>
			   </a>
			   <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
				   data-parent="#accordionSidebar">
				   <div class="bg-white py-2 collapse-inner rounded">
					   <h6 class="collapse-header">member grade</h6>
					   <a class="collapse-item" id="" href="owner_pay_list.do">결제내역</a>
					  
					 
				   </div>
			   </div>
		   </li>

		   

	   </ul>


	<!— End of Topbar —>
</body>


</html>