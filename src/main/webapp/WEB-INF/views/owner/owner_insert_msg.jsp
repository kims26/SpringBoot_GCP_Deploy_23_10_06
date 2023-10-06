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
   <link rel="stylesheet" type="text/css" href="../css/main_header.css">
   <link rel="stylesheet" type="text/css" href="../../../css/m_menu.css">

   <link rel="stylesheet" type="text/css" href="../css/main_footer.css">
   <link rel="stylesheet" type="text/css" href="../css/main.css">
   <link rel="stylesheet" type="text/css" href="../css/search.css">
   <link rel="stylesheet" type="text/css" href="../css/search_responsive.css">
   <link rel="stylesheet" type="text/css" href="../../../css/responsive.css">

   
   <!-- Bootstrap3.x 설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<link rel="stylesheet" type="text/css" href="../../../css/owner_insert_msg.css">



<script>
  $(function () {
	$('li#orp > a').click(function (){
    	$('html, body').animate({scrollTop: $(this.hash).offset.top}, 300);
        
    });
   

});
  </script>

</head>
<style>

    * {

    scroll-behavior:smooth;

    }

</style>
<body>


  <%@ include file="../main/header.jsp" %>
  <div class="order">
    <div class="inner">
        <section class="section">
            <div class="ord_manage_box">
                <div class="txt_box" >
                    <span class="no_tit">Join message</span>
                    <h4 class="tit">판매자님 회원가입을 축하합니다!</h4>
                   
                </div>
              
                <div class="order_process_list">
                    <div class="ord_process n1">
                        <div class="connect n0">
                            <div class="product_order_list">
                                <div class="order_list_tit">
                       
                            <h2 class="s_tit">관리자 승인 후 판매 서비스 이용이 가능합니다.</h2>
                            <p class="contxt">좋은 서비스를 위하여 항상 노력하겠습니다.</p>
                       </div>
                                <div class="con_service_btn">
                                <a href="../main/main.do" class="btn f_b" target="_blank">
                                    <span class="txt">Main</span>
                                    <span class="icon"></span>
                                </a>
                                </div>
                        
                            

                          
                       
                        </div>
                    </div>

                
                </div>
                <p class="reduce_r"><br class="tab_min_ver mo_ver"></p>
            </div>
         
            
        </section>
</div>
</div>
<%@ include file="../main/footer.jsp" %>
</body>

</html>


