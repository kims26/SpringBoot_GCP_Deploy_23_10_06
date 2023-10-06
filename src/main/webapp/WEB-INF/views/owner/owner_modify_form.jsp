<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정하기</title>

<!-- Bootstrap3.x 설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 우편번호검색 -->
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

	function find_addr() {

		new daum.Postcode({
		oncomplete: function (data) {

		$("#o_zipcode").val(data.zonecode);
		$("#o_addr").val(data.address);


			}
		}).open();

	}

	function send(f) {

		var o_name = f.o_name.value.trim();
		var o_pwd = f.o_pwd.value.trim();
		var o_zipcode = f.o_zipcode.value.trim();
		var o_addr = f.o_addr.value.trim();

		if (o_name == '') {
			alert('이름을 입력하세요!!');
			f.o_name.value = '';
			f.o_name.focus();
			return;
		}


		if (o_pwd == '') {
			alert('비밀번호를 입력하세요!!');
			f.o_pwd.value = '';
			f.o_pwd.focus();
			return;
		}

		if (o_addr == '') {
			alert('주소를 입력하세요!!');
			f.o_addr.value = '';
			f.o_addr.focus();
			return;
		}

		if (o_zipcode == ''){
			alert('우편주소를 입력하세요!!');
			f.o_zipcode.value = '';
			f.o_zipcode.focus();
			return;
		}

		f.action = "modify.do";//OwnerModifyAction
		f.submit(); //전송(제출)

	}
</script>

</head>
<body>
	<%@ include file="../main/header.jsp" %>

	<div id="container" style="height: 706px;">
		<!-- CONTENTS -->
		<div id="content" style="background-color: #fff;">
    <div class="c_header">
        <h2>프로필 정보</h2>
        <p class="contxt">나의 정보를 수정 하실 수 있습니다.</p>
    </div>

<form class="form-inline">
<table border="0" class="tbl_model">

	<input type="hidden" name="o_idx" value="${ vo.o_idx }">

	<tbody>  
		<tr>
			<th scope="row" style="width: 200px;">
				<div class="thcell">판매자회원 정보</div>
			</th>
			<td>

				<div>회&nbsp;&nbsp;&nbsp;원&nbsp;&nbsp;&nbsp;명 :&nbsp;&nbsp; <input class="form-inline" name="o_name" value="${ vo.o_name}"></div>
				<br>
				<div>비밀번호 :&nbsp;&nbsp; <input class="form-inline" name="o_pwd" value="${ vo.o_pwd}"></div>
				<br>
				<div>우편번호 :&nbsp;&nbsp; <input class="form-inline" 
						   name="o_zipcode" id="o_zipcode" value="${ vo.o_zipcode }" >
					<input class="btn  btn-info" type="button"  value="검색"
						   onclick="find_addr();" >
				</div>
				 
				<div>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소  :&nbsp;&nbsp; 
					<input class="form-inline" name="o_addr" id="o_addr" size="50" 
						   value="${ vo.o_addr }">
				</div>
				<br>
				<hr>
			</td>
		</tr>
	</tbody>
</table>	
		<hr>
			<div style="text-align: center">
					<input class="btn  btn-primary" type="button" value="회원수정"
						onclick="send(this.form);">

					<input class="btn  btn-success" type="button" value="목록보기"
						onclick="location.href='../product/list.do'">
			</div>
		</div>
	</div>
	
</div>

</form>
<%@ include file="../main/footer.jsp" %>
</body>
</html>