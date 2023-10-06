<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap3.x 설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css" href="../css/cart_payment.css">
<style>
	#form-cart{

		width: 40%;
	}

	.tit_box{
	
    font-weight: normal;
    display: flex;
    align-items: flex-end;
    justify-content: space-between;
    padding-bottom: 1.8rem;
    border-bottom: 1px solid #000;
    position: relative;
}

.tx1{

	text-align: center;
	padding: 15px;
}
.tx2{

	padding: 15px;
}
</style>



<script type="text/javascript">	

	var regular_number = /^[0-9]{1,4}$/;// 0 ~9999
	
	function modify(cart_idx){
		
		var cart_num = $("#cart_num_" + cart_idx).val();
		
		
		if(regular_number.test(cart_num)==false){
			alert('0~9999까지의 숫자만 입력하세요');
			$("#cart_num_" + cart_idx).val("");
			$("#cart_num_" + cart_idx).focus();
			return;
		}
		
		//수정
		location.href = "cart_update.do?cart_idx=" + cart_idx + "&cart_num=" + cart_num; 
		
	}
	 
	function find_addr(){
	 
	 new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            
	            // data = {"zonecode": "12345" , "address":"서울시 관악구" ,...}
	            
	            $("#d_zipcode").val(data.zonecode);
	            $("#d_addr").val(data.address);
	            
	            
	        }
	    }).open();
	 
 }//end:find_addr()
 
</script>


<script>


function send(f){
	 
	 //입력항목 체크(이름/우편번호/주소/전화번호)
	 var d_name 		= f.d_name.value.trim();	
	 var d_zipcode 		= f.d_zipcode.value.trim();
	 var d_addr 		= f.d_addr.value.trim();
     var d_tel          = f.d_tel.value.trim();
	 
	 if(d_name==''){
		 alert('이름을 입력하세요!!');
		 f.d_name.value='';
		 f.d_name.focus();
		 return;
	 }
	 
	
	 
	 if(d_zipcode==''){
		 alert('우편번호를 입력하세요!!');
		 f.d_zipcode.value='';
		 f.d_zipcode.focus();
		 return;
	 }
	 
	 if(d_addr==''){
		 alert('주소를 입력하세요!!');
		 f.d_addr.value='';
		 f.d_addr.focus();
		 return;
	 }

     if(d_tel==''){
        alert('전화번호를 입력하세요');
        f.d_tel.value='';
        f.d_tel.focus();
        return;
     }
	 
	 f.action = "../payment/cartReady";//
	 f.submit(); //전송(제출)
	 
 }


</script>

</head>
<body>
	<%@ include file="../main/header.jsp" %>
	
<form method="post">
    <input type="hidden" name="mem_idx" value="${ user.mem_idx }">
	
	<h5 style="    text-align: center;
	font-size: 40px; font-weight: bold; padding: 30px;">주문/결제</h5>





	<table align="center" width="70%" border="1"
	style="border-collapse:collapse; font-size:16pt; margin-left: 15%;"
	bordercolor="navy" cellpadding="4" cellspacing="0">
      
	

	<!-- 주문자 정보 -->
	
		<tr class="tit_box1">	
			<h3 style="margin-left: 33%;
			margin-bottom: 15px;">주문 정보 입력 | 상품주문을 위해 정보를 입력해주세요.</h3>
		</tr>	

		<div class="form-group">
			<span style="width: 15%;">이름</span>
			<input class="form-field" name="d_name" type="text" placeholder="name">
		</div>
		<div class="form-group">
			<span style="width: 15%;">우편번호</span>
			<input class="form-field" type="text" name="d_zipcode" id="d_zipcode">
			<input class="btn  btn-info" type="button"  value="검색"onclick="find_addr();" >
		</div>
		<div class="form-group">
			<span style="width: 15%;">주소</span>
			<input class="form-field" name="d_addr" id="d_addr"type="text" placeholder="address">
		</div>
		<div class="form-group">
			<span style="width: 15%;">전화번호</span>
			<input class="form-field" name="d_tel"  id="d_tel" type="text" placeholder="telnumber">
		</div>
	
		<tr style="font-weight: bold; padding: 10px; 		
	    background-color: #CDD9ED;
		border-bottom: 2px solid #E5E5E5; 
        border-top: 2px solid #E5E5E5; margin: 4px;"
		>
			<th class="tx1">제품번호</th>
			<th class="tx1" width="25%">제품명</th>
			<th class="tx1">단가</th>
			<th class="tx1" >수량</th>
			<th class="tx1">금액</th>		
		</tr>

        <!-- for(CartVo vo : list)   -->   
		<c:forEach var="vo"  items="${ payment_list }" varStatus="status">
            <input type="hidden" name="cart_idx" value="${vo.cart_idx}"> 
			<tr align="center" >
				<td style="padding: 15px;" align="center" >		
					${vo.cart_num}				
				</td>
				
				
				<td>
					<img src="../../../upload/${list2[status.index].p_image_s}" style="width: 100px;">
					${ vo.p_name }</td>
				<td>
					단가:<fmt:formatNumber value="${ vo.p_price }" />원<br>
					<font color="red">
					세일가격:<b><fmt:formatNumber value="${ vo.p_saleprice }" />원</b>
					</font>
				</td>
				<!-- 수량 조정 폼 -->
				<td>
					${ vo.cart_num }					
				</td>
				<td><fmt:formatNumber value="${ vo.amount }" />원</td>
				
			</tr>
		
		</c:forEach>
				<!-- 장바구니가 비어있는경우 -->  
				<c:if test="${ empty payment_list}">
					
							<div style="padding: 150px; text-align: center;">
								<p style="font-size: 30px; font-weight: bold;">장바구니에 담긴 상품이 없습니다.</p>
								<br>
								<p>원하시는 상품을 장바구니에 담아보세요!</p>
								<a href="../product/list.do" class="cart_btn">쇼핑 계속하기</a>
							</div>
					
				</c:if>


				<tr>
					<td class="tx2" colspan="4" align="right">
						총 결재액 :
					</td>
					<td><fmt:formatNumber value="${ cart_payment_total_amount }"/>원</td>
				</tr>
				
			</div>


			
		</div>

		<tr>
			<td class="tx2"   colspan="5" align="right">				
				<input type="button" value="결제하기" onclick="send(this.form);">
			</td>
		</tr>	
	</table>
</form>
<%@ include file="../main/footer.jsp" %>
</body>
</html>
