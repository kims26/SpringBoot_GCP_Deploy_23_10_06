<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap3.x 설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <style type="text/css">
  
  #box{
     width: 550px;
     margin: auto;
     margin-top: 60px;
  }
  
  label{
     margin-left: 10px;
     display: inline-block;
     width: auto;
     text-align: right;
     
  }
  
  #id_message{
     display: inline-block;
     width: 200px;
     color : red;
     margin-left: 5px;
  }
  
  .seperator{
    margin-bottom: 10px;
  }

  

</style> -->

<script type="text/javascript">

function changePhone1(){
    const phone1 = document.getElementById("phone1").value
    if(phone1.length === 3) {
        document.getElementById("phone2").focus()
    }
}

function changePhone2(){
    const phone2 = document.getElementById("phone2").value
    if(phone2.length === 4) {
        document.getElementById("phone3").focus()
    }
}

function changePhone3(){
    const phone1 = document.getElementById("phone1").value
    const phone2 = document.getElementById("phone2").value
    const phone3 = document.getElementById("phone3").value
    if(phone1.length === 3 && phone2.length === 4 && phone3.length === 4){
        //document.getElementById("token__button").style = "background-color: #FFFFFF; color: #0068FF; cursor: pointer;"
        //document.getElementById("token__button").removeAttribute("disabled")
        let o_tel = phone1 + '-' + phone2 + '-' + phone3;
        document.getElementById("mem_tel").value = o_tel;
    }
    else{
        document.getElementById("mem_tel").value = '';
    }

}

 function check_id(){
	 //           document.getElementById("mem_id").value 
	 var mem_id = $("#mem_id").val();
	 
	 if(mem_id.length<3){
		 
		 $("#id_message").html("아이디는 3자리이상 입력")
		                 .css("color","red");
		 
		 //회원가입버튼 비활성화
		 $("#btn_register").attr("disabled",true);//비활성화
		 
		 return;
	 }
	 
	 
	 //서버 : 아이디 중복체크
	 $.ajax({
		 
		 url		:	"check_id.do",  		//MemberCheckIdAction
		 data		:	{"mem_id" : mem_id },	//parameter=>check_id.do?mem_id=hong
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

	 f.action = "insert.do";//MemberInsertAction
	 f.submit(); //전송(제출)
	 
 }

 
</script>


</head>
<body>

	<h5 style="text-align: center;
			   font-size: 40px; font-weight: bold; margin-bottom: 30px;" > </h5>

	<main id="contaniner" class="create_page">
        <div class="sub_container">
			<form  class="form-inline" id="createform" name="form1" method="GET">
				<section class="section01 section">
					<h2 class="page_title">메이크샵 회원가입</h2>
				</section>
				<section class="section02 section">
					
					<div class="form_box">
						<div class="tit_box">
							<h3>회원정보</h3>
							<span>사용자별 충전소 찾기를 위해 정보를 입력해주세요.<br class="mo_ver"></span>
						</div>
						<fieldset>
							<legend>회원정보</legend>

                            <label for="user_pw_n1" class="input_box shop_name">
                                <span class="tit">이름</span>
                                <input type="name" name="mem_name" id="mem_name" class="input_text" maxlength="10" value="${mem_name}" />
                            </label>

                            <label for="user_email_n1" class="input_box shop_email">
                                <span class="tit">이메일</span>
                                <div class="address_line address_line01 user_b">
                                    <input type="text" name="mem_n_email" id="mem_n_email" class="input_text" value="${mem_email}" readonly="readonly"/>
                                </div>
                                
                                <div id="mail_number" name="mail_number" style="display: none">
                                    <input type="text" name="number" id="number" style="width: 250px; margin-top: -10px" placeholder="인증번호 입력">
                                    <button type="button" name="confirmBtn" id="confirmBtn" onclick="confirmNumber()">이메일 인증</button>
                                    <input type="hidden" id="Confirm" value="">
                                    <input type="hidden" id="email_error" value="1">
                                </div>
                                
                            </label>

                            
                            	<label for="mem_id" class="address_wrap input_box shop_id">
								<span class="tit">ID &nbsp;</span>
								<div class="address_line address_line01 user_b">
									<input type="text" name="mem_id" id="mem_id" class="input_text" placeholder="ID를 입력해주세요." maxlength="10" />
								</div>
								<!--span class="pw_txt err_message">영문(소문자), 숫자 사용가능 4~10자리로 입력해주세요.</span-->
								<span id="id_error" class="err_message">ID을 중복체크 해주세요.</span>
							    </label>
                            

							<div class="row_box f_b">
								<label for="user_pw_n1" class="user_pw_n1 input_box">
									<span class="tit">비밀번호</span>
									<input type="password" name="mem_pwd" id="mem_pwd" class="input_text" maxlength="16" placeholder="비밀번호를 입력해주세요."  />
									<span class="pw_txt err_message">영문, 숫자를 혼용하여 10~16자리로 입력해주세요.</span>
								</label>
								<label for="user_pw_n2" class="user_pw_n2 input_box">
									<span class="tit">비밀번호 확인</span>
									<input type="password"  id="mem_pwd2" class="input_text" maxlength="16" placeholder="비밀번호를 확인해주세요."  />
									<span id="re_password_error" class="err_message">비밀번호가 일치하지 않습니다.</span>
								</label>
							</div>

							<label for="user_pw_n1">
                                <select name="mem_type">
									<option value="1">B타입(5핀)</option>
									<option value="2">C타입(5핀)</option>
									<option value="3">BC타입(5핀)</option>
									<option value="4">BC타입(7핀)</option>
									<option value="5">DC차데모</option>
									<option value="6">AC3상</option>
									<option value="7">DC콤보</option>
								</select>
								
                            </label>


							<div class="seperator">
								<label>우편번호 </label>
								<input class="form-control" 
									   name="mem_zipcode" id="mem_zipcode" >
								<input class="btn  btn-info" type="button"  value="검색"
									   onclick="find_addr();" >
							 </div>

                            <div class="seperator">
                                <label>주소  </label>
                                <input class="form-control" name="mem_addr" id="mem_addr" >
                                
                             </div>

							<div class="phone_box input_box">
								<label for="user_num1" class="user_num">
									<span class="tit">휴대폰번호</span>
								</label>
								<div class="phone_box_container f_c">
                                    <input type="hidden" name="mem_tel"  id="mem_tel" >
									<input class="input_text input_phone" id="phone1" type="text" value="${fn:substring(mem_tel,0,3)}" onkeyup="changePhone1()"/> - 
                                    <input class="input_text input_phone" id="phone2" type="text" value="${fn:substring(mem_tel,4,8)}" onkeyup="changePhone2()" /> -
                                    <input class="input_text input_phone" id="phone3" type="text" value="${fn:substring(mem_tel,9,13)}"onkeyup="changePhone3()" />
								</div>
							</div>

						</fieldset>
					</div>


					<div class="form_box">
						<div class="tit_box">
							<h3>이용약관 동의</h3>
						</div>
						<div class="checkbox_group">
							<div class="check_cont">
								<input type="checkbox" class="normal require agreement"  />
								(필수)<em class="popup_open_btn" data-num="1">메이크샵 통합회원 이용약관</em>
							</div>
							<div class="check_cont">
								<input type="checkbox" class="normal require agreement"   />
								(필수)<em class="popup_open_btn" data-num="2">개인정보 수집,이용 동의</em>
							</div>
							
						</div>
					</div>

					<div class="btn_ver1_box f_c">
						<!-- <button class="btn_ver btn_ver1" onclick="send(this.form); return false;"> 프리미엄 회원가입</button> -->
                        <input class="btn_ver btn_ver1" type="button" value="회원가입" onclick="send(this.form);" return false;>
						<input class="btn_ver btn_ver1" type="button" value="메인으로 가기" onclick="location.href='../main/main.do'">
					</div>
					
				</section>
			</form>
        </div>
    </main>

</body>

</html>