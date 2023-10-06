
<%@ page language='java' contentType='text/html;charset=UTF-8' pageEncoding='UTF-8' %>

<%@ taglib prefix='c'    	uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt'  	uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn'		uri='http://java.sun.com/jsp/jstl/functions' %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


    <title>상세설명 페이지</title>
      <link href="../css/index.css?after" rel="stylesheet" />


      <style type="text/css">
        #box{
           width: 500px;
           margin: auto;
           margin-top: 50px;
        }
        
        .style1{
           margin-bottom: 20px;
        }
        
        textarea {
         resize: none;
        }
        
        #my_img{
           width: 150px;
           border: 1px solid #cccccc;
           outline: 1px solid black;
           margin-bottom: 10px;
        }

        
      </style>

 <script>

   function add_cart(){

      
      //로그인여부(안된경우) 
      if("${ empty user }" =="true"){
         
         if(confirm("장바구니 담기는 로그인후에 가능합니다\n로그인 하시겠습니까?")==false)return;
         
         //로그인창 이동 : location.href <=현재경로
         location.href="../member/login_form.do?url=" + 
                     encodeURIComponent(location.href) ;
         return;
      }
      

   // 장바구니 담기	  
   var p_idx   = '${ vo.p_idx }';
   var mem_idx = '${ user.mem_idx }';

   // Ajax이용 장바구니 담기

   $.ajax({
      url	:	"cart_insert.do",
      data	:	{"p_idx": p_idx, "mem_idx": mem_idx },
      dataType: "json",
      success	: function(res_data){
         // res_data = {"result" : "exist" }
         // res_data = {"result" : "success" }
         // res_data = {"result" : "fail" }
         
         if(res_data.result == "exist"){
            alert("이미 등록된 상품입니다");
            return;
         }
         
         if(res_data.result == "fail"){
            alert("장바구니 담기 실패");
            return;
         }
         
      if (confirm("해당상품을 장바구니에 담았습니다\n장바구니 보기로 이동하시겟읍니까?")==false)return;
      
      location.href="cart_list.do";
         
         
      },
      error		: function(err){
         alert(err.responseText);
      }
   });

   function send(f){
        
        //입력항목 체크(이름/비번/우편번호/주소)
        var p_price		= f.p_price.value.trim();

        
        if(p_price==''){
            alert('주소를 입력하세요!!');
            f.p_price.value='';
            f.p_price.focus();
            return false;
        }	 
        f.action = "payment.do";//MemberInsertAction
        f.submit(); //전송(제출)
        
    }
   

   }

   function kakaopay(){

      
      
   }






</script>


</head>

<body>
 
    
   <form method="POST" action="../payment/ready">

      <input type="hidden"  name="item_name" value="${ vo.p_name}">
      <input type="hidden"  name="pay_count" value="1">
      <input type="hidden"  name="pay_price" value="${ vo.p_saleprice }">
      <input type="hidden" name="p_idx"  value="${ vo.p_idx }">
      <input type="hidden" name="mem_idx"  value="${ user.mem_idx }">
      
     
     <div id="box">
       <div class="panel panel-primary">
         <div class="panel-heading"><h4>상세페이지</h4></div>
         <div class="panel-body">
            
            <hr>
            
            <div class="style1"  style="text-align: center;">
               
               <img src="../upload/${ vo.p_image_s }" id="my_img">
               <img src="../upload/${ vo.p_image_l }" id="my_img">
               
            <br>
               
            </div>
            
            <hr>
            
            <div class="style1">
               <label>상품이름:</label>
               <tb>${vo.p_name}</tb>
               <!--<input class="form-control" name="p_name"  value="${ vo.p_name }">!-->
            </div>
            <div class="style1">
               <label>세일가격:</label>
               <tb>${vo.p_saleprice}</tb>
               <!--<<input class="form-control" name="p_saleprice"  value="${ vo.p_saleprice }">!-->
            </div>
          <div class="style1">
               <label>가격:</label>
               <tb>${vo.p_price}</tb>
              <!-- <input class="form-control" name="p_price"  value="${ vo.p_price }">!-->
            </div>
            <div class="style1">
               <label>내용:</label>
               <tb>${vo.p_content}</tb>
              <!-- <textarea class="form-control" name="p_content" rows="5" cols="">${ vo.p_content }</textarea>-->
            </div>
            
           
            <div style="text-align: center;">

               <!-- <input type="submit" value="결제하기"> -->

                      <!-- 로그인 된경우 -->
                    <c:if test="${ not empty sessionScope.user }">
                     <button type="submit"><img src="../resources/img/카카오페이.png"/></button>
    
                       
    
                    </c:if>
               

                 <input class="btn  btn-success" type="button"  value="장바구니담기"
                        onclick="add_cart()">
                        <input class="btn  btn-success" type="button"  value="메인으로"
                        onclick="location.href='list.do'">
            </div>
         </div>
       </div>
     </div>
     
   </form> 
        

        
        
</body>


</html>

