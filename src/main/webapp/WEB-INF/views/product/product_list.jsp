<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Welcome to my shop</title>
   <link href="../css/index.css?after" rel="stylesheet" />


   
   <!-- Bootstrap3.x 설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>




<link rel="stylesheet" type="text/css" href="../../../finalcss/font-awesome.css">

<link rel="stylesheet" href="../../../finalcss/templatemo-hexashop.css">






<script type="text/javascript">

   function page_form(p_idx){
     
     // PhotoModifyFormAction
     location.href="../product/page_list.do?p_idx=" + p_idx;
     
  }
  


</script>


</head>

<body>

  <input type="hidden" name="p_idx"  value="${ vo.p_idx }">
  <%@ include file="../main/header.jsp" %>
  <h5 style="text-align: center;
             font-size: 40px; font-weight: bold; margin-bottom: 30px;" > </h5>
  
                    
  <div class="header-area header-sticky">
         
    <nav class="main-nav">
   
    <!-- ***** Menu Start ***** -->
    <ul class="nav">
        <li class="scroll-to-section"><a  href="/product/list.do">ALL</a></li>

        <li class="submenu">
            <a href="javascript:;">완속충전방식</a>
            
            <ul>
                <c:forEach var="category" items="${category_list}">
                    <c:if test="${ category.category_code eq 1 }">   
                        <li><a href="list.do?category_idx=${category.category_idx}">${category.category_name} </a></li>
                    </c:if>
                </c:forEach>
            </ul>
        </li>

        <li class="submenu">
            <a href="javascript:;">급속충전방식</a>
            <ul>
                <c:forEach var="category" items="${category_list}">
                    <c:if test="${ category.category_code eq 2 }">   
                        <li><a href="list.do?category_idx=${category.category_idx}">${category.category_name} </a></li>
                    </c:if>
                </c:forEach>
            </ul>
        </li>


    </ul>        
    <a class='menu-trigger'>
        <span>Menu</span>
    </a>


</nav>

               
</div>


<!---->

      <!--  for(CategoryVo category : category_list)  -->
      <div class="container">

        <section class="wrapper">

            <div class="sidebar">

                <!--
                    
                -->
                

                
                <div id="box">
                    <!-- 로그인/로그아웃 -->

                    <div style="text-align: right;">
                        <!-- If you are not logged in as a seller -->
                        <c:if test="${empty sessionScope.owner}">
                            <div class="writeBtnBox">
                                <button class="writeBtn" onclick="location.href='../owner/login_form.do'">판매자로그인<span
                                        class="arrow">></span></button>
                            </div>
                            <div class="writeBtnBox">
                                <button class="writeBtn" onclick="location.href='../owner/insert_form.do'">판매자회원가입<span
                                        class="arrow">></span></button>
                            </div>
                    </c:if>

                        <!-- owner login  -->
                        <c:if test="${not empty sessionScope.owner}">
                            <div class="writeBtnBox">

                                <!--
                                <button class="writeBtn" onclick="location.href='../owner/logout.do'">Log out <span
                                        class="arrow">></span></button>
                                -->

                                <div class="writeBtnBox">
                                    <button class="writeBtn" onclick="location.href='insert_form.do'">상품등록<span
                                            class="arrow">></span></button>
                                </div>
                                <div class="writeBtnBox">
                                    <button class="writeBtn"
                                            onclick="location.href='../owner/my_product_list.do?o_idx=${sessionScope.owner.o_idx}'">판매관리
                                        <span class="arrow">></span></button>
                                </div>
                            </div>
                            <b>${sessionScope.owner.o_name}</b> 판매자님
                        </c:if>
                        <!-- user login-->
                      
                    </div>
                </div>
            </nav>
            </div>
            
            <div class="itemWrap">
              <c:forEach var="vo" items="${list}">
                  <div class="item" onclick="page_form('${vo.p_idx}');">
                     
                    <div class="imgBox">
                          <img src="../upload/${vo.p_image_l}" alt="${vo.p_name}">
                      </div>

                      <div class="textBox">
                          <p class="textBox__name">${vo.p_name}</p>
                          <p class="textBox__price">${vo.p_price}</p>
                      </div>
                  </div>
              </c:forEach>
          </div>

        </section>


    </div>
    

  




  

    <!-- Bootstrap -->
  
   

    <!— Plugins —>
  

  


    
    <!— Global Init —>
    <script src="../../../finaljs/custom.js"></script>
</body>

</html>


