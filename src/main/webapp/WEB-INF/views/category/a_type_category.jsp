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


<script type="text/javascript">

   function page_form(p_idx){
	  
	  // PhotoModifyFormAction
	  location.href="../product/page_list.do?p_idx=" + p_idx;
	  
  }
  


</script>




</head>

<body>

  <input type="hidden" name="p_idx"  value="${ vo.p_idx }">

  <section class="mainBanner">
    <h1 class="text">
     A-Type
    </h1>
  </section>

  <div class="container">
    <section class="wrapper">
      <div class="sidebar">
        <nav class="mainMenu">
          <ul>
            <li><a href="/product/list.do">All Items</a></li>
            <li><a href="">Best Items</a></li>
            <li><a href="/category/a_type_list.do">A-Type</a></li>
            <li><a href="/category/b_type_list.do">B-Type</a></li>
            <li><a href="/category/c_type_list.do">C-Type</a></li>
            <li><a href="">세일 상품</a></li>
          </ul>
        </nav>
        <div id="box">

          <!-- 로그인/로그아웃  -->
          <div style="text-align: right;">
              <!-- 로그인 안된경우 -->
              <c:if test="${ empty sessionScope.user }">
                 <div class="writeBtnBox">
                 <button class="writeBtn" onclick="location.href='../owner/login_form.do'">로그인 <span class="arrow">></span></button>
                 <div class="writeBtnBox">
                   <button class="writeBtn" onclick="location.href='../owner/insert_form.do'">회원가입 <span class="arrow">></span></button>
                 </div>
               </div>
              </c:if>
 
              <!-- 로그인 된경우 -->
              <c:if test="${ not empty sessionScope.user }">
 
                 <div class="writeBtnBox">
                 <button class="writeBtn" onclick="location.href='../owner/logout.do'">로그아웃 <span class="arrow">></span></button>
 
                 <div class="writeBtnBox">
                   <button class="writeBtn" onclick="location.href='insert_form.do'">상품 등록 <span class="arrow">></span></button>
                 </div>
                 <div class="writeBtnBox">
                   <button class="writeBtn" onclick="location.href='../owner/my_product_list.do?o_idx=${user.o_idx}'">판매 관리 <span class="arrow">></span></button>
                 </div>
               </div>
               <b>${ user.o_name }</b>판매자님 환영합니다
              </c:if>
 
 
              
          </div>
          </div>
         </div>
         

        <c:forEach var="vo"  items="${ list }">
          
        <div class="itemWrap" onclick="page_form('${ vo.p_idx }');">
       
        <div class="item">
          
          <div class="imgBox">
            <img src="../upload/${ vo.p_image_l }" >
          </div>
          <div class="textBox">
            <p class="textBox__name">${vo.p_name}</p>
            <p class="textBox__price">${vo.p_price}</p>
        </div>
        </div>
      </div>
      </c:forEach>
    
    </section>
 </div>

 
</body>

</html>

