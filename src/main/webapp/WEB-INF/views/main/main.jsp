<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-scroll">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Final Project</title>
    <link rel="stylesheet" type="text/css" href="../css/reset.css">
    <link rel="stylesheet" type="text/css" href="../css/main_header.css">
    <link rel="stylesheet" type="text/css" href="../../../css/m_menu.css">
 
    <link rel="stylesheet" type="text/css" href="../css/main_footer.css">
    <link rel="stylesheet" type="text/css" href="../css/main.css">
    <link rel="stylesheet" type="text/css" href="../css/search.css">
    <link rel="stylesheet" type="text/css" href="../css/search_responsive.css">
    <link rel="stylesheet" type="text/css" href="../../../css/responsive.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

</head>
<body>
    <%@ include file="header.jsp" %>

    <%@ include file="../search/search_main.jsp" %>

    <main id="contaniner" class="main">
        <!-- notice layer -->
        
        <!-- visual layer -->
        
        <!-- sec01 -->
        <section class="section sec01 on">
            <div class="inner">
                <div class="left-txt-box">
                    <h2>가장&nbsp;빠른<br class="mo_ver"><span class="change-col-txt">전기차 충전소</span>
                        <!-- <br class="pc_ver" > -->
                        찾기
                    </h2>
                    <p>쉽고 편리한 충전을 시작하세요!</p>
                    <a class="start-btn" href="../charge/map.do">START NOW</a>
                </div>
                <div class="visual-mobile">
                    <p class="mobile-img"><img src="..//images/main_visual_mobile.png" alt="이미지"></p>
                    <p class="mobile-shadow"><img src="../images/main_visual_mobile_shadow.png" alt="이미지"></p>
                    <div class="mobile-screen-rolling">
                        <ul class="rollingSlideBox">
                            <li class="rollingSlide rolling01"><img src="../../../images/main_vs_photo.png" alt="이미지"></li>
                            <li class="rollingSlide rolling02"><img src="../../../images/main_vs_photo.png" alt="이미지"></li>
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
       
       </main>
     
       
       <%@ include file="footer.jsp" %>

</body>

<!-- <script src="../../java/FinalProject/demo_final/main.js"></script> -->
<script>
    
// Animation for visual slides
const slides = document.querySelector('.rollingSlideBox');
function animateSlides() {
	slides.classList.add('active');
	setTimeout(() => {
		slides.classList.remove('active');
	}, 15590);
}
animateSlides();
setInterval(animateSlides, 16000);

//메인슬라이드 circle 
const circle = document.querySelector('.visual-circle');
function animateCircle() {
	circle.classList.add('circle-on');
	setTimeout(() => {
		circle.classList.remove('circle-on');
	}, 15500);
}
animateCircle();
setInterval(animateCircle, 16000);


// Animation for text color
const txtCol = document.querySelector('.change-col-txt');
function animateTextColor() {
	txtCol.classList.add('txt-on');
	setTimeout(() => {
		txtCol.classList.remove('txt-on');
	}, 15500);
}
animateTextColor();
setInterval(animateTextColor, 16000);

 


</script>

    <script>

// mo gnb 메뉴 호출 
let btn = document.querySelector('.btn_call');
let login_btn = document.querySelector('.search_login_out');
let login_btn1 = document.querySelector('.login_btn');
let menuMo = document.querySelector('.menu_mo');
let fullpage = document.querySelector('html');
if(btn){
    btn.onclick = function () {
        btn.classList.toggle('on');
        menuMo.classList.toggle('on');
       
		fullpage.classList.toggle('no-scroll')
    }
}






    </script>
    <!-- <script src="../../../js/main.js"></script> -->
</html>