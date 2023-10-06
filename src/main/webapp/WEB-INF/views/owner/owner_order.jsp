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
 
 <!-- Begin Page Content -->
            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">주문목록</h1>
                <p class="mb-4"></p>
 
                <!-- DataTales Example -->
                <div class="General_Grade">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Admin 사용자관리</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                               <tfoot>
                               <thead>                            
                                <tr >
                                    <th>회원번호</th>
                                    <th>회원명</th>
                                    <th>아이디</th>
                                    <th>비밀번호</th>
                                    <th>회원유형</th>
                            
                                
                                    <th>편집</th>
                                 </tr>
                                  <!-- <c:if test="${ empty list }">
                                     <tr>
                                        <td colspan="10">
                                        <div id="empty_message">가입된 회원정보가 없습니다</div>
                                        </td>
                                     </tr> 
                                   </c:if> -->
                                   <!-- <c:forEach var="vo"  items="${ list }">
                                    <tr>
                                    
                                        <td>${ vo.admin_idx }</td>
                                        <td>${ vo.admin_name }</td>
                                        <td>${ vo.admin_id }</td>
                                        <td>${ vo.admin_pwd }</td>
                                        <td>관리자</td>
                                    
                                
                                        
                                        
                                        <td>
                                     
                                        
                                            <input class="btn btn-success" type="button"  value="수정"
                                                    onclick="location.href='admin_modify_form.do?admin_idx=${ vo.admin_idx }'">
                                                    
                                            <input class="btn btn-danger"  type="button"  value="삭제"
                                                    onclick="del('${ vo.admin_idx }');" >
                                                    
                                        
                                        </td>
                            
                                        
                                        
                                    </tr> 
                                </c:forEach> -->
 
                                </thead>
                               </tfoot> 
 
                            </table>
                        </div>
                    </div>
                </div>
          </div>   
       </div>


</body>

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