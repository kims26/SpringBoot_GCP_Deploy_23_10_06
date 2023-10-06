<%@ page language='java' contentType='text/html;charset=UTF-8' pageEncoding='UTF-8' %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>판매자 회원가입 폼</title>

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
        document.getElementById("o_tel").value = o_tel;
    }
    else{
        document.getElementById("o_tel").value = '';
    }

}



function sendNumber(){
    const regex = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z-.]+$/;
    var o_email = $("#o_email").val().trim();
    if(regex.test(o_email)==false){
        alert('제대로된 이메일을 입력하세요!!');
        $("#o_email").focus();
        return false;
    }

    if(o_email==''){
        alert('이메일을 입력하세요!!');
        $("#o_email").val("");
        $("#o_email").focus();
        return false;
    }

    $("#mail_number").css("display","block");
    $.ajax({
        url:"/mail",
        data:{"mail" : $("#o_email").val()},
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
                    //alert(data.address);
            
                    $("#o_addr").val(data.address);
                    
                    
                }
            }).open();
        }//end:find_addr


        function send(f){
        
        //입력항목 체크(이름/비번/우편번호/주소)
        var o_name 		= f.o_name.value.trim();
        var o_email 	= f.o_email.value.trim();
        var email_error = $("#email_error").val();
        var o_pwd		= f.o_pwd.value.trim();
        //var o_tel 	    = f.o_tel.value.trim();
        var o_addr 		= f.o_addr.value.trim();
        var o_id        = f.o_id.value.trim();
        
        if(o_name==''){
            alert('이름을 입력하세요!!');
            f.o_name.value='';
            f.o_name.focus();
            return false;
        }

        if(o_email==''){
            alert('이메일을 입력하세요!!');
            f.o_email.value='';
            f.o_email.focus();
            return false;
        }

        if(email_error!="0"){
            alert('이메일인증을 완료하세요!!');
            return false;
        }

        if(o_id==''){
            alert('아이디를 입력하세요!!');
            f.o_id.value='';
            f.o_id.focus();
            return false;
        }

        
        if(o_pwd==''){
            alert('비밀번호를 입력하세요!!');
            f.o_pwd.value='';
            f.o_pwd.focus();
            return false;
        }
        
        if(o_addr==''){
            alert('주소를 입력하세요!!');
            f.o_addr.value='';
            f.o_addr.focus();
            return false;
        }	 
        f.action = "insert.do";//MemberInsertAction
        f.submit(); //전송(제출)
        
    }



        </script> 




</script>

</head>

<body>
    <main id="contaniner" class="create_page">
        <div class="sub_container">
			<form  class="form-inline"  id="createform" name="form1" method="GET">
                
				<section class="section01 section">
					<h2 class="page_title">메이크샵 회원가입</h2>
				</section>
				<section class="section02 section">
					
					<div class="form_box">
						<div class="tit_box">
							<h3>정보입력</h3>
							<span>메이크샵 가입을 위해 정보를 입력해주세요.<br class="mo_ver">입력해주신 정보는 판매자 계정으로 활용됩니다.</span>
						</div>
						<fieldset>
							<legend>쇼핑몰 개설 정보 입력</legend>

                            <label for="user_pw_n1" class="input_box shop_name">
                                <span class="tit">이름</span>
                                <input type="name" name="o_name" id="o_name" class="input_text" maxlength="10" placeholder="판매자 이름을 입력해주세요."  />
                            </label>

                            <label for="user_email_n1" class="input_box shop_email">
                                <span class="tit">이메일</span>
                                <div class="address_line address_line01 user_b">
                                    <input type="text" name="o_email" id="o_email" class="input_text"  placeholder="이메일을 입력해주세요."/>
                                    <input type="button" class="user_btn" value="인증번호발송"   onclick="sendNumber();">
                                </div>
                                
                                <div id="mail_number" name="mail_number" style="display: none">
                                    <input type="text" name="number" id="number" style="width: 250px; margin-top: -10px" placeholder="인증번호 입력">
                                    <button type="button" name="confirmBtn" id="confirmBtn" onclick="confirmNumber()">이메일 인증</button>
                                    <input type="hidden" id="Confirm" value="">
                                    <input type="hidden" id="email_error" value="1">
                                </div>
                                
                            </label>

                            
                            	<label for="o_id" class="address_wrap input_box shop_id">
								<span class="tit">쇼핑몰 ID &nbsp;</span>
								<div class="address_line address_line01 user_b">
									<input type="text" name="o_id" id="o_id" class="input_text" placeholder="쇼핑몰 ID를 입력해주세요." maxlength="10" />
								</div>
								<!--span class="pw_txt err_message">영문(소문자), 숫자 사용가능 4~10자리로 입력해주세요.</span-->
								<span id="id_error" class="err_message">쇼핑몰 ID을 중복체크 해주세요.</span>
							    </label>
                            

							<div class="row_box f_b">
								<label for="user_pw_n1" class="user_pw_n1 input_box">
									<span class="tit">비밀번호</span>
									<input type="password" name="o_pwd" id="o_pwd" class="input_text" maxlength="16" placeholder="비밀번호를 입력해주세요."  />
									<span class="pw_txt err_message">영문, 숫자를 혼용하여 10~16자리로 입력해주세요.</span>
								</label>
								<label for="user_pw_n2" class="user_pw_n2 input_box">
									<span class="tit">비밀번호 확인</span>
									<input type="password"  id="o_pwd2" class="input_text" maxlength="16" placeholder="비밀번호를 확인해주세요."  />
									<span id="re_password_error" class="err_message">비밀번호가 일치하지 않습니다.</span>
								</label>
							</div>

                            <div class="seperator">
                                <label>주소 : </label>
                                <input class="form-control" name="o_addr" id="o_addr" >
                                <input class="btn  btn-info" type="button"  value="검색" onclick="find_addr();" >
                             </div>


							<!-- <div class="user_email input_box">
								<span class="tit">이메일</span>
								<div class="user_b">
									<label for="user_email1" class="input_email"><input type="text" name="email1" id="o_email" class="input_text" maxlength='15'  /></label>
									<span>@</span>
									<label for="user_email2" class="input_email input_email_append"><input type="text" name="email2" id="o_email" class="input_text" maxlength='18' ></label>
									<div class="user_select" id="user_email_select">
										<button type="button" class="user_btn" onclick="send_Number();">이메일인증받기</button>

									</div>
								</div>
								<span id="email_error" class="err_message">이메일 주소를 다시 확인해주세요.</span>
							</div> -->

							<div class="phone_box input_box">
								<label for="user_num1" class="user_num">
									<span class="tit">휴대폰번호</span>
								</label>
								<div class="phone_box_container f_c">
                                    <input type="hidden" name="o_tel"  id="o_tel" >
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
                        <input class="btn_ver btn_ver1" type="button" value="프리미엄 회원가입" onclick="send(this.form);" return false;>
					</div>
				</section>
			</form>
        </div>
    </main> 
</body>
</html>