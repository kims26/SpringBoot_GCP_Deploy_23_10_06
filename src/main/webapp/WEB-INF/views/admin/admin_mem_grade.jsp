<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt'  uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn'   uri='http://java.sun.com/jsp/jstl/functions' %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Insert title here</title>
<link href="../../../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
    href="../../../resources/https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../../../resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="../../../resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<script type="text/javascript">

    function del_mem(mem_idx){
        
        
        if(confirm("정말삭제하시겠습니까?")==false)return;
        
        location.href="../member/delete2.do?mem_idx=" + mem_idx
       
        
    }
  
  </script>
</head>


<body>
 
 <!-- Begin Page Content -->
            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">회원관리</h1>
                <p class="mb-4"></p>
 
                <!-- DataTales Example -->
                <div class="General_Grade">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">일반회원 관리</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                              
                               <thead>                            
                                  <tr>
                                     <th>회원번호</th>
                                     <th>회원명</th>
                                     <th>아이디</th>
                                     <th>비밀번호</th>
                                     <th>주소</th>
                                     <th>충전타입</th>
                                     <th>우편번호</th>
 
                                     <th>전화번호</th>
 
                                     <th>회원유형</th>
                                     <th>편집</th>
                                  </tr>
                                  </thead>
                                  <tbody>
                                  <c:if test="${ empty list }">
                                     <tr>
                                        <td colspan="10">
                                        <div id="empty_message">가입된 회원정보가 없습니다</div>
                                        </td>
                                     </tr> 
                                   </c:if>
                                   <c:forEach var="vo"  items="${ mem_list }">
                                  <tr>
 
                                  <td>${ vo.mem_idx }</td>
                                  <td>${ vo.mem_name }</td>
                                  <td>${ vo.mem_id }</td>
                                  <td>${ vo.mem_pwd }</td>
                                  <td>${ vo.mem_addr }</td>
                                  <td>${ vo.mem_type }</td>
                                  <td>${ vo.mem_zipcode }</td>
                                  <td>${ vo.mem_tel }</td>
                                  <th>일반</th>      
                                  <td>
                                  <input class="btn btn-success" type="button"  value="수정"
                                           onclick="location.href='../member/modify_form2.do?mem_idx=${ vo.mem_idx }'">
<!--                                            
                                           <input class="btn btn-danger"  type="button"  value="삭제"
                                           onclick="del_mem('${ vo.mem_idx }');"  > -->
                                           <input class="btn btn-danger"  type="button"  value="삭제"
                                           onclick="del_mem('${ vo.mem_idx }');"  >
                                  </td>
                                  </tr> 
                                  </c:forEach>
 
                            
                               </tbody> 
 
                            </table>
                        </div>
                    </div>
                </div>
          </div>   
       </div>

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