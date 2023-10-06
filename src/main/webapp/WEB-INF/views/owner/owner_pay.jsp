<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
            <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>

                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="UTF-8">
                   
                    <title>Insert title here</title>
                     <!-- Custom fonts for this template -->
                    <link href="../../../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
                    <link
                        href="../../../resources/https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
                        rel="stylesheet">

                    <!-- Custom styles for this template -->
                    <link href="../../../resources/css/sb-admin-2.min.css" rel="stylesheet">

                    <!-- Custom styles for this page -->
                    <link href="../../../resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

                </head>


                <body id="page-top">
                  
                   
            <script src="../../../resources/vendor/jquery/jquery.min.js"></script>
                    <c:if test="${empty sessionScope.owner.o_idx }">
                        <script type="text/javascript">

                            $(document).ready(function service() {

                                alert("로그인 후 이용가능한 페이지입니다.");
                                location.href = "${cpath}/owner/login_form.do";

                            })
                        </script>

                    </c:if>
                    <c:if test="${ not empty sessionScope.owner.o_idx }">
                        <!-- Page Wrapper -->
                        <div id="wrapper">
                            <%@ include file="/WEB-INF/views/owner/owner_sidebar.jsp" %>

                            <!-- Content Wrapper -->
                            <div id="content-wrapper" class="d-flex flex-column">

                                <!-- Main Content -->
                                <div id="content">

                                    <%@ include file="/WEB-INF/views/owner/owner_topbar.jsp" %>

                                  
                                    <%@ include file="/WEB-INF/views/owner/owner_pay_succ.jsp" %>
                                    
                                   
                                </div>

                                <!-- End of Main Content -->

                                <%@ include file="/WEB-INF/views/owner/owner_footer.jsp" %>
                            </div>
  
                            <!-- End of Page Wrapper -->

                            <!-- Scroll to Top Button-->
                            <a class="scroll-to-top rounded" href="#page-top">
                                <i class="fas fa-angle-up"></i>
                            </a>

                        




                          
                        </div>

                    </c:if>
              
                   
              
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