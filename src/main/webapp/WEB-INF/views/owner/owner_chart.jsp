<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
            <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>

                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="UTF-8">
                    <meta http-equiv="X-UA-Compatible" content="IE=edge">
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                    <meta name="description" content="">
                    <meta name="author" content="">
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

                                    <!-- Content Row -->
                                    <div class="container-fluid">

                                    <div class="row">

                                        <div class="col-xl-8 col-lg-7">

                                            <!-- Area Chart -->
                                            <div class="card shadow mb-4">
                                                <div class="card-header py-3">
                                                    <h6 class="m-0 font-weight-bold text-primary">주문/배송</h6>
                                                </div>
                                                <div class="card-body">
                                                    <div class="chart-area">
                                                        <canvas id="myAreaChart"></canvas>
                                                    </div>
                                                 
                                                </div>
                                            </div>

                                            <!-- Bar Chart -->
                                            <div class="card shadow mb-4">
                                                <div class="card-header py-3">
                                                    <h6 class="m-0 font-weight-bold text-primary">리뷰 관리</h6>
                                                </div>
                                                <div class="card-body">
                                                    <div class="chart-bar">
                                                        <canvas id="myBarChart"></canvas>
                                                    </div>
                                                  
                                                </div>
                                            </div>

                                        </div>

                                        <!-- Donut Chart -->
                                        <div class="col-xl-4 col-lg-5">
                                            <div class="card shadow mb-4">
                                                <!-- Card Header - Dropdown -->
                                                <div class="card-header py-3">
                                                    <h6 class="m-0 font-weight-bold text-primary">클레임/정산</h6>
                                                </div>
                                                <!-- Card Body -->
                                                <div class="card-body">
                                                    <div class="chart-pie pt-4">
                                                        <canvas id="myPieChart"></canvas>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                 </div>
                             </div>
                        </div>
                                <!-- End of Main Content -->

                                <%@ include file="/WEB-INF/views/admin/admin_footer.jsp" %>
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
            <script src="../../../resources/vendor/chart.js/Chart.min.js"></script>

            <!-- Page level custom scripts -->
            <script src="../../../resources/js/demo/chart-area-demo.js"></script>
            <script src="../../../resources/js/demo/chart-pie-demo.js"></script>
            <script src="../../../resources/js/demo/chart-bar-demo.js"></script>
            
            <!-- <script>

                const admin = document.querySelector('#genreH').value.split(", "); //카테고리 별 조회수 값
                const hitArr2 = new Array();
                const genreArr = new Array();
                /* 배열에 장르 정보, 조회수 정보만 뽑아옴 */
                gen.forEach(function(data){
                    if(data.indexOf('hit') != -1){
                        hitArr2.push(data.split(" : ")[1]);
                    }
                    if(data.indexOf('genre_name') != -1){
                        genreArr.push(data.split(" : ")[1]);
                    }
                })

            </script> —>

        

                </html> 