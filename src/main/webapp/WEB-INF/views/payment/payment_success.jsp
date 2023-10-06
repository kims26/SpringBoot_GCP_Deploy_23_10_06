<%@ page language='java' contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix='c'    uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt'  uri='http://java.sun.com/jsp/jstl/fmt'%>
<%@ taglib prefix='fn'  uri='http://java.sun.com/jsp/jstl/functions'%>

<!DOCTYPE html>
<html html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문내역</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

    <link rel="stylesheet" href="../../css/create.css">
    <link rel="stylesheet" href="../../css/reset.css">
    <link rel="stylesheet" href="../../css/main.css">
    <link rel="stylesheet" href="../../css/sub.css">
    <link rel="stylesheet" href="../../css/mypage.css">
    <link rel="stylesheet" href="../../css/layout.css">
    <link rel="stylesheet" href="../../css/design.css">
    <link rel="stylesheet" href="../../css/mypage_res.css">

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link href="../css/login_page.css?after" rel="stylesheet" />

<style>
  .orderList{
    text-align: center;
  }

  .cart_btn{
	  display: inline-block;
    margin-top: 20px;
    padding: 0 31px;
    border: 1px solid #e1e1e1;
    border-radius: 3px;
    font-size: 15px;
    font-weight: bold;
    line-height: 48px;
    color: #222222;
    vertical-align: top;
	}



</style>

</head>
<body>
<%@ include file="../main/header.jsp" %>
  <h5 style="text-align: center;
             font-size: 40px; font-weight: bold; margin-bottom: 30px;" > </h5>

<main id="container" class="resultPayment">
    <div class="sub_container">
    
        <h2 class="page_title">카카오페이결제가 정상적으로 완료되었습니다.</h2>
        <hr>
            <div class="orderList">

            <!-- 구매자 배송지 정보 -->
            배송지: ${ deliveryVo.d_name} <br>
            주소:   ${ deliveryVo.d_zipcode} <br>
                    ${ deliveryVo.d_addr}<br>
            휴대폰: ${ deliveryVo.d_tel}<br>

            결제일시:     ${payment_info.approved_at}<br/>
            <!-- 주문번호:     ${payment_info.partner_order_id}<br/> -->
            상품명:       ${payment_info.item_name}<br/>
            상품수량:    ${payment_info.quantity}<br/>
            결제금액:    ${payment_info.amount.total}<br/>
            <!-- 결제방법:    ${payment_info.payment_method_type}<br/> -->
            </div>
            <div style="padding: 150px; text-align: center;">           
              <a href="../product/list.do" class="cart_btn">쇼핑 계속하기</a>
          </div>
    </div>
    


</main>
    
</body>
</html>