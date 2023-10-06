<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap3.x 설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style type="text/css">
  #box{
     width: 500px;
     margin: auto;
     margin-top: 50px;
  }
  
  .style1{
     margin-bottom: 20px;
  }
  
  textarea {
	 resize: none;
  }
  
  #my_img{
     width: 150px;
     border: 1px solid #cccccc;
     outline: 1px solid black;
     margin-bottom: 10px;
  }
  
  
</style>
  
<script type="text/javascript">
  function send(f){
	  
	  //입력값체크(제목/내용/사진)
     var p_name	= f.p_name.value.trim();  
	  var p_content	= f.p_content.value.trim();
	
     if(p_name==''){
		  alert('내용을 입력하세요!!');
		  f.p_name.value='';
		  f.p_name.focus();
		  return;
	  }
	  
	  if(p_content==''){
		  alert('내용을 입력하세요!!');
		  f.p_content.value='';
		  f.p_content.focus();
		  return;
	  }
	  
	  
	  f.action="modify.do"; //PhotoModifyAction
	  f.submit();//전송
	  
  }

</script>


<!-- Ajax이용하 fileupload처리 함수 -->
<script type="text/javascript">

	function ajaxFileUpload() {
		// 업로드 버튼이 클릭되면 파일 찾기 창을 띄운다.
		$("#ajaxFile").click();
	}

   function ajaxFileUpload2() {
		// 업로드 버튼이 클릭되면 파일 찾기 창을 띄운다.
		$("#ajaxFile2").click();
	}
	


   //첫번째
	function ajaxFileChange() {
		// 파일이 선택되면 업로드를 진행한다.
		product_upload();
	}

   //파일 두번쨰
   function ajaxFileChange2() {
		// 파일이 선택되면 업로드를 진행한다.
		product_upload2();
	}
	
	
	
	
	function product_upload() {
	
	   //파일선택->취소시
	   if( $("#ajaxFile")[0].files[0]==undefined)return;
	   
	    //var form = $("#ajaxForm").[0];
		//var formData = new FormData(form);
		
		//전송되는 Parameter정보
		var formData = new FormData();
		formData.append("p_idx", '${ vo.p_idx }');
		formData.append("product", $("#ajaxFile")[0].files[0]);
	
		$.ajax({
			     url  : "product_upload.do", //PhotoUploadAction
			     type : "POST",
			     data : formData,
			     processData : false, //false : {'p_idx': 3 , 'photo':'a.jpg'}
			                           //true  : p_idx=3&photo=a.jpg
			     contentType : false, // mime-type지정안함
			     dataType : 'json',
			     success:function(result_data) {
				 //result_data = {"p_filename":"aaa.jpg"}
				 //location.href=''; //자신의 페이지를 리로드(refresh)
				 
				 //$("#my_img").attr("src","../upload/" + result_data.p_filename);
				 $("#my_img").prop("src","../upload/" + result_data.p_image_l);
             
			 
		     },
		     error : function(err){
			    alert(err.responseText);
		     }
		});
	
	}

   function product_upload2() {
	
   //파일선택->취소시
   if( $("#ajaxFile2")[0].files[0]==undefined)return;
   
    //var form = $("#ajaxForm").[0];
   //var formData = new FormData(form);
   
   //전송되는 Parameter정보
   var formData = new FormData();
   formData.append("p_idx", '${ vo.p_idx }');
   formData.append("product", $("#ajaxFile2")[0].files[0]);

   $.ajax({
           url  : "product_upload2.do", //PhotoUploadAction
           type : "POST",
           data : formData,
           processData : false, //false : {'p_idx': 3 , 'photo':'a.jpg'}
                                 //true  : p_idx=3&photo=a.jpg
           contentType : false, // mime-type지정안함
           dataType : 'json',
           success:function(result_data2) {
          //result_data = {"p_filename":"aaa.jpg"}
          //location.href=''; //자신의 페이지를 리로드(refresh)
          
          //$("#my_img").attr("src","../upload/" + result_data.p_filename);
          $("#my_img").prop("src","../upload/" + result_data2.p_image_s);
          
       
        },
        error : function(err){
          alert(err.responseText);
        }
   });

}

	
	
</script>


</head>
<body>

<!--화일업로드용 폼(숨김)  
    Ajax통신시 생략가능 =>enctype="multipart/form-data" -->


    
<form id="ajaxForm" method="post" enctype="multipart/form-data"  >
    <input type="file" id="ajaxFile" style="display:none;" 
           onChange="ajaxFileChange();" >
</form>

<form id="ajaxForm" method="post" enctype="multipart/form-data"  >
   <input type="file" id="ajaxFile" style="display:none;" 
          onChange="ajaxFileChange2();" >
</form>

<form>

   <input type="hidden" name="p_idx"  value="${ vo.p_idx }">
   <input type="hidden" name="o_idx"  value="${ vo.o_idx }">
  
  <div id="box">
    <div class="panel panel-primary">
      <div class="panel-heading"><h4>수정폼</h4></div>
      <div class="panel-body">
         
         <hr>
         
         <div class="style1"  style="text-align: center;">
            
            <img src="../upload/${ vo.p_image_l }" id="my_img">
			<br>
			<input  class="btn  btn-info" type="button"  
			        value="이미지편집"  
			        onclick="ajaxFileUpload();">
            
         </div>

         <div class="style1"  style="text-align: center;">
            
            <img src="../upload/${ vo.p_image_s }" id="my_img">
			<br>
			<input  class="btn  btn-info" type="button"  
			        value="이미지편집"  
			        onclick="ajaxFileUpload2();">
            
         </div>
         
         <hr>
         
         <div class="style1">
            <label>상품이름</label>
            <input class="form-control" name="p_name"  value="${ vo.p_name }">
         </div>
         <div class="style1">
            <label>세일가격</label>
            <input class="form-control" name="p_saleprice"  value="${ vo.p_saleprice }">
         </div>
		 <div class="style1">
            <label>가격</label>
            <input class="form-control" name="p_price"  value="${ vo.p_price }">
         </div>
         <div class="style1">
            <label>내용</label>
            <textarea class="form-control" name="p_content" rows="5" cols="">${ vo.p_content }</textarea>
         </div>
         
        
         <div style="text-align: center;">
              <input class="btn  btn-primary" type="button"  value="수정하기"
                     onclick="send(this.form);">
              <input class="btn  btn-success" type="button"  value="목록보기"
                     onclick="location.href='list.do'">
         </div>
      </div>
    </div>
  </div>
  
</form> 
  
</body>
</html>