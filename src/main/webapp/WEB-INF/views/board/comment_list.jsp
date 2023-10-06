<%@ page language='java' contentType='text/html;charset=UTF-8' pageEncoding='UTF-8'%>
<%@ taglib prefix='c'    uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt'  uri='http://java.sun.com/jsp/jstl/fmt'%>
<%@ taglib prefix='fn'   uri='http://java.sun.com/jsp/jstl/functions'%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        .c_b_name{
        font-size: 15px;
        font-weight: bold;
        position: relative;
    }
     

    .c_b_content{           
      
     min-height: 60px;
     height: auto;
   
     padding: 5px;
     font-weight: bold;
     color: #060607;
  
    }
    textarea {
	 resize: none;
    }
    </style>

    <script>
         function comment_del(c_b_idx){
            //여기서 삭제처리
            if(confirm("정말 삭제하시겠습니까?")==false)return;
            
            $.ajax({

             url          : "comment_delete.do", // comment_list.do?b_idx=5&page=2
             data         : { "c_b_idx" : c_b_idx},
             dataType     : "json",
             success: function(res_data){          

             if(res_data.result == "success"){
                comment_list(global_comment_page);
             }                
            },
            error  : function(err){
                alert(err.responseText);
            }
     });
}
           
    </script>
</head>
<body>
   
    <!-- 페이징 메뉴 추가 -->
    <!-- <c:if test="${not empty list}">
        <div id="c_menu"></div>
        <div>            
                <li><a href='#'>◀</a></li>
                <li><a href='#c_menu' onclick="comment_list('1');">1</a></li>
                <li><a href='#c_menu' onclick="comment_list('2');">2</a></li>
                <li><a href='#c_menu' onclick="comment_list('3');">3</a></li>
                <li><a href='#'>▶</a></li>
                ${ pageMenu}
             
        </div>        
    </c:if> -->
    <!-- for(CommentBoardVo vo: list ) -->
    
    <c:forEach var="vo"  items="${ list }">
       <div class="c_b_name">
            <label> ${ vo.mem_name }(${ vo.mem_id })</label>
            <!-- 로그인유저와 글쓴이가 동일하면 보여줘라 -->
            <c:if test="${user.mem_idx eq vo.mem_idx}">
                <div style="position: absolute; right: 4px; top: 5px;" >
                    <input  type="button" value="X"
                             onclick="comment_del('${vo.c_b_idx}')" style="width: 25px; height: 25px;"></div>
                </div>
             </c:if>
       <div class="c_b_regdate">${ fn:substring(vo.c_b_regdate,0,16)  }</div>
       <div class="c_b_content">
        <textarea class="form-control" rows="5" name="content" readonly>${ vo.c_b_content }</textarea>
         </div>
             
    </c:forEach>
    
</body>
</html>