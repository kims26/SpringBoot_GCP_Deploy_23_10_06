<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

	<link rel="stylesheet" type="text/css" href="../css/reset.css">
    <link rel="stylesheet" type="text/css" href="../css/main_header.css">

    <link rel="stylesheet" type="text/css" href="../css/main_footer.css">
   
    <link rel="stylesheet" type="text/css" href="../css/main.css">
    <link rel="stylesheet" type="text/css" href="../css/search.css">
    <link rel="stylesheet" type="text/css" href="../css/search_responsive.css">
    <link rel="stylesheet" type="text/css" href="../../../css/responsive.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
   
    <style>
    .collapsible {
    position: relative;
    right: 0;
    display: block;
    width: 3rem;
    height: 3rem;
    border-radius: 0.6rem;
    background: #e4eefe;
    position: relative;
    margin-right: 1rem !important;
    }
    
    .active, .collapsible:hover {
      background-color: #555;
    }
    
    .content {
    top: 0;
    height: 0rem;
    position: absolute;
    right: 0;
    padding: 0 18px;
    max-height: 150rem;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
    background-color: #f1f1f1;
    }
    </style>
    </head>
    <body>
  
    <button class="collapsible"></button>
    <div class="content">
     <a href="">충전소 조회</a>
     <a href="../product/list.do">스토어</a>
     <a href="">게시판</a>
    </div>

    <script>
    var coll = document.getElementsByClassName("collapsible");
    var i;
    
    for (i = 0; i < coll.length; i++) {
      coll[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var content = this.nextElementSibling;
        if (content.style.maxHeight){
          content.style.maxHeight = null;
        } else {
          content.style.maxHeight = content.scrollHeight + "px";
        } 
      });
    }
    </script>
    </body>
</html>