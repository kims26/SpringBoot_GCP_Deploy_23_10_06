<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품등록</title>

    <link href="../css/index.css?after" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style type="text/css">

#box{
     width: 1200px;
     height: 200px;
     margin: auto;
     margin-top: 60px;
	 justify-content: center;
	
  }
  
  label{
     margin-left: 10px;
     display: inline-block;
     width: 100px;
     text-align: right;
     
  }
  
  #id_message{
     display: inline-block;
     width: 200px;
     color : red;
     margin-left: 5px;
  }
  
  .seperator{
    margin-bottom: 10px;
  }


</style>

<script type="text/javascript">
    function send(f){
	 
	 //입력항목 체크
	 var p_name 		= f.p_name.value.trim();
     var p_price 		= f.p_price.value.trim();
	 var p_saleprice    = f.p_saleprice.value.trim();
	 var p_content 	    = f.p_content.value.trim();
	 var category_idx 	= f.category_idx.value.trim();


	 if(p_name==''){
		 alert('p_name을 입력하세요!!');
		 f.p_name.value='';
		 f.p_name.focus();
		 return;
	 }

     if(p_price==''){
		 alert('p_price 입력하세요!!');
		 f.p_price.value='';
		 f.p_price.focus();
		 return;
	 }
	 
	 if(p_saleprice==''){
		 alert('p_saleprice를 입력하세요!!');
		 f.p_saleprice.value='';
		 f.p_saleprice.focus();
		 return;
	 }
	 
	 if(p_content==''){
		 alert('p_content를 입력하세요!!');
		 f.p_content.value='';
		 f.p_content.focus();
		 return;
	 }	 
    
	 f.action = "insert.do";//MemberInsertAction
	 f.submit(); //전송(제출)
	 
 }

    </script> 



</script>

</head>

<body>
	<%@ include file="../main/header.jsp" %>
  <h5 style="    text-align: center;
             font-size: 40px; font-weight: bold; margin-bottom: 30px;" >  전기차 스토어 </h5>

	
      <form class="form-inline"  method="POST" enctype="multipart/form-data">
        <div id="box">
		
			<input type="hidden"  name="o_idx" value="${ owner.o_idx }">

			<div class="seperator">
				<label class="col-sm-2">카테고리:</label>
				<div class="com-sm-3">
                     <select name="category_idx" class="form-control">
						
                         <option value="1">Type-1(단상)</option> 
						 <option value="2">Type-2(3상)</option> 
                         <option value="3">DC Combo-(TYPE-1)</option>  
                         <option value="4">DC combo-(TYPE-2)</option>  
						 <option value="5">CHAdeMo</option> 
					 </select>  

				</div>
			</div>	
			
			
			
			<div class="seperator">
				<label class="col-sm-2">상품 이름:</label>
				<div class="com-sm-3">
					<input type="text" id="p_name" name="p_name" class="form-control"
                    placeholder="상품 이름 을 입력 해주세요">
				</div>
			</div>
			
			<div class="seperator">
				<label class="col-sm-2">가격:</label>
				<div class="com-sm-3">
					<input type="text" id="p_price" name="p_price" class="form-control"
                    placeholder="가격 을 입력 해주세요">
				</div>
			</div>

            <div class="seperator">
				<label class="col-sm-2">세일가격:</label>
				<div class="com-sm-3">
					<input type="text" id="p_saleprice" name="p_saleprice" class="form-control"
                    placeholder="세일가격 을 입력 해주세요">
				</div>
			</div>
			
			<div class="seperator">
				<label class="col-sm-2">상세 내용:</label>
				<div class="com-sm-5">
					<textarea name="p_content" cols="50" rows="2" class="form-control" ></textarea>
				</div>
			</div>


			
			
			<div class="seperator">
				<label class="col-sm-2">상품 소개 이미지(소)</label>
				<div>
					<input type="file" name="productImage" class="form-control">
				</div>
			</div>

			<div class="seperator">
				<label class="col-sm-2">상품 메인 이미지(대)</label>
				<div>
					<input type="file" name="productImage" class="form-control">
				</div>
			</div>
				
			<div class="seperator">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="등록" 
                    onclick="send(this.form);">
					<input class="btn  btn-success" type="button" value="목록보기"
				onclick="location.href='list.do'">
				</div>  
            </div>

			</div>

        </div>
			
		</form>
	</div>
</body>
</html>
