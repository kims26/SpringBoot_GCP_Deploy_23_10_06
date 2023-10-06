<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

function sendNumber(){
    // const regex = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z-.]+$/;
    const regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    var mem_email = $("#mem_email").val().trim();
    if(regex.test(mem_email)==false){
        alert('제대로된 이메일을 입력하세요!!');
        $("#mem_email").focus();
        return false;
    }

    if(mem_email==''){
        alert('이메일을 입력하세요!!');
        $("#mem_email").val("");
        $("#mem_email").focus();
        return false;
    }

    $("#mail_number").css("display","block");
    $.ajax({
        url:"/mail",
        data:{"mail" : $("#mem_email").val()},
        success: function(data){
            alert("인증번호 발송");          
            $("#Confirm").attr("value",data);
        }
    });
}

function confirmNumber(){
        var number1 = $("#number").val();
        var number2 = $("#Confirm").val();

        if(number1 == number2){
            alert("인증되었습니다.");
            $("#email_error").val(0);
        }else{
            alert("번호가 다릅니다.");
        }
}


 
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
 
 function check_mem_id(){

	 var mem_id = $("#mem_id").val();
	 var regExp = /^[A-Za-z]{4,10}$/;


	 if(regExp.test(mem_id)==false){
		 
		 $("#id_message").html("*영문(소문자) 4~10자리로 입력해주세요.")
		                 .css("color","red");
		 
		 //회원가입버튼 비활성화
		 $("#btn_register").attr("disabled",true);//비활성화
		 
		 return;
	 }
	 
	 
	 //서버 : 아이디 중복체크
	 $.ajax({
		 
		 url		:	"check_mem_id.do",  		
		 data		:	{"mem_id" : mem_id },	
		 dataType	:	"json",
		 success	:	function(res_data){
			 if(res_data.result==true){
				
				 $("#id_message").html("사용가능한 아이디 입니다.")
                                 .css("color","blue");
				 
				 //회원가입버튼 활성화
				 $("#btn_register").attr("disabled",false);//활성화
				 
			 }else{
				 
				 $("#id_message").html("이미 사용중인 아이디 입니다.")
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
 
 
 function check_mem_pwd(){

var mem_pwd = $("#mem_pwd").val();
// var regExp = /^[A-Za-z]{4,10}$/;
// var regExp = /^[A-Za-z0-9]{6,12}$/;

// var regExp1 = /[^a-z0-9]+|^([a-z]+|[0-9]+){6,12}$/i;
var regExp1 =/^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{6,12}$/i;
// var regExp1 = /^([a-z][0-9][a-z0-9]*|[0-9][a-z][a-z0-9]*){6,12}$/i;



if(regExp1.test(mem_pwd)==false){
	
	$("#pwd_message").html("*비밀번호는 영문, 숫자를 혼용하여 6~12자리로 입력해주세요.")
					.css("color","red");
	
	//회원가입버튼 비활성화
	$("#btn_register").attr("disabled",true);//비활성화
	
	return;
}


//서버 : pwd 중복체크
$.ajax({
	
	url		:	"check_pwd.do",  		
	data		:	{"mem_pwd" : mem_pwd },	
	dataType	:	"json",
	success	:	function(res_data){
		if(res_data.result==true){
		   
			$("#pwd_message").html("사용가능한 비밀번호 입니다.")
							.css("color","blue");
			
			//회원가입버튼 활성화
			$("#btn_register").attr("disabled",false);//활성화
			
		}else{
			
			$("#pwd_message").html("이미 사용중인 비밀번호 입니다.")
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

	var mem_id = document.getElementById('mem_id');
	var mem_pwd = document.getElementById('mem_pwd');

	//정규식
	var reg_id = /^[A-Za-z]{4,10}$/;
	var reg_pwd = /^[A-Za-z0-9]{6,12}$/;

	 
	//입력항목 체크(이름/비번/우편번호/주소)
	 var mem_name 		= f.mem_name.value.trim();
     var mem_type       = f.mem_type.value.trim();
	 var mem_zipcode 	= f.mem_zipcode.value.trim();
	 var mem_addr 		= f.mem_addr.value.trim();
     var mem_tel        = f.mem_tel.value.trim();
	 
	 if(mem_name==''){
		 alert('이름을 입력하세요.');
		 f.mem_name.value='';
		 f.mem_name.focus();
		 return;
	 }

	 if(mem_id==''){
		alert('아이디를 입력하세요.');
		f.mem_id.value='';
		f.mem_id.focus();
		return;
	 } 
	 
	 if(!reg_id.test(mem_id.value)){
		alert('아이디는 영문(소문자) 4~10자리로 입력해주세요.');
		f.mem_id.value='';
		f.mem_id.focus();
		return;
	 }
	 
	 if(mem_pwd==''){
		 alert('비밀번호를 입력하세요.');
		 f.mem_pwd.value='';
		 f.mem_pwd.focus();
		 return;
	 }

	 if(!reg_pwd.test(mem_pwd.vlaue)){
		alert('비밀번호는 영문, 숫자를 혼용하여 6~12자리로 입력해주세요.');
		f.mem_pwd.value='';
		f.mem_pwd.focus();
		return;
	 }

     if(mem_type==''){
        alert('충전타입을 선택하세요.');
        
        return;
     }
	 
	 if(mem_zipcode==''){
		 alert('우편번호를 입력하세요.');
		 f.mem_zipcode.value='';
		 f.mem_zipcode.focus();
		 return;
	 }
	 
	 if(mem_addr==''){
		 alert('주소를 입력하세요.');
		 f.mem_addr.value='';
		 f.mem_addr.focus();
		 return;
	 }

     if(mem_tel==''){
        alert('전화번호를 입력하세요.');
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
							<h3>정보입력</h3>
							<span>메이크샵 가입을 위해 정보를 입력해주세요.<br class="mo_ver"></span>
						</div>
						<fieldset>
							<legend>정보 입력</legend>

                            <label for="user_pw_n1" class="input_box shop_name">
                                <span class="tit">이름</span>
                                <input type="name" name="mem_name" id="mem_name" class="input_text" maxlength="10" placeholder="이름을 입력해주세요."  />
                            </label>

                            <label for="user_email_n1" class="input_box shop_email">
                                <span class="tit">이메일</span>
                                <div class="address_line address_line01 user_b">
                                    <input type="text" name="mem_email" id="mem_email" class="input_text"  placeholder="이메일을 입력해주세요."/>
                                    <input type="button" class="user_btn" value="인증번호발송"   onclick="sendNumber();">
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
									<input type="text" name="mem_id"  value="${ param.mem_id }" id="mem_id" class="input_text" placeholder="ID를 입력해주세요." onkeyup="check_mem_id()" maxlength="10" />
								</div>
								<span id="id_message" style="font-size:1.4rem ; margin-top: 0.5rem ;"></span> 
								<!-- <span class="pw_txt err_message">
									영문(소문자) 4~10자리로 입력해주세요. </span> -->
								<!--span id="id_error" class="err_message">ID을 중복체크 해주세요.</span-->
							    </label>
                            

							<div class="row_box f_b">
								<label for="user_pw_n1" class="user_pw_n1 input_box">
									<span class="tit">비밀번호</span>
									
									<!-- <span class="pw_txt err_message">영문, 숫자를 혼용하여 6-20자리로 입력해주세요.</span>  -->
									<input type="password" name="mem_pwd" id="mem_pwd" value="${ param.mem_pwd }" onkeyup="check_mem_pwd()" class="input_text" maxlength="16" placeholder="비밀번호를 입력해주세요."  />
									<span id="pwd_message" style="font-size:1.4rem ; margin-top: 0.5rem ; margin-bottom: 0.5rem ;"></span> 
								</label>
								<label for="user_pw_n2" class="user_pw_n2 input_box">
									<span class="tit">비밀번호 확인</span>
									<!-- <span> &nbsp;</span> -->
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
									<input class="input_text input_phone" id="phone1"   type="text" onkeyup="changePhone1()"/> - 
                                    <input class="input_text input_phone" id="phone2" type="text" onkeyup="changePhone2()" /> -
                                    <input class="input_text input_phone" id="phone3" onkeyup="changePhone3()" />
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
								(필수)<em class="popup_open_btn" data-num="1">통합회원 이용약관</em>
							</div>
							<div class="check_cont">
								<input type="checkbox" class="normal require agreement"   />
								(필수)<em class="popup_open_btn" data-num="2">개인정보 수집,이용 동의</em>
							</div>
							
						</div>
					</div>

					<div class="btn_ver1_box f_c">
                        <input class="btn_ver btn_ver1" id="btn_register" disabled="disabled" type="button" value="회원가입" onclick="send(this.form);" return false;>
						<input class="btn_ver btn_ver1" type="button" value="메인으로 가기" onclick="location.href='../main/main.do'">
					</div>
					
				</section>
			</form>
        </div>
    </main>

</body>

</html>