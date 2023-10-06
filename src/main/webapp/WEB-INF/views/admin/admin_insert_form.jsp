<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/admin_insert_page.css">
<link rel="stylesheet" href="../../css/reset.css">
<!-- Bootstrap3.x 설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
rel="stylesheet">

<style type="text/css">
	  #id_message{
     display: inline-block;
     width: 200px;
     color : red;
     margin-left: 5px;
  }
  
</style>
<script type="text/javascript">

 function check_id(){
	 //           document.getElementById("mem_id").value 
	 var admin_id = $("#admin_id").val();
	 
	 if(admin_id.length<3){
		 
		 $("#id_message").html("아이디는 3자리이상 입력")
		                 .css("color","red");
		 
		 //회원가입버튼 비활성화
		 $("#btn_register").attr("disabled",true);//비활성화
		 
		 return;
	 }
	 
	 
	 //서버 : 아이디 중복체크
	 $.ajax({
		 
		 url		:	"check_admin_id.do",  		
		 data		:	{"admin_id" : admin_id },	//parameter=>check_id.do?mem_id=hong
		 dataType	:	"json",
		 success	:	function(res_data){
			 //res_data = {"result" : true } or {"result" : false } 
			 if(res_data.result==true){
				
				 $("#id_message").html("사용가능한 아이디 입니다")
                                 .css("color","blue");
				 
				 //회원가입버튼 활성화
				 $("#btn_register").attr("disabled",false);//활성화
				 
			 }else{
				 
				 $("#id_message").html("이미 사용중인 아이디 입니다")
                                 .css("color","red");
				 //회원가입버튼 비활성화
				 $("#btn_register").attr("disabled",true);//비활성화
			 }
			 
			 
		 },
		 error		:	function(err){
			 
			 alert(err.responseText);
			 
		 }
	 });
	 
 }//end:check_id()
 
 
 





 
 function send(f){

	 var admin_name 		= f.admin_name.value.trim();
	 var admin_id		= f.admin_id.value.trim();
	 var admin_pwd 		= f.admin_pwd.value.trim();

	 
	 if(admin_name==''){
		 alert('이름을 입력하세요!!');
		 f.admin_name.value='';
		 f.admin_name.focus();
		 return;
	 }
	 if(admin_id==''){
		 alert('아이디를 입력하세요!!');
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

     
	 
	 
	 
	 
	 f.action = "insert.do";
	 f.submit(); //전송(제출)
	 
 }
 
 
 
 
 


</script>




</head>
<body>
<h5 style="text-align: center;
font-size: 40px; font-weight: bold;"> </h5>
<form action="insert.do">
 <input type="hidden" name="url" value="${ param.url }">
 <main id="contaniner" class="login_page">
	 <div class="sub_container">
		 <section class="section01">
			 <div class="page_title_box">
				 <h2 class="page_title">Admin</h2>
			 </div>

			 <div class="tab">
				 <div class="tab_container">
					 <div class="tab_effect_box">
						 <div class="tab_effect">
							 <div class="tab_icon">
								 <img src="img/sub/member/icon_tab_cursor.png" alt="" />
							 </div>
						 </div>
					 </div>
					 <ul class="tab_ul login-tab">
						 <li class="tab_li on">
							 관리자</li>
					 
						 
					 </ul>
				 </div>
			 </div>
			 
			 <div class="tab_content">
				 <div id="frmMaster" class="tab_content_li on">
					 <form id="loginform" class="form_box" name="loginform" 
						 method="POST" target="hiddenlogin" onsubmit="return false">
			 

						 <fieldset>
							
							 <label for="name" class="input_box">
								<span class="tit">이름</span>
								<input type="text" name="admin_name" value="${ param.admin_name }" id="admin_name"
									class="input_text" placeholder="이름을 입력하세요.">
							</label>
							 <label for="id" class="input_box">
								 <span class="tit">아이디</span>
								 <input type="text" name="admin_id" value="${ param.admin_id }" id="admin_id"
									 class="input_text" placeholder="아이디를 입력하세요." onkeyup="check_id();">
									 <span id="id_message"></span> 
							 </label>
							 <label for="password" class="input_box type-password ">
								 <span class="tit">비밀번호</span>
								 <input type="password" name="admin_pwd" value="${ param.admin_pwd }"
									 id="admin_pwd" class="input_text enterMaster"
									 placeholder="비밀번호를 입력하세요.">
							 </label>



							 </div>
							         
							
							 <button class="btn_ver btn_ver1 f_c login btn_login" type="submit"
							 id="btn_register" disabled="disabled" onclick="send(this.form); return false;">관리자
								추가하기</button>
								
						 </fieldset>
					 </form>
				 </div>

			 
		 </section>

	 </div>
 </main>
</form>
</body>
</html>