<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Final Project</title>
    <link rel="stylesheet" type="text/css" href="../css/reset.css">
    <link rel="stylesheet" type="text/css" href="../css/main_header.css">
    <link rel="stylesheet" type="text/css" href="../css/main_footer.css">
    <link rel="stylesheet" type="text/css" href="../css/main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

</head>
    
    <div class="header">
		<div class="inner">
			<h1>
                <a href="">
                    <img src="" alt="피씨로고" class="pc_ver">
                    <img src="" alt="모바일로고" class="mo_ver">
                </a>
            </h1>
           
            <nav class="menu_pc">
                <ul id="gnb" class="main_gnb">
                    <li class="depth1">
                        <a href="">충전소조회</a>
                    </li>
                    </li>
                    <li class="depth1">
                        <a href="">스토어</a>
                    </li>
                    <li class="depth1">
                        <a href="">게시판</a>
                    </li>
                </ul>
                <ul class="gnb_sub">
                    <li class="depth1 on">
                        <a href="">스토어</a>
                        <ul class="depth2">
                            <li class="sub_menu">
                                <ul>
                                    <li><a href="">쇼핑몰 관련 메뉴1</a></li>
                                    <li><a href="">쇼핑몰 관련 메뉴2</a></li>
                                    <li><a href="">쇼핑몰 관련 메뉴3</a></li>
                                    <li><a href="">쇼핑몰 관련 메뉴4</a></li>
                                    <li><a href="">쇼핑몰 관련 메뉴5</a></li>
                                    <li><a href="">쇼핑몰 관련 메뉴6</a></li>
                                </ul>
                            </li>
                           
                            <li class="depth1 on"></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <div class="search_b_all">
                <div class="search_login_out">
                  <a href="" class="login_btn">로그인 / 회원가입</a>
                  <!-- <a href="" class="join_btn">회원가입</a> -->
                  <button type="button" id="search_btn_pc" class="search_btn">
                  <img src="../images/search.png" alt="찾기버튼" class="search"></button>
                </div>
            </div>
            
        </div>
    </div>
    <main id="contaniner" class="main">
        <!-- notice layer -->
        
        <!-- visual layer -->
        
        <!-- sec01 -->
        <section class="section sec01 on">
            <div class="inner">
                <div class="left-txt-box">
                    <h2>가장&nbsp;빠른<br class="mo_ver"><span class="change-col-txt">전기차 충전소</span><br class="pc_ver">찾기</h2>
                    <p>쉽고 편리한 충전을 시작하세요!</p>
                    <a class="start-btn" href="">START NOW</a>
                </div>
                <div class="visual-mobile">
                    <p class="mobile-img"><img src="" alt="이미지"></p>
                    <p class="mobile-shadow"><img src="" alt="이미지"></p>
                    <div class="mobile-screen-rolling">
                        <ul class="rollingSlideBox">
                            <li class="rollingSlide rolling01"><img src="" alt="이미지"></li>
                            <li class="rollingSlide rolling02"><img src="" alt="이미지"></li>
                        </ul>
                    </div>
                </div>
                <ul class="visual-circle">
                    <li class="Vcircle circle01"></li>
                    <li class="Vcircle circle02"></li>
                    <li class="Vcircle circle03"></li>
                    <li class="Vcircle circle04"></li>
                </ul>
            </div>
        </section>
        <div class="footer">
            <div class="inner">
                <div class="info_f">
                    <ul class="sns-con">
                        <li><a href="https://www.facebook.com/makemoney.makeshop/" target="_blank"><img src="img/common/icon_sns_facebook.png" alt="sns 페이스북"></a></li>
                        <li><a href="https://www.instagram.com/makemoney.makeshop/" target="_blank"><img src="img/common/icon_sns_insta.png" alt="sns 인스타그램"></a></li>
                        <li><a href="https://blog.naver.com/makeshop_official" target="_blank"><img src="img/common/icon_sns_blog.png" alt="sns 블로그"></a></li>
                        <li><a href="https://www.youtube.com/@Makeshop_" target="_blank"><img src="img/common/icon_sns_youtube.png" alt="sns 유튜브"></a></li>
                        <li><a href="https://m.post.naver.com/cocen2022?isHome=1" target="_blank"><img src="img/common/icon_sns_naver.png" alt="sns 네이버"></a></li>
                    </ul>
                    <div class="info_desc">
                        <p class="copy">Copyright(C) 2023. All Rights Reserved</p>
                        <div class="info_f_link_box n1">
                            <div class="info_f_link">
                                <a href="" class="terms">이용약관</a>
                                <a href="">통합회원약관</a>
                            </div>
                            <div class="info_f_link n2">
                                <a class="privacy_txt" href="">개인정보처리방침</a>
                                <a href="">이메일</a>
                                <a href="">제휴문의</a>
                                <a href="" target="_blank">개발자센터</a>
                            </div>
                        </div>
                      
                    </div>
                </div>
            </div>
        </div>
   
</div>
</body>
<script src="../../java/FinalProject/demo_final/main.js"></script>
</html>