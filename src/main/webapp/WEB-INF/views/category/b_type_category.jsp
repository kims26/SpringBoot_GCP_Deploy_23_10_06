<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>btype</title>
   <link href="../css/index.css?after" rel="stylesheet" />


   
   <!-- Bootstrap3.x 설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<script type="text/javascript">

   function page_form(p_idx){
	  
	  // PhotoModifyFormAction
	  location.href="../product/page_list.do?p_idx=" + p_idx;
	  
  }
  


</script>




</head>

<body>
  <input type="hidden" name="p_idx"  value="${ vo.p_idx }">

  <section class="mainBanner">
    <h1 class="text">
     A-Type
    </h1>
  </section>

  <div class="container">
    <section class="wrapper">
      <div class="sidebar">
        <nav class="mainMenu">
          <ul>
            <li><a href="/product/list.do">All Items</a></li>
            <li><a href="">Best Items</a></li>
            <li><a href="/category/a_type_list.do">A-Type</a></li>
            <li><a href="/category/b_type_list.do">B-Type</a></li>
            <li><a href="/category/c_type_list.do">C-Type</a></li>
            <li><a href="">세일 상품</a></li>
          </ul>
        </nav>

 
</body>

</html>

