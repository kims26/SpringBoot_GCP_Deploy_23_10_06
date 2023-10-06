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


                <body>
                  
                   
          
                   
                 

                        
                                    <div class="container-fluid">
                            <!-- Page Heading -->
                            <h1 class="h3 mb-2 text-gray-800"></h1>
                            <p class="mb-4"></p>
                                    <div class="row">

                                        <div class="col-lg-7"   style=" margin: auto;
                                        max-width: 80%; flex: 80%; padding-top: 45px;"  >

                                            <!-- Area Chart -->
                                            <div class="card shadow mb-4">
                                                <div class="card-header py-3">
                                                    <h6 class="m-0 font-weight-bold text-primary">일별방문자</h6>
                                                </div>
                                                <div class="card-body">
                                                    <div class="chart-area">
                                                        <canvas id="myAreaChart"></canvas>
                                                    </div>
                                                 
                                                  
                                              
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-xl-8" id="co"   style=" margin: auto;
                                        max-width: 80%; flex: 80%;" >

                                            <!-- Bar Chart -->
                                            <div class="card shadow mb-4">
                                                <div class="card-header py-3">
                                                    <h6 class="m-0 font-weight-bold text-primary">일별가입자</h6>
                                                </div>
                                                <div class="card-body">
                                                    <div class="chart-bar">
                                                        <canvas id="myBarChart"></canvas>
                                                    </div>
                                                  
                                                </div>
                                            </div>


                                    
                                 </div>
                                     <!-- Donut Chart -->
                                     <div class="col-xl-4"  style=" margin: auto;
                                     max-width: 80%; flex: 80%;" >
                                         <div class="card shadow mb-4">
                                             <!-- Card Header - Dropdown -->
                                             <div class="card-header py-3">
                                                 <h6 class="m-0 font-weight-bold text-primary">판매량</h6>
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
                                <!-- End of Main Content -->


       
              
                   
              
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

            </script> -->

        

                </html> 