<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/main_header.css">
<link rel="stylesheet" type="text/css" href="../../../css/m_menu.css">

<link rel="stylesheet" type="text/css" href="../css/main_footer.css">
<link rel="stylesheet" type="text/css" href="../css/main.css">
<link rel="stylesheet" type="text/css" href="../css/search.css">
<link rel="stylesheet" type="text/css" href="../css/search_responsive.css">
<link rel="stylesheet" type="text/css" href="../../../css/responsive.css">
<link rel="stylesheet" type="text/css" href="../../../css/product_mypage.css">
<!-- Bootstrap3.x 설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
  #box{
     width: 1100px;
     margin: auto;
     margin-top: 30px;
  }
  
  #title{
     text-align: center;
     font-size: 28px;
     font-weight: bold;
     
     color: green;
     text-shadow: 1px 1px 3px black;
  }
  
  #empty_message{
     text-align: center;
     margin-top: 200px;
     color : red;
     font-weight: bold;
     font-size: 26px;
  }

  #container {
    position: relative;
    z-index: 20;
    max-width: 954px;
    height: 100%;
    margin: 0 auto;
        overflow: hidden;
}

#content {
    position: relative;
    padding: 32px 51px 95px;
   
}

.c_header {
    padding-bottom: 43px;
}

.c_header h2 {
    font-size: 20px;
    line-height: 22px;
    position: relative;
    color: #333;
}

.c_header .contxt {
    line-height: 19px;
    padding-top: 10px;
    color: #666;
}

.tbl_model {
   position: relative;
   width: 100%;
   table-layout: fixed;
   border-spacing: 0;
   border-collapse: collapse;
   word-wrap: break-word;
   word-break: keep-all;
   border: 0;
   border-bottom: 1px solid #e5e5e5;
   border-top: 1px solid #e5e5e5;
}

.blind, legend {
    position: absolute;
    clip: rect(0 0 0 0);
    width: 1px;
    height: 1px;
    margin: -1px;
    overflow: hidden;
}

.tbl_model th {
    color: #333;
    border-right: 1px solid #e5e5e5;    
    background: #f9f9f9;
}

.tbl_model .thcell {
    padding: 32px 31px 32px;
}

.tbl_model td {
   padding: 15px;
    color: #565656;
}
#heard_line{

    border-bottom: 1px solid #e5e5e5;

}

</style>


<script type="text/javascript">

  function del(mem_idx){
	  
	  
	  if(confirm("정말삭제하시겠습니까?")==false)return;
	  
	  location.href="delete.do?mem_idx=" + mem_idx
	  
  }

</script>


</head>
<body>
   <%@ include file="../main/header.jsp" %>
   

   <div id="container" style="height: auto;">
		<!-- CONTENTS -->
		<div id="content" style="background-color: #fff;">
    <div class="c_header">
        <h2>프로필 수정</h2>
        <p class="contxt">나의 정보를 수정 하실 수 있습니다.</p>
    </div>
    <form id="profileForm" method="post" enctype="multipart/form-data">
        <input type="hidden" id="helpToken" name="token_help" value="U3QdbckSXIH2haz2">
        <input type="hidden" id="deleteYn" name="deleteYn" value="N">
        <input type="hidden" id="ieLessThan9Yn" name="ieLessThan9Yn" value="N">
        <div class="header_line"></div>
        <fieldset>
            <legend>프로필 수정</legend>
            <table border="0" class="tbl_model">
                <caption><span class="blind">프로필 수정</span></caption>
                <colgroup>
                    <col style="width:22%"><col>
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">
                        <div class="thcell">회원 정보</div>
                    </th>
                    <td>
                        <div><img id="imgThumb" src="https://static.nid.naver.com/images/web/user/default.png?type=s160" width="100" height="100" style="padding: 10px;"></div>
                        <div>회&nbsp;&nbsp;&nbsp;원&nbsp;&nbsp;&nbsp;명 :&nbsp;&nbsp; <input class="form-inline" name="mem_name" readonly="readonly" value="${ vo.mem_name }"></div>
                        <br>
                        <div>아&nbsp;&nbsp;&nbsp;이&nbsp;&nbsp;&nbsp;디 :&nbsp;&nbsp; <input class="form-inline" name="mem_id" readonly="readonly" value="${ vo.mem_id }"></div>
                        <br>
                        <div>전화번호 :&nbsp;&nbsp; <input class="form-inline" name="mem_tel" readonly="readonly" value="${ vo.mem_tel }"></div>
                        <br>
                        <div>충전타입 :&nbsp;&nbsp; <input class="form-inline" name="mem_type" readonly="readonly" value="${ vo.mem_type }"></div>
                        <br>
                        <div>우편번호 :&nbsp;&nbsp; <input class="form-inline" name="mem_zipcode" readonly="readonly" value="${ vo.mem_zipcode }"></div>
                        <br>
                        <div>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소  :&nbsp;&nbsp; <input class="form-inline" name="mem_addr" readonly="readonly" value="${ vo.mem_addr }"></div>                              
                        <br>                 
                    </td>
                  </tr>
                </tbody>
            </table>
            
        </fieldset>
        <td>
         <!-- 관리자이거나 로그인사용자 본인일경우만 -->
            <div class="textBox" >
             <input class="textBox__del"  id="box_del"  type="button"  value="수정"
                    onclick="location.href='modify_form.do?mem_idx=${ vo.mem_idx }'">
                    
             <input class="textBox__del" type="button"  value="회원탈퇴"
                    onclick="del('${ vo.mem_idx }');" >
            </div>
         </td>
        
    </form>
    <div class="product_order_list">
        <div class="order_list_tit">
            <h2>내 주문내역 확인</h2>
            <p class="contxt">하단 버튼을 클릭하시면 주문내역으로 이동합니다.</p>
        </div>
        <div class="con_service_btn">
            <a href="../member/order.do" class="btn f_b" target="_blank">
                <span class="txt">확인하기</span>
                <span class="icon"></span>
            </a>
        </div>
    </div>
      </div>


  


   
</div>

<%@ include file="../main/footer.jsp" %>

</body>
</html>