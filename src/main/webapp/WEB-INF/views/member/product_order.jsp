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


<link rel="stylesheet" type="text/css" href="../../../css/product_order.css">








<script type="text/javascript">

   function page_form(p_idx){
     
     // PhotoModifyFormAction
     location.href="../product/page_list.do?p_idx=" + p_idx;
     
  }
  


</script>
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
                    <span class="no_tit">order manager</span>
                    <h4 class="tit">주문내역</h4>
                   
                </div>
              
                <div class="order_process_list">
                    <div class="ord_process n1">
                        <div class="connect n0">

                           <ul>
                            <li id="orp"  class="order_process0"><a class="order_a" href="#scroll_move"><img src="../../../images/order.svg"><span></span>주문완료</a></li>
                            <li id="orp" class="order_process1"><a href="#scroll_move"> <img src="../../../images/order2.png"><span></span>상품준비</a></li>
                            <li id="orp" class="order_process2"><a href="#scroll_move"><img src="../../../images/cart.svg"><span></span>배송중</a></li>
                            <li id="orp" class="order_process3"><a href="#scroll_move"><img src="../../../images/home.png"><span class="scroll_move"></span>배송완료</a></li>
                           </ul>
                        </div>
                    </div>

                    <ul class="ord_process n2 pay_connect">
                        <!-- <div class="tit">주문내역</div> -->
                        <li class="connect n1">
                            <div class="tit">주문내역</div>
                            <p class="txt_desc">
                             
                            </p>
                            <div class="table-responsive">
                                <table class="table " id="dataTable" width="100%" cellspacing="0">
                             
                                    <thead >                            
                                     <tr class="tr_tit" id="scroll_move">
                                         <td>날짜</td>
                                         <td>상품이름</td>
                                         <td>상품구매현황</td>
                                        
                                      </tr>
                                     </thead>
                                     <tbody>
                                       <c:if test="${ empty list }">
                                          <tr>
                                             <td colspan="10">
                                             <div id="empty_message"> 구매정보가 없습니다</div>
                                             </td>
                                          </tr> 
                                        </c:if>
                                        <c:forEach var="vo"  items="${ list }">
                                         <tr class="tr_content">
                                            <td>${ vo.pay_regdate }</td>
                                            <td>${ vo.item_name }</td>
                                            <td>주문완료</td>
                                       </tr> 
                                       </c:forEach>
      
                                  
                                    </tbody> 
      
                                 </table>
                                </a>
                            </div>
                            
                        </li>
                        <!-- <li class="connect n2">
                            <div class="tit"></div>
                            <p class="txt_desc">
                               <br class="pc_ver">
                               <br class="pc_ver">
                             
                            </p>
                        </li>
                        <li class="connect n3">
                            <div class="tit"></div>
                            <p class="txt_desc">
                              <br class="pc_ver">
                              <br class="pc_ver">
                                
                            </p>
                        </li> -->
                    </ul>
                </div>
                <p class="reduce_r"><br class="tab_min_ver mo_ver"></p>
            </div>
         
            
        </section>
</div>
</div>
<%@ include file="../main/footer.jsp" %>
</body>

</html>


