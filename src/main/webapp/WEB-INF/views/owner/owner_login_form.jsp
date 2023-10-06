<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자회원 로그인폼</title>

<link rel="stylesheet" href="../../css/login_page.css">
        <link rel="stylesheet" href="../../css/reset.css">
        
        <link rel="stylesheet" href="./css/sub/member/join.css?1683612559">
        <link rel="stylesheet" href="./css/sub/member/agreement.css?1683612559">
        <link rel="stylesheet" href="./css/sub/member/complete.css?1684732681">
        <link rel="stylesheet" href="./css/sub/member/sum.css?1683612559">
      
        <link rel="stylesheet" href="./css/sub/login/login_responsive.css?1684732681">
        <link rel="stylesheet" href="./css/sub/mypage/mypage_responsive.css?1683612559">
        <link rel="stylesheet" href="./css/sub/member/join_responsive.css?1683612559">
        <link rel="stylesheet" href="./css/sub/member/complete_responsive.css?1683612559">

		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<script type="text/javascript">
   
   function send(f){
	   
	   var o_id	= f.o_id.value.trim();
	   var o_pwd	= f.o_pwd.value.trim();
	   
	   if(o_id==''){
		   
		   alert('아이디를 입력하세요');
		   f.o_id.value='';
		   f.o_id.focus();
		   return;
	   }
	   
	   if(o_pwd==''){
		   
		   alert('비밀번호를 입력하세요');
		   f.o_pwd.value='';
		   f.o_pwd.focus();
		   return;
	   }
	   
	   //전송
	   f.action = "login.do";//MemberLoginAction
	   f.submit();
	   
   }
</script>



<script type="text/javascript">

   //jQuery초기화 이벤트
   $(document).ready(function(){
	   
	   // 0.1초후에 호출 : 로그인폼 show된후에 호출
	   setTimeout(show_message,100);
	   //show_message();
	   
   });
   
   function show_message(){
	   
	 //login_form.do?reason=fail_id
	 if("${ param.reason eq 'fail_id' }" == "true"){
		alert('아이디가 틀렸습니다!!'); 
	 }
	 
	 //login_form.do?reason=fail_pwd
	 if("${ param.reason eq 'fail_pwd' }" == "true"){
		alert('비밀번호가 틀렸습니다!!'); 
	 }
	 
	 if("${ param.reason eq '승인거절' }" == "true"){
		alert('승인거절'); 
	 }
	 
	 if("${ param.reason eq '승인대기' }" == "true"){
		alert('승인대기'); 
	 }	
	 
	 //login_form.do?reason=fail_session_timeout
	 if("${ param.reason eq 'fail_session_timeout' }" == "true"){
			alert('로그아웃되었습니다\n로그인후에 이용하세요!!'); 
     }		   
	   
   }


</script>

</head>
<body>
	<%@ include file="../main/header.jsp" %>
  <h5 style="text-align: center;
             font-size: 40px; font-weight: bold; margin-bottom: 30px;" > </h5>
	<form action="login.do">
		<main id="contaniner" class="login_page">
			<div class="sub_container">
				<section class="section01">
					<div class="page_title_box">
						<h2 class="page_title">로그인</h2>
									</div>
	
									<div class="tab">
						<div class="tab_container">
							<div class="tab_effect_box">
								<div class="tab_effect">
									<div class="tab_icon">
										<img src="img/sub/member/icon_tab_cursor.png" alt="">
									</div>
								</div>
							</div>
							<ul class="tab_ul login-tab">
								<li class="tab_li on" data-type="main" onclick="location.href='../member/login_form.do'">일반회원</li>
								<li class="tab_li" data-type=" sub" style="background-color: #1954db; border-radius: 10px; color: white; margin-left: 30px; ">판매자회원</li>
	
								<input type="hidden" name="admin_type" value="main" id="rdo_mk">
							</ul>
						</div>
					</div>
									<iframe name="hiddenlogin" style="display:none" src="blank.html"></iframe>
					<div class="tab_content">
						<div id="frmMaster" class="tab_content_li on">
							<form id="loginform" class="form_box" name="loginform" action="newlogin.html" method="POST" target="hiddenlogin" onsubmit="return false">
								
								
								<fieldset>
									<legend>일반회원 로그인폼</legend>
									<label for="id" class="input_box">
										<span class="tit">아이디</span>
										<input type="text" name="o_id" value="${ param.o_id }" id="o_id" class="input_text" placeholder="아이디를 입력하세요.">
									</label>
									<label for="password" class="input_box type-password ">
										<span class="tit">비밀번호</span>
										<input type="password" name="o_pwd" value="${ param.o_pwd }" id="o_pwd" class="input_text enterMaster" placeholder="비밀번호를 입력하세요.">
									</label>
	
									
									
									<div class="check_line d-chk">
										<div class="f_cs">
											<label for="id_save" class="check_box">
												<input type="checkbox" name="idsave" id="id_save" value="Y" class="input_checkbox">
												<span class="tit f_cs">아이디 저장</span>
											</label>
											
										</div>
										
									</div>
									<button class="btn_ver btn_ver1 f_c login btn_login" type="submit" id="login_btn" onclick="send(this.form); return false;">판매자회원 로그인</button>
								</fieldset>
							</form>
						</div>
						
					<p class="join_txt">이지차징, 이브이차징 <a href="insert_form.do" class="highlight_text">이브이차징 가입하기</a></p>
				</section>
	
			</div>
		</main>
	</form> 
  
</body>
</html>