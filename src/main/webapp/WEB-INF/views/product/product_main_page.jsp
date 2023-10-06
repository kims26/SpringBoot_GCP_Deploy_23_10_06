<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>전기차 스토어 </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="../../../productimages/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="../../../productimages/favicon.ico">

    <link rel="stylesheet" href="../../../productcss/templatemo.css">
    <link rel="stylesheet" href="../../../productcss/bootstrap.min.css">
    <link rel="stylesheet" href="../../../productcss/custom.css">
    <link rel="stylesheet" href="../../../productcss/templatemo.min.css">
    <link rel="stylesheet" href="../../../productcss/slick.min.css">
    <link rel="stylesheet" href="../../../productcss/slick-theme.min.css">
    <link rel="stylesheet" href="../../../productcss/slick-theme.css">
    <link rel="stylesheet" href="../../../productcss/fontawesome.css">
    <link rel="stylesheet" href="../../../productcss/fontawesome.min.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
  
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
</head>

<body>

    <nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
        <div class="container text-light">
            <div class="w-100 d-flex justify-content-between">
                <div>
                    <i class="fa fa-envelope mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="mailto:info@company.com">2tkdgus3@company.com</a>
                    <i class="fa fa-phone mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="tel:010-020-0340">010-5032-7835</a>
                </div>
                <div>
                    <a class="text-light" href="https://fb.com/templatemo" target="_blank" rel="sponsored"><i class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://twitter.com/" target="_blank"><i class="fab fa-twitter fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://www.linkedin.com/" target="_blank"><i class="fab fa-linkedin fa-sm fa-fw"></i></a>
                </div>
            </div>
        </div>
    </nav>

    <%@ include file="../main/header.jsp" %>
    <h5 style="text-align: center;
               font-size: 40px; font-weight: bold; margin-bottom: 30px;" > </h5>
   
    <!-- Close Header -->

    <!-- Modal -->
    <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="w-100 pt-1 mb-5 text-right">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" method="get" class="modal-content modal-body border-0 p-0">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                    <button type="submit" class="input-group-text bg-success text-light">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>



    <!-- Start Banner Hero -->
    <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
        <ol class="carousel-indicators">
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="../../../productimages/12.PNG" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left align-self-center">
                                <h1 class="h1 text-success"><b>전기차</b> Store</h1>
                                <h3 class="h2">전기차 eCommerce </h3>
                                <p>
                                    현재 우리가 살고 있는 세상은 변하고 있습니다. 한때는 상상에 불과했던 미래의 비전이 우리 삶에 긍정적인 영향을 주는 현실로 다가오고 있습니다.
                                    시민들이 친환경적이고 스마트한 선택을 내릴 수 있도록 장려하고, 산업 전반에서는 소비자들에게 보다 지속 가능한 선택지를 제공하기 위한 혁신이 진행되고 있습니다.
                                   '지속가능성'을 중심으로 발전하고 있습니다. 각국 정부들은 시민들이 친환경적이고


                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="../../../productimages/9.PNG" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                <h1 class="h1">전기차 충전소</h1>
                                <h3 class="h2">Aliquip ex ea commodo consequat</h3>
                                <p>
                                    시민들이 친환경적이고 스마트한 선택을 내릴 수 있도록 장려하고, 산업 전반에서는 소비자들에게 보다 지속 가능한 선택지를 제공하기 위한 혁신이 진행되고 있습니다.
                                    You are <strong>지속가능성</strong> to re-distribute the template ZIP file in any kind of template collection websites.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="../../../productimages/atype.png" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                <h1 class="h1">전기차 충전하기</h1>
                                <h3 class="h2">충전많이하기 </h3>
                                <p>
                                    시민들이 친환경적이고 스마트한 선택을 내릴 수 있도록 장려하고, 산업 전반에서는 소비자들에게 보다 지속 가능한 선택지를 제공하기 위한 혁신이 진행되고 있습니다.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
            <i class="fas fa-chevron-left"></i>
        </a>
        <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
            <i class="fas fa-chevron-right"></i>
        </a>
    </div>
    <!-- End Banner Hero -->


    <!-- Start Categories of The Month -->
    <section class="container py-5">
        <div class="row text-center pt-3">
            <div class="col-lg-6 m-auto">
                <h1 class="h1">Categories of The Month</h1>
                <p>
                    시민들이 친환경적이고 스마트한 선택을 내릴 수 있도록 장려하고, 
                    산업 전반에서는 소비자들에게 보다 지속 가능한 선택지를 제공하기 위한 혁신이 진행되고 있습니다.
                </p>
            </div>
        </div>
                        </div>

        <div class="row">
            <div class="col-12 col-md-4 p-5 mt-3">  
                <a href="#"><img src="../../../productimages/2.PNG" class="rounded-circle img-fluid border"></a>
                
                <h5 class="text-center mt-3 mb-3">완속충전</h5>

                <p class="text-center"> <a href="../product/list.do" class="btn btn-success" >Go Shop</a></p>
              
            </div>

            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="#"><img src="../../../productimages/4.PNG" class="rounded-circle img-fluid border"></a>
                
                <h2 class="h5 text-center mt-3 mb-3">급속충전</h2>

                <p class="text-center"> <a href="../product/list.do" class="btn btn-success" >Go Shop</a></p>

            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="#"><img src="../../../productimages/8.PNG" class="rounded-circle img-fluid border"></a>
                <h2 class="h5 text-center mt-3 mb-3">급속충전</h2>
                <p class="text-center"> <a href="../product/list.do" class="btn btn-success" >Go Shop</a></p>
            </div>
        </div>
    </section>
    <!-- End Categories of The Month -->


    <!-- Start Featured Product -->
    <section class="bg-light">
        <div class="container py-5">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">
                        Products on sale</h1>
                    <p>
                        시민들이 친환경적이고 스마트한 선택을 내릴 수 있도록 장려하고, 
                        산업 전반에서는 소비자들에게 보다 지속 가능한 선택지를 제공하기 위한 혁신이 진행되고 있습니다.
                    </p>
                </div>
            </div>
            
            <div class="row">
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                   
                            <img src="../../../productimages/btype.png" alt="${vo.p_name}" class="card-img-top" >
                      
                        <div class="card-body">

                            <ul class="list-unstyled d-flex justify-content-between">

                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                </li>

                                <li class="text-muted text-right">$${vo.p_price}</li>

                            </ul>

                           
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">${vo.p_name}</a>
                            <p class="card-text">
                                시민들이 친환경적이고 스마트한 선택을 내릴 수 있도록 장려하고, 산업 전반에서는 소비자들에게 보다 지속 가능한 선택지를 제공하기 위한 혁신이 진행되고 있습니다.
                            </p>

                            <p class="text-muted">Reviews (24)</p>
                        </div>
                    </div>
                    

                    
                </div>
            </div>

        </div>
    </section>
    <!— End Featured Product —>


 
    <!— End Footer —>
    <%@ include file="../main/footer.jsp" %>
    <!— Start Script —>
    <script src="../../../js/slick.min.js"></script>
    <script src="../../../js/jquery-migrate-1.2.1.min.js"></script>
    <script src="../../../js/jquery-1.11.0.min.js"></script>
    <script src="../../../js/custom.js"></script>
    <script src="../../../js/bootstrap.bundle.min.js"></script>
    <script src="../../../js/templatemo.js"></script>
    <script src="../../../js/templatemo.min.js"></script>
    <!— End Script —>
</body>

</html>