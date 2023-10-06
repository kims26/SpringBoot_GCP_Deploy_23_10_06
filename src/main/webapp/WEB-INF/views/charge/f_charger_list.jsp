<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8' %>

<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
	function del(f_idx){

		if(confirm("정말 삭제하시겠습니까?")==false)return;

		$.ajax({

			url : "favorite_delete.do",
			data : { "f_idx" : f_idx },
			success: function(res_data){
				if(res_data.result=="success"){
                	f_list();
            	}
			},
			error: function(err){
				alert(err.status);
			}
		});

	}
	
	function find_marker(f_lat, f_longi){	
		
		var f_marker = naver.maps.LatLng(f_lat, f_longi);
		
		map.panTo(f_marker);

	}
	

		function f_btn_hide(){
			$("#box").slideUp();
			setTimeout(() => {
				$('#btn_open').css('display', 'block');
			},500);
		}

		function f_btn_visi(){
			$("#box").slideDown();
			$('#btn_open').css('display', 'none');
			
		}

		
	
		
	

</script>

<style>
#menu > th {
	text-align: center;
}

#category > td {
	text-align: center;
}




</style>

</head>
<body>
<div><input class="btn btn-info" id="btn_open" type="button" value="펼치기" style="float:right; z-index: 1; display: none;" onclick="f_btn_visi();"></div>
  <div id="box" style="z-index: 10;">
    <div class="panel panel-primary">
      <div class="panel-heading" style="text-align: center;" >
	  		<span>
				<input class="btn btn-info" type="button" style="float:left; margin-top: -9px; margin-left: -13px;" value="접기" onclick="f_btn_hide();">
			</span>즐겨찾기
	  </div>
      <div class="panel-body">
		<table class="table table-striped" border="1">
			<tr class="success" id="menu">
				<th>번호</th>
				<th>충전소명</th>
                <th>충전소주소</th>
                <th>충전방식</th>
				<th>충전타입</th>			
				<!-- <th>충전기상태코드(갱신시각)</th> -->
				<th>비고</th>
			</tr>
			
			<c:forEach var="vo" items="${ f_list }">
				
				<tr id="category">
					<td>${vo.count}</td>
					<!-- 충전소명 -->
					<!-- <td><a onclick="move(${vo.marker_idx})">${ vo.csNm }</a></td> -->
					<td><a onclick="find_marker('${vo.f_lat}', '${vo.f_longi}');">${ vo.csNm }</a></td>
					<!-- 충전소주소 -->
					<td>${ vo.addr }</td>

					<!-- 충전방식 -->
					<c:if test="${ vo.cpTp == 1 }">
						<td>B타입(5핀)</td>
					</c:if>
					<c:if test="${ vo.cpTp == 2 }">
						<td>C타입(5핀)</td>
					</c:if>
					<c:if test="${ vo.cpTp == 3 }">	
						<td>BC타입(5핀)</td>
					</c:if>
					<c:if test="${ vo.cpTp == 4 }">
						<td>BC타입(7핀)</td>
					</c:if>
					<c:if test="${ vo.cpTp == 5 }">
						<td>DC차데모</td>
					</c:if>
					<c:if test="${ vo.cpTp == 6 }">
						<td>AC3상</td>
					</c:if>
					<c:if test="${ vo.cpTp == 7 }">
						<td>DC콤보</td>
					</c:if>
					<c:if test="${ vo.cpTp == 8 }">
						<td>DC차데모 + DC콤보</td>
					</c:if>
					<c:if test="${ vo.cpTp == 9 }">
						<td>DC차데모 + AC3상</td>
					</c:if>
					<c:if test="${ vo.cpTp == 10 }">
						<td>DC차데모 + DC콤보 + AC3상</td>
					</c:if>
					
					<!-- 충전타입 -->
					<c:if test="${ vo.chargeTp == 1 }">
						<td>완속</td>
					</c:if>
					<c:if test="${ vo.chargeTp == 2 }">
						<td>급속</td>
					</c:if>

					<!-- 충전상태코드
					<c:if test="${ vo.cpStat == 0 }">
						<td>상태확인불가(${ vo.statUpdateDatetime })</td>
					</c:if>
					<c:if test="${ vo.cpStat == 1 }">
						<td>충전가능(${ vo.statUpdateDatetime })</td>
					</c:if>
					<c:if test="${ vo.cpStat == 2 }">
						<td>충전중(${ vo.statUpdateDatetime })</td>
					</c:if>
					<c:if test="${ vo.cpStat == 3 }">
						<td style="background-color: red; color: white;">고장/점검(${ vo.statUpdateDatetime })</td>
					</c:if>
					<c:if test="${ vo.cpStat == 4 }">
						<td>통신장애(${ vo.statUpdateDatetime })</td>
					</c:if>
					<c:if test="${ vo.cpStat == 9 }">
						<td>충전예약(${ vo.statUpdateDatetime })</td>
					</c:if> -->

					<td><input class="btn btn-danger" type="button" value="삭제" onclick="del('${vo.f_idx}');"></td>
				</tr>
			</c:forEach>
			
		</table>
	</div>
	</div>
</div>
</body>
</html>