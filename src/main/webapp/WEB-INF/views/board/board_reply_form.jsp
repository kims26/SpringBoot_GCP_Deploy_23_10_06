<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
        <%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
            <%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>

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
                        #box {
                            width: 600px;
                            margin: auto;
                            margin-top: 50px;
                        }

                        #content {
                            min-height: 200px;
                        }

                        textarea {
                            min-height: 200px;
                            resize: none;
                        }
                    </style>

                    <script>
        function send(f){

            let b_subject = f.b_subject.value.trim();
            let b_content = f.b_content.value.trim();

            if(b_subject==''){
                alert("제목을 입력하세요!!");
                f.b_subject.value='';
                f.b_subject.focus();    
                return;
            }

            if(b_content==''){
                alert("내용을 입력하세요!!");
                f.b_content.value='';
                f.b_content.focus();    
                return;
            }

            //답글쓰기  
            f.action = "reply.do";
            f.submit();
        }

                    </script>


                </head>

                <body>
                    <form>
                        <input type="hidden" name="b_idx" value="${ param.b_idx}">
                        <input type="hidden" name="page" value="${ param.page}">
                        <div id="box">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4>답글쓰기</h4>
                                </div>
                                <div class="panel-body">

                                    <label>제목</label>
                                    <div><input class="form-control" name="b_subject"></div>
                                    <br>

                                    <label>내용</label>
                                    <div id="content">
                                        <textarea class="form-control" name="b_content"></textarea>
                                    </div>
                                    <br>

                                    <!-- 버튼 -->
                                    <input class="btn btn-primary" type="button" value="답글쓰기"
                                        onclick="send(this.form);">
                                    <input class="btn btn-success" type="button" value="목록보기"
                                        onclick="location.href='list.do'">

                                </div>
                            </div>

                        </div>
                    </form>
                </body>

                </html>