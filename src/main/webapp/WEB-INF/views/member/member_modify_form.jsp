<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap3.x 설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 우편번호검색 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style type="text/css">
	#box{
	   width: 1100px;
	   margin: auto;
	   margin-top: 30px;
	}
	
	#title{
	   text-align: center;
	   font-size: 28px;
	   font-weight: bold;
	   
	   color: green;
	   text-shadow: 1px 1px 3px black;
	}
	
	#empty_message{
	   text-align: center;
	   margin-top: 200px;
	   color : red;
	   font-weight: bold;
	   font-size: 26px;
	}
  
	#container {
	  position: relative;
	  z-index: 20;
	  max-width: 954px;
	  height: 100%;
	  margin: 0 auto;
  	}
  
  #content {
	  position: relative;
	  padding: 32px 51px 95px;
	 
  	}
  
  .c_header {
	  padding-bottom: 43px;
	}
  
  .c_header h2 {
	  font-size: 20px;
	  line-height: 22px;
	  position: relative;
	  color: #333;
  	}
  
  .c_header .contxt {
	  line-height: 19px;
	  padding-top: 10px;
	  color: #666;
  	}
  
  .tbl_model {
	 position: relative;
	 width: 100%;
	 table-layout: fixed;
	 border-spacing: 0;
	 border-collapse: collapse;
	 word-wrap: break-word;
	 word-break: keep-all;
	 border: 0;
	 border-bottom: 1px solid #e5e5e5;
	 border-top: 1px solid #e5e5e5;
  	}
  
  .blind, legend {
	  position: absolute;
	  clip: rect(0 0 0 0);
	  width: 1px;
	  height: 1px;
	  margin: -1px;
	  overflow: hidden;
  	}
  
  .tbl_model th {
	  color: #333;
	  border-right: 1px solid #e5e5e5;    
	  background: #f9f9f9;
  	}
  
  .tbl_model .thcell {
	  padding: 32px 31px 32px;
  	}
  
  .tbl_model td {
	 padding: 15px;
	  color: #565656;
  	}

	#heard_line{
  
	  border-bottom: 1px solid #e5e5e5;
		
  	}
  
</style>

<script type="text/javascript">

 function find_addr(){
	 
	 new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            
	            // data = {"zonecode": "12345" , "address":"서울시 관악구" ,...}
	            
	            $("#mem_zipcode").val(data.zonecode);
	            $("#mem_addr").val(data.address);
	            
	            
	        }
	    }).open();
	 
 }//end:find_addr()
 
 
 
 function send(f){
	 
	 //입력항목 체크(이름/비번/우편번호/주소)
	 var mem_name 		= f.mem_name.value.trim();
	 var mem_pwd 		= f.mem_pwd.value.trim();
     var mem_type       = f.mem_type.value.trim();
	 var mem_zipcode 	= f.mem_zipcode.value.trim();
	 var mem_addr 		= f.mem_addr.value.trim();
     var mem_tel        = f.mem_tel.value.trim();
	 
	 if(mem_name==''){
		 alert('이름을 입력하세요!!');
		 f.mem_name.value='';
		 f.mem_name.focus();
		 return;
	 }
	 
	 if(mem_pwd==''){
		 alert('비밀번호를 입력하세요!!');
		 f.mem_pwd.value='';
		 f.mem_pwd.focus();
		 return;
	 }

     if(mem_type==''){
        alert('충전타입을 선택하세요');
        
        return;
     }
	 
	 if(mem_zipcode==''){
		 alert('우편번호를 입력하세요!!');
		 f.mem_zipcode.value='';
		 f.mem_zipcode.focus();
		 return;
	 }
	 
	 if(mem_addr==''){
		 alert('주소를 입력하세요!!');
		 f.mem_addr.value='';
		 f.mem_addr.focus();
		 return;
	 }

     if(mem_tel==''){
        alert('전화번호를 입력하세요');
        f.mem_tel.value='';
        f.mem_tel.focus();
        return;
     }
	 
	 
	 
	 
	 f.action = "modify.do";//MemberModifyAction
	 f.submit(); //전송(제출)
	 
 }
 
</script>







</head>
<body>
	<%@ include file="../main/header.jsp" %>

	<div id="container" style="height: 706px;">
		<!-- CONTENTS -->
		<div id="content" style="background-color: #fff;">
    		<div class="c_header">
        	<h2>프로필 정보</h2>
        	<p class="contxt">나의 정보를 수정 하실 수 있습니다.</p>
    			</div>

<form class="form-inline">
<table border="0" class="tbl_model">

  <input type="hidden" name="mem_idx"  value="${ vo.mem_idx }">

  
  <tbody>  
		<tr>
			<th scope="row" style="width: 200px;">
				<div class="thcell">회원 정보</div>
			</th>
			<td>
				<div>회&nbsp;&nbsp;&nbsp;원&nbsp;&nbsp;&nbsp;명 :&nbsp;&nbsp; <input class="form-inline" name="mem_name" value="${ vo.mem_name }"></div>
				<br>
				<div>비밀번호 :&nbsp;&nbsp; <input class="form-inline" name="mem_pwd" value="${ vo.mem_pwd }"></div>
				<br>
				<div>전화번호 :&nbsp;&nbsp; <input class="form-inline" name="mem_tel" value="${ vo.mem_tel }"></div>
				<br>
				<div>충전타입 :&nbsp;&nbsp; 
					<select name="mem_type">
						<option value="1">B타입(5핀)</option>
						<option value="2">C타입(5핀)</option>
						<option value="3">BC타입(5핀)</option>
						<option value="4">BC타입(7핀)</option>
						<option value="5">DC차데모</option>
						<option value="6">AC3상</option>
						<option value="7">DC콤보</option>
					</select>
				</div>
				<br>
				<div>우편번호 :&nbsp;&nbsp; <input class="form-inline" name="mem_zipcode" value="${ vo.mem_zipcode }">
					<input class="btn  btn-info" type="button"  value="검색" onclick="find_addr();" >
				</div>
				<br>
				<div>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소  :&nbsp;&nbsp; <input class="form-inline" name="mem_addr" value="${ vo.mem_addr }"></div>                              
				<br>                 
			</td>
		</tr>

  </tbody>
	        
		</table>
	        
	        <hr>
	        
	        <div style="text-align: center">
	           <input class="btn  btn-primary" type="button" value="회원수정"
	                  onclick="send(this.form);">
	                  
	           <input class="btn  btn-success" type="button" value="뒤로가기"
	                  onclick="location.href='mypage.do?mem_idx='+ '${user.mem_idx}'">
	        </div>
	        
      </div>
  	</div>
  	
  </div>
  
</form>
<%@ include file="../main/footer.jsp" %>

</body>
</html>