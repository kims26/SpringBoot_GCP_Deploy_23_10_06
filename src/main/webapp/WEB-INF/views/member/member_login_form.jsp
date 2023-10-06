<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html lang="en" style="--tabLeftPos: -19px;">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width">
	<meta name="format-detection" content="telephone=no">
	<link rel="icon" href="./img/common/makeshop_favicon.ico">
	<link rel="apple-touch-icon" href="./img/common/appstoreicon.jpg">
    <title>로그인폼</title>



        
<link rel="stylesheet" href="../../css/login_page.css">
<link rel="stylesheet" href="../../css/reset.css">





<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<script type="text/javascript">

    function send(f){
        
        var mem_id	= f.mem_id.value.trim();
        var mem_pwd	= f.mem_pwd.value.trim();
        
        if(mem_id==''){
            
            alert('아이디를 입력하세요');
            f.mem_id.value='';
            f.mem_id.focus();
            return;
        }
        
        if(mem_pwd==''){
            
            alert('비밀번호를 입력하세요');
            f.mem_pwd.value='';
            f.mem_pwd.focus();
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
            alert('아이디가 없습니다.'); 
        }
        
        //login_form.do?reason=fail_pwd
        if("${ param.reason eq 'fail_pwd' }" == "true"){
            alert('비밀번호가 틀렸습니다.'); 
        }		   
        
        //login_form.do?reason=fail_session_timeout
        if("${ param.reason eq 'fail_session_timeout' }" == "true"){
                alert('로그아웃되었습니다\n로그인후에 이용하세요.'); 
        }		   
        
    }
    
    
</script>


    

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
                                    <img src="img/sub/member/icon_tab_cursor.png" alt=""/>
                                </div>
                            </div>
                        </div>
                        <ul class="tab_ul login-tab">
                            <li class="tab_li on" data-type="main"style="background-color: #1954db; border-radius: 10px; color: white; margin-left: 30px; ">일반회원</li>
                            <li class="tab_li" data-type="sub"onclick="location.href='../owner/login_form.do'">판매자회원</li>

                            <input type="hidden" name="admin_type" value="main" id="rdo_mk">
                        </ul>
                    </div>
                </div>
                                <iframe name="hiddenlogin" style="display:none" src="blank.html"></iframe>
                <div class="tab_content">
                    <div id="frmMaster" class="tab_content_li on">
                        <form id="loginform" class="form_box" name="loginform" action="newlogin.html" method="POST" target="hiddenlogin" onsubmit="return false">
                            <input type="hidden" name="type" />
                            <input type="hidden" name="easypass" value="" />
                            <input type="hidden" id="suburl" name="suburl" value="" />
                            <input type="hidden" id="onmenutype" name="onmenutype" value="" />
                            <input type="hidden" name="smslogin_key" value="smslogin" />
                            <input type="hidden" name="ret_type" value="smslogin_send" />
                            
                            <fieldset>
                                <legend>일반회원 로그인폼</legend>
                                <label for="id" class="input_box">
                                    <span class="tit">아이디</span>
                                    <input type="text" name="mem_id" value="${ param.mem_id }" id="mem_id" class="input_text" placeholder="아이디를 입력하세요.">
                                </label>
                                <label for="password" class="input_box type-password ">
                                    <span class="tit">비밀번호</span>
                                    <input type="password" name="mem_pwd" value="${ param.mem_pwd }" id="mem_pwd" class="input_text enterMaster" placeholder="비밀번호를 입력하세요.">
                                </label>

                                
                                
                                <div class="check_line d-chk">
                                    <div class="f_cs">
                                        <label for="id_save" class="check_box">
                                            <input type="checkbox" name="idsave" id="id_save" value="Y" class="input_checkbox">
                                            <span class="tit f_cs">아이디 저장</span>
                                        </label>
                                        
                                    </div>
                                    
                                </div>
                                <button class="btn_ver btn_ver1 f_c login btn_login" type="submit" id="login_btn" onclick="send(this.form); return false;">일반회원 로그인</button>
                            </fieldset>
                        </form>
                        <c:if test="${userId eq null}">
                                <a href="${url}"><img width="223" style="margin-left: 28%; margin-bottom: 10px; margin-top: -15px; " src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a>
                        </c:if>
                    </div>
                    
                <p class="join_txt">이지차징, 이브이차징 <a href="insert_form.do" class="highlight_text">이브이차징 가입하기</a></p>
            </section>

        </div>
    </main>
</form>
</body>

<script type="text/javascript" async="" src="https://www.googletagmanager.com/gtag/js?id=G-2C3022PYFD&amp;cx=c&amp;_slc=1"></script><script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script><script type="text/javascript" async="" src="https://www.googletagmanager.com/gtag/js?id=G-7NS7KV1CKM&amp;l=dataLayer&amp;cx=c"></script><script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-5Q54BN2"></script><script async="" defer="" src="https://cdn.megadata.co.kr/dist/prod/enp_tracker_makeshop_d4.min.js"></script><script async="" charset="utf-8" src="//static.dable.io/dist/dablena.min.js"></script><script src="https://connect.facebook.net/signals/config/142690422987779?v=2.9.124&amp;r=stable&amp;domain=www.makeshop.co.kr" async=""></script><script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script><script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-NMJ88XR"></script><script type="text/javascript" src="./js/jquery-1.12.4.min.js"></script>
