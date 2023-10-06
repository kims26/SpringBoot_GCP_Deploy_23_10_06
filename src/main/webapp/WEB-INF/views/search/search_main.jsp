<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../../../css/main.css">
	<link rel="stylesheet" type="text/css" href="../css/m_menu.css">
	<link rel="stylesheet" type="text/css" href="../css/main_header.css">
	<link rel="stylesheet" type="text/css" href="../css/main.css">
    <link rel="stylesheet" type="text/css" href="../../../css/search.css">
    <link rel="stylesheet" type="text/css" href="../../../css/search_responsive.css">
    <link rel="stylesheet" type="text/css" href="../../../css/responsive.css">

	   
   <!-- Bootstrap3.x 설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="keyword_info_box">
        <div class="search_keyword">
            <div class="inner">
                 <div class="keyword_search_bg">
                     <form class="form-control" id="search_board" name="search_form" action="" onsubmit="return false;">
                        <div class="keyword_search">
                            <input type="search" id="search_text" onkeyup="enterkey();" name="keyword"  value="${param.search_text}"
							 placeholder="키워드를 입력해주세요." >
                            <button type="button" id="top_search_btn" value="검색"
                            onclick="search_f();"><img src="../images/search.png" alt="찾기 아이콘"></button>
                         </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    

function search_f() {


let search = $("#search_board").val();
let search_text = $("#search_text").val().trim();

if (search != 'all') {// 전체검색이 아니면

	if (search_text == '') {

		alert('검색어를 입력하세요~~');
		$("#search_text").val("");//값지우기
		$("#search_text").focus();
		return;
	}
}
//전체검색이면 검색어 지우기
if (search == "all") {

	$("#search_text").val("");
	search_text = "";
}

//console.log(location.href)

//if(location.href.indexOf("list.do")>0){
location.href = "../board/list.do?search="+search+"&search_text="+encodeURIComponent(search_text);
//}else{
//   location.href="view.do?b_idx=${param.b_idx}&search="+search+"&search_text="+encodeURIComponent(search_text);
// }
}
function enterkey() {
        if (window.event.keyCode == 13) {
 
             // 엔터키가 눌렸을 때 실행할 내용
             search_f();
        }
}
// 검색창 드롭다운

const searchBtn = document.getElementById("search_btn_pc");
const searchBtnMo = document.getElementById("search_btn_mo");
const keywordBox = document.querySelector(".keyword_info_box");
const searchBtnAll = document.querySelectorAll(".header .search_btn");
const header = document.getElementById("header");
const topSearchBtn = document.getElementById("top_search_btn");

searchBtn.onclick = function(){
    if(keywordBox.classList.contains("on")) {
        keywordBox.classList.remove("on");
    }else {
        keywordBox.classList.add("on");
    }
}

searchBtnMo.onclick = function(){
    if(keywordBox.classList.contains("on")) {
        keywordBox.classList.remove("on");
    }else {
        keywordBox.classList.add("on");
    }
}


</script>


</html>