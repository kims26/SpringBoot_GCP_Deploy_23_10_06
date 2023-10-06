<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix='c'    	uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt'  	uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn'		uri='http://java.sun.com/jsp/jstl/functions' %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="../css/index.css?after" rel="stylesheet" />


       <!-- Bootstrap3.x 설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



<script type="text/javascript">

var global_p_idx;//전역변수
 var global_p_filename;
  function show_popup(p_idx){
	  
	  global_p_idx = p_idx;
	  
	  var window_width = $(window).width();   //browser폭
	  var popup_width  = $("#popup").width(); //popup폭
	  //alert(window_width + " / " + popup_width );
	  
	  //팝업윈도우가 중앙에 올수 있도록 left위치 계산
	  var left = window_width/2 - popup_width/2;
	  $("#popup").css("left", left);
	  $("#popup").show();
	  
	  //alert(p_idx+"에 대한 자료를 Ajax통해서 요청");
	  
	  $.ajax({
		  url		:	"product_one.do",      //PhotoOneAction
		  data		:	{"p_idx" : p_idx },
		  dataType	: "json",
		  success	: function(res_data){
			  
			  //이미지 출력
			  //  <img src="">
			  $("#popup > img").attr("src", "../upload/" + res_data.p_filename);
			  
			  $("#content").html(res_data.p_content);
			  			  
			  var date = "최초 : " + res_data.p_regdate + 
			             "<br>수정 : " + res_data.p_modifydate;
			  $("#regdate").html(date);
			  
			  $("#o_idx").html("회원번호:" + res_data.o_idx);
		  },
		  error		: function(err){
			  
			  alert(err.responseText);
			  
		  }
		  
	  });
	  
  }//end:show_popup()

  
  function del_product(p_idx){
	  
    

	  if(confirm("정말 삭제하시겠습니까?")==false)return;
	
    location.href="../product/delete.do?p_idx="+p_idx ;
    
  }

   //수정폼 띄우기
   function modify_form(p_idx){
	  
	  // PhotoModifyFormAction
	  location.href="../product/modify_form.do?p_idx=" + p_idx;
	  
  }


</script>


</head>


<body>

  

  <input type="hidden" name="p_idx"  value="${ vo.p_idx }">
 

<%@ include file="../main/header.jsp" %>
  <h5 style="    text-align: center;
             font-size: 40px; font-weight: bold; margin-bottom: 30px;" > 판매관리 </h5>

      <div class="container">
        <section class="wrapper">
          <div class="sidebar">
            <nav class="mainMenu">
              <ul>
                <c:forEach var="category" items="${category_list}">
                    <li><a href="owner/list.do?category_idx=${category.category_idx}">${category.category_name} </a></li>
                </c:forEach>
                <li><a href="">세일 상품</a></li>
            </ul>
            </nav>
    
      <div id="box">
    
             <!-- 로그인/로그아웃  -->
             <div style="text-align: right;">
                 <!-- 로그인 안된경우 -->
                 <c:if test="${ empty sessionScope.owner }">
                    <div class="writeBtnBox">
                    <button class="writeBtn" onclick="location.href='../owner/login_form.do'">로그인 <span class="arrow">></span></button>
                    <div class="writeBtnBox">
                      <button class="writeBtn" onclick="location.href='../owner/insert_form.do'">회원가입 <span class="arrow">></span></button>
                    </div>
                  </div>
                 </c:if>
    
                 <!-- 로그인 된경우 -->
                 <c:if test="${ not empty sessionScope.owner }">
    
                    <div class="writeBtnBox">
                    <button class="writeBtn" onclick="location.href='../owner/owner_chart.do'">판매량 확인 <span class="arrow">></span></button>
    
                    <div class="writeBtnBox">
                      <button class="writeBtn" onclick="location.href='../product/insert_form.do'">상품 등록 <span class="arrow">></span></button>
                    </div>
                    <div class="writeBtnBox">
                      <button class="writeBtn" onclick="location.href='../owner/my_product_list.do?o_idx=${owner.o_idx}'">판매 관리 <span class="arrow">></span></button>
                    </div>
                    
                    <div class="writeBtnBox">
                      <button class="writeBtn" onclick="location.href='../product/list.do'">메인으로 <span class="arrow">></span></button>
                    </div>
                    <!-- <div class="writeBtnBox">
                      <button class="writeBtn" onclick="location.href='../owner/modify_form.do?o_idx=${owner.o_idx}'">마이페이지 <span class="arrow">></span></button>
                    </div> -->
                    
                  </div>
                  <b>${ owner.o_name }</b>판매자님 환영합니다
                 </c:if>
             </div>
             </div>
            </div>
    
    
            <div class="itemWrap">
    
               <!-- Data가 없는경우 -->
             <c:if test="${ empty list }">
              <div id="empty_message">판매 등록 해주세요</div>
          </c:if>

          <%-- <c:forEach begin="1"  end="20"> --%>
                       
            <c:forEach var="vo"  items="${ list }" >
             <div class="item">
               <div class="imgBox">
           <img src="../upload/${ vo.p_image_l }" >
           
              </div>
              

               <div class="textBox">
                <p > 
                  <input class="textBox__del" type="button" value="X"onclick="del_product(${vo.p_idx});"> 
                  <input class="textBox__del" type="button" value="수정"onclick="modify_form(${vo.p_idx});"> 
                  </p> 
                 <p class="textBox__name">${vo.p_name}</p>
                 <p class="textBox__price">${vo.p_price}</p>
               </div>
               
             </div>
            </c:forEach>
          </div>

          </section>
       </div>
    
      

</body>
</html>
