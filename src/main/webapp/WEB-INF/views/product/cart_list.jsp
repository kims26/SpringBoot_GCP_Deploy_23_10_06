<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c'    uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt'  uri='http://java.sun.com/jsp/jstl/fmt'%>
<%@ taglib prefix='fn'   uri='http://java.sun.com/jsp/jstl/functions'%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css">
    <link rel="stylesheet" type="text/css" href="../css/main_header.css">
    <link rel="stylesheet" type="text/css" href="../css/main_footer.css">   
    <link rel="stylesheet" type="text/css" href="../css/main.css">
    <link rel="stylesheet" type="text/css" href="../css/search.css">
    <link rel="stylesheet" type="text/css" href="../css/search_responsive.css">
    <link rel="stylesheet" type="text/css" href="../../../css/responsive.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	function check(f){
		//로그인여부(안된경우)
	  if("${ empty user }" =="true"){

		  if(confirm("장바구니 담기는 로그인후에 가능합니다\n로그인 하시겠습니까?")==false)return;

		  //로그인창 이동 : location.href <=현재경로
		  location.href="../member/login_form.do?url=" + 
						 encodeURIComponent(location.href) ;
		  return;
	  }
	  location.href = "../product/cart_list.do?mem_idx=${user.mem_idx}"
	}

</script>
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
   
   
   //장바구니 삭제
   function del(cart_idx){
	   
	   
	   if(confirm("정말 삭제하시겠습니까?")==false)return;
	   
	   //
	   location.href="cart_delete.do?cart_idx=" + cart_idx
	   
   }
   //선택삭제
   
   function del_select(f) {
		
		
	   if($("input[name='cart_idx']:checked").length==0){
		   
		   alert("삭제할 상품을 선택하세요");
		   return;
		  
	   }
	   if(confirm("정말 삭제하시겠습니까?")==false)return;
	   
	   f.action="cart_delete_select.do";
	   f.submit();
	   
}
   
   //선택 항목 결제
	function payment_form(f){
	   
		  if($("input[name='cart_idx']:checked").length==0){
			   
			   alert("결제할 상품을 선택하세요");
			   return;
			  
		   }
		  
	   f.action = "cart_payment_form.do"
	   f.submit();
   }   
   
   

   $(document).ready(function() {
	   
	   //전체버튼 클릭시
		$("#check_all").click(function() {
			if($("#check_all").is(":checked")) $("input[name=cart_idx]").prop("checked", true);
	 		else $("input[name=cart_idx]").prop("checked", false);
		});
		
	   
	   //각항목의 체크박스 클릭시
		$("input[name=cart_idx]").click(function() {
			
			//전체 체크박스갯수 구하기
			var total = $("input[name=cart_idx]").length;
			//체크된 체크박수개수 구하기
			var checked = $("input[name=cart_idx]:checked").length;

			if(total != checked) $("#check_all").prop("checked", false);
			else $("#check_all").prop("checked", true); 
		});
		
		
	});
</script>

<style>
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
.tx1{

text-align: center;
padding: 15px;
}
</style>


</head>


<body>
	<%@ include file="../main/header.jsp" %>
	<input type="hidden" name="mem_idx" value="mem_idx">
	<input type="hidden" name="cart_idx" value="cart_idx">
	<h5 style="    text-align: center;
	font-size: 40px; font-weight: bold; padding: 30px;">  장바구니</h5>

<c:if test="${ not empty list }">
		<div id="box">
	<form>
	<table align="center" width="70%" border="1"
 style="border-collapse:collapse; font-size:16pt; margin-left: 15%;"
 bordercolor="navy" cellpadding="4" cellspacing="0">
        <tr>
			<td colspan="6" style="padding-bottom: 10px;">
			
			  <input type="checkbox" value="전체" id="check_all">전체 &nbsp;&nbsp;
			  <input type="button"  id="delete" value="선택삭제" onclick="del_select(this.form);">
			
			</td>
		</tr>
		
		<tr style="font-weight: bold;
		background-color: #CDD9ED;
		border-bottom: 2px solid #E5E5E5; 
        border-top: 2px solid #E5E5E5; margin: 4px;" >
			<th class="tx1">제품번호</th>
			<th class="tx1" width="25%">제품명</th>
			<th class="tx1">단가</th>
			<th class="tx1">수량</th>
			<th class="tx1">금액</th>
			<th class="tx1">삭제</th>
		</tr>

		       <!-- for(CartVo vo : list)   -->   
        <c:forEach var="vo"  items="${ list }" varStatus="status">
		
			<tr align="center" style="border-bottom: 1px solid #E5E5E5;">
				<td align="center">
				   <input type="checkbox" name="cart_idx" value="${ vo.cart_idx }"> 
				   ${ vo.cart_cnt }
				</td>				
				<td><img src="../../../upload/${list2[status.index].p_image_s}" style="width: 100px;">${vo.p_name}</td>
				<td>
					단가:<fmt:formatNumber value="${ vo.p_price }" />원<br>
					<font color="red">
					세일가격:<b><fmt:formatNumber value="${ vo.p_saleprice }" />원</b>
					</font>
				</td>
				<td>
					<!-- 수량 조정 폼 -->
					<input id="cart_num_${ vo.cart_idx }" size="4"  align="center" value="${ vo.cart_num }">
					<input type="button" value="수정" onclick="modify('${ vo.cart_idx }');">
					
				</td>
				<td><fmt:formatNumber value="${ vo.amount }" />원</td>
				<td>
					<input type="button" value="삭제" style="border:1 solid black;cursor:hand"
 	                       onclick="del('${ vo.cart_idx }');">
				</td>
			</tr>
		
		</c:forEach>
	

		<tr>
			<td colspan="5" align="right">
				총 결재액 :
			</td>
			<td><fmt:formatNumber value="${ total_amount }"/>원</td>
		</tr>


        <!-- 장바구니가 비어있는경우 -->  
		</c:if>
		<c:if test="${ empty list}">
			
					<div style="padding: 150px; text-align: center;">
						<p style="font-size: 30px; font-weight: bold;">장바구니에 담긴 상품이 없습니다.</p>
						<br>
						<p>원하시는 상품을 장바구니에 담아보세요!</p>
						<a href="../product/list.do" class="cart_btn">쇼핑 계속하기</a>
					</div>
			
		</c:if>
		
		<tr>
			<td colspan="6" align="right" style="padding: 50px;">
				<c:if test="${not empty list}">
				<input type="button" value="목록보기" onclick="location.href='../product/list.do'">
				<input type="button" value="구매하기" onclick="payment_form(this.form);">
			</c:if>
			</td>
		</tr>	
	</table>
</form>

<%@ include file="../main/footer.jsp" %>
	
</body>
</html>






