<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c'    uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt'  uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn'   uri='http://java.sun.com/jsp/jstl/functions' %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- Bootstrap3.x 설정 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style>
        #box{
            width: 700px;
            margin: auto;
            margin-top: 50px; 
        }

        .mystyle{
            
           
            padding: 5px;
            margin-bottom: 10px;
        }

        #content{
            min-height: 120px;
        }

        /*댓글창*/
        #c_b_content{
          width: 80%;
          height: 100px;
          resize: none;
          float: left;
          padding: 6px;
        }
        #comment_btn{
          width: 17%;
          height: 100px;
          float: left;
          margin-left: 20px;

        }



    </style>
    <script>

      function del(b_idx){

          if(confirm("정말 삭제하시겟읍니까?")==false)return;

          location.href="delete.do?b_idx="+ b_idx +"&page=${param.page}&search=${param.search}&search_text=${param.search_text}" ; //'${ vo. b_idx}'


      }


      //댓글작성
      
      let global_comment_page = 1;

      function comment_insert(){
        //로그인여부 체크
        if("${empty user}"=="true"){
          if(confirm("댓글쓰기는 로그인후 가능합니다\n로그인 하시겟습니까?")==false)return;

          //로그인 폼으로 이동
           location.href="../member/login_form.do?url=" + encodeURIComponent(location.href);
          return;
        }

        let c_b_content = $("#c_b_content").val();

        if(c_b_content==""){
          alert("댓글내용을 작성하세요");
          $("#c_b_content").val("");
          $("#c_b_content").focus();
          return;
        }

        //댓글쓰기
        $.ajax({
            url : "comment_insert.do",
            data : {
                    "b_idx"             : "${vo.b_idx}",
                    "c_b_content"       : c_b_content,
                    "mem_idx"           : "${user.mem_idx}",
                    "mem_id"            : "${user.mem_id}",
                    "mem_name"          : "${user.mem_name}"
                   },
             dataType : "json",
             success : function(res_data){
              //res_data = {"result" :"success"}
              //res_data = {"result" :"fail"}
                if(res_data.result=="success"){

                  //이전 댓글내용 삭제
                  $("#c_b_content").val("");
                  //댓글목록 재요청
                  comment_list(global_comment_page);
                }
             },

             error  : function(err){     
                   alert(err.responseText);
             }
        });

      }

      //댓글조회
      function comment_list(comment_page){
        
        $.ajax({

            url          : "comment_list.do", // comment_list.do?b_idx=5&page=2
            data         : {
                          "b_idx" : "${vo.b_idx}",
                          "page"  : comment_page       
                          },
            success: function(res_data){
              //댓글영역에 출력
              $("#comment_display").html(res_data);

            },
            error  : function(err){
                  alert(err.responseText);
            }
        });
      }

    </script>
    <script>
      //현재 html문서 배치가 완료되면 댓글목록 출력
      $(document).ready(function(){
         comment_list(global_comment_page);
      });

    </script>

    <script>
    //게시판 조회
    //let list_url = "view.do?b_idx=${ vo.b_idx }&page=${(empty param.page) ? 1 : param.page}&search=${param.search}&search_text=${param.search_text}"
     
      let global_board_page = "${param.page}";
      //let b_idx ="${param.b_idx}"
      function board_list(board_page){
        
        global_board_page = board_page;
        $.ajax({

            url          : "list_comment.do", // board_view.do?b_idx=5&page=2&search=name&search_text=길동
            data         : { 
                          "b_idx" : "${param.b_idx}"  ,                
                          "page"  : board_page ,
                          "search":    "${param.search}",
                          "search_text":"${param.search_text}" 
                          },
            success: function(res_data){
              //게시판영역에 출력
              $("#board_display").html(res_data);

            },
            error  : function(err){
                  alert(err.responseText);
            }
        });
      }

    </script>
    <script>
      //현재 html문서 배치가 완료되면 게시판목록 출력
      $(document).ready(function(){
       
         board_list(global_board_page);
      });

    </script>



</head>
<body>
  <%@ include file="../main/header.jsp" %>
  <h5 style="    text-align: center;
             font-size: 40px; font-weight: bold;padding: 20px;">  전기차 게시판 </h5>
  
    <div id="box">
       <input type="hidden" value="${vo.b_idx}" id="b_idx">
        <div class="panel panel-primary">
          <div class="panel-heading"></div>
          <div class="panel-body">
              <!-- 제목 -->
             
                <div class="mystyle" style="font-weight: bold; font-size: 20px;">
                ${ vo.b_subject }
                </div>
                <td>
                <div class="mystyle">
                  <label>${ vo.mem_name} (${ fn:substring (vo.b_ip,0,7)}) | ${ fn:substring(vo.b_regdate,0,16) }</label>
                  <label style="padding-left: 60%;"> 조회 ${ vo.b_readhit } | 댓글 
                        <Spen style="font-size: 17px;">
                          <c:if test="${comment>0}">
                            (${comment})
                          </c:if>
                          <script>
                            console.log("${commnet}")
                          </script>
                          <c:if test="${ comment<=0 }">
                            (0)
                          </c:if>
                        </Spen>
                  </label>
                          
                </div>
              </td>
                <hr style="width: auto; border: 1px solid rgb(211, 210, 210);">
                
                  
                
             

              <!-- 내용 -->
              <hr>
              <div class="mystyle" id="content">
                <label>${ vo.b_content }</label>
              </div>
              <hr style="width: auto; border: 1px solid rgb(211, 210, 210);">
              <!-- 작성일자/IP -->
              

              <!-- 작업버튼 -->
              <input  class="btn btn-primary" type="button" value="목록보기"
                      onclick="location.href='list.do?page=${param.page}&search=${param.search}&search_text=${param.search_text}'">
              
              <!-- 로그인상태 및 메인글에서만 사용 + 검색조건이 all일때 사용-->
              <c:if test="${ (not empty user) } and(param.search eq 'all')">
                 <input  class="btn btn-success" type="button" value="답글쓰기"
                         onclick="location.href='reply_form.do?b_idx=${ vo.b_idx }&page=${param.page}'">
              </c:if>

              <!-- 글쓴이인 경우만 활성화 -->
              <c:if test="${ user.mem_idx eq vo.mem_idx }">
                <input  class="btn btn-info"    type="button" value="수정"
                        onclick="location.href='modify_form.do?b_idx=${ vo.b_idx }&page=${param.page}&search=${param.search}&search_text=${param.search_text}'"  >
                <input  class="btn btn-danger"  type="button" value="삭제" 
                        onclick="del('${vo.b_idx}');">
              </c:if>

          </div>
       </div>
       <!-- 댓글 출력 -->
       <div id="comment_display"  style="margin-top: 3%;"></div>

       <!-- 댓글 입력창 -->
       <div>
          <textarea id="c_b_content" placeholder="댓글은 로그인후에 작성 가능합니다"></textarea>
          <input id="comment_btn" type="button" value="댓글쓰기"
                  onclick="comment_insert();">
       </div>
       
       <hr>

       <!-- 게시판 목록 재출력 -->  


       <div  id="board_display" style="margin-top: 20%;"></div>
    
       
    </div>
    <%@ include file="../main/footer.jsp" %>
</body>
</html>