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
     width: 550px;
     margin: auto;
     margin-top: 60px;
  }
  
  label{
     margin-left: 10px;
     display: inline-block;
     width: 80px;
     text-align: right;
     
  }
  
   
  .seperator{
    margin-bottom: 10px;
  }

</style>

<script type="text/javascript">

 
 
 
 
 
 
 function send(f){
	 
	 //입력항목 체크(이름/비번/우편번호/주소)
	 var admin_name 		= f.admin_name.value.trim();
	 var admin_id 		= f.admin_id.value.trim();
	 var admin_pwd 		= f.admin_pwd.value.trim();

	 if(admin_name==''){
		 alert('이름을 입력하세요!!');
		 f.admin_name.value='';
		 f.admin_name.focus();
		 return;
	 }
	 if(admin_id==''){
		 alert('아이디을 입력하세요!!');
		 f.admin_id.value='';
		 f.admin_id.focus();
		 return;
	 }
	 
	 if(admin_pwd==''){
		 alert('비밀번호를 입력하세요!!');
		 f.admin_pwd.value='';
		 f.admin_pwd.focus();
		 return;
	 }
	 	 

	 f.action = "admin_modify.do";
	 f.submit(); //전송(제출)
	 
 }
 
</script>









</head>
<body>
<form class="form-inline">

<input type="hidden" name="admin_idx" value="${ vo.admin_idx }"  > 


  
  <div id="box">
  	<div class="panel panel-primary">
      <div class="panel-heading"><h4>회원수정</h4></div>
      <div class="panel-body">
        
	        <div class="seperator">
	           <label>이름 : </label>
	           <input class="form-control" name="admin_name" value="${ vo.admin_name }">
	        </div>
	        
	        <div class="seperator">
	           <label>아이디 : </label>
	           <input class="form-control" name="admin_id"   value="${ vo.admin_id }"  readonly="readonly" > 
	        </div>
	        
	        <div class="seperator">
	           <label>비밀번호 : </label>
	           <input class="form-control" type="password" name="admin_pwd"  value="${ vo.admin_pwd }">
	        </div>
	
	        
	        <hr>
	        
	        <div style="text-align: center">
	           <input class="btn  btn-primary" type="button" value="회원수정"
	                  onclick="send(this.form);">
	                  
	           <input class="btn  btn-success" type="button" value="목록보기"
	                  onclick="location.href='list.do'">
	        </div>
	        
      </div>
  	</div>
  	
  </div>
  
</form>

</body>
</html>