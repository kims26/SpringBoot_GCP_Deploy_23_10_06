<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
        <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
            <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>

    <!DOCTYPE html>
    <html lang="en">

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>

        <!-- Bootstrap3.x 설정 -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


        <style>
            #box {
                width: 800px;
                margin: auto;
                margin-top: 50px;
            }

            #title {
                text-align: center;
                font-size: 26px;
                font-weight: bold;
                text-shadow: 1px 1px 2px black;
                color: rgb(255, 255, 255);
            }

            .subject {
                width: 400px;

                /* elipsis:말줄임 ... */
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
                word-break: break-all;
            }
        </style>

        <script>

            function insert_form() {

                // 로그인 체크(안된경우)
                if ("${ empty sessionScope.user }" == "true") {

                    if (confirm("글쓰기는 로그인후 가능합니다\n로그인 하시겠습니까?") == false) return;
                    //현재경로 : /board/
                    location.href = "../member/login_form.do";

                    return;
                }

                //글쓰기 폼으로 이동
                location.href = "insert_form.do";

            }


        </script>

        <!-- 검색기능 -->
        <script>
            //언제호출?: html browser 배치완료되면
            $(document).ready(function () {

                if ("${not empty param.search_board}" == "true") {
                    $("#search_board").val("${param.search_board}");
                }
            });



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
                location.href = "list.do?search="+search+"&search_text="+encodeURIComponent(search_text);
                //}else{
                //   location.href="view.do?b_idx=${param.b_idx}&search="+search+"&search_text="+encodeURIComponent(search_text);
                // }
            }


        </script>

    </head>

    <body>
        <%@ include file="../main/header.jsp" %>

             <h5 style="    text-align: center;
             font-size: 40px; font-weight: bold;  padding: 20px;">  전기차 게시판 </h5>
            <div id="box">

                <table class="table">
                    <tr style="font-weight: bold;">
                        <th>번호</th>
                        <th width="50%">제목</th>
                        <th>작성자</th>
                        <th>작성일자</th>
                        <th>조회수</th>
                    </tr>
                    <!-- Data가 없는경우 -->
                    <c:if test="${ empty list }">
                        <tr>
                            <td colspan="5" align="center">
                                <font color="red">등록된 게시물이 없습니다</font>
                            </td>
                        </tr>
                    </c:if>


                    <!-- Data가 있는경우 -->
                    <!-- for(BoardVo vo : list ) -->
                    <c:forEach var="vo" items="${ list }">
                        <tr>

                            <!-- <td>${ vo.b_ref}</td> -->
                            <td>${vo.no}</td>
                            <td>
                                <div class="subject">
                                    <!-- 사용중인 게시물 -->
                                    <a
                                        href="view.do?b_idx=${ vo.b_idx }&page=${(empty param.page) ? 1 : param.page}&search=${param.search}&search_text=${param.search_text}">${
                                        vo.b_subject }</a>
                                    <!-- 댓글 카운트 뻇지 -->
                                    <c:if test="${vo.comment_count>0}">
                                        <span>(${vo.comment_count})</span>
                                    </c:if>
                            </td>

                            <td>${ vo.mem_name }</td>
                            <td>${ fn:substring(vo.b_regdate,0,16) }</td>
                            <td>${ vo.b_readhit }</td>

                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="5" align="center">
                            <form class="form-inline">
                                <select class="form-control" id="search_board">
                                    <option value="all">전체</option>
                                    <option value="name">이름</option>
                                    <option value="subject">제목</option>
                                    <option value="content">내용</option>
                                    <option value="name_subject_content">이름+제목+내용</option>
                                </select>
                                <input type="text" class="form-control" id="search_text"
                                    value="${param.search_text}" onkeyup="">

                                <input class="btn btn-primary" type="button" value="검색"
                                    onclick="search_f();">
                                <input class="btn btn-primary" type="button" value="새글쓰기"
                                    onclick="insert_form();">
                            </form>
                        </td>
                    </tr>

                    <!-- 페이징 메뉴 -->
                    <tr>
                        <td colspan="5" align="center">

                            <!-- <ul class='pagination'>
            <li><a href='#'>◀</a></li>
            <li><a href='list.do?page=1'>1</a></li>
            <li><a href='list.do?page=2'>2</a></li>
            <li class='active'><a href='#'>3</a></li>
            <li><a href='list.do?page=6'>▶</a></li>
            </ul> -->
                            ${ pageMenu}
                        </td>


                    </tr>


                </table>

            </div>
            <%@ include file="../main/footer.jsp" %>
    </body>

    </html>