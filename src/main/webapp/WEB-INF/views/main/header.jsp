<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>

            <link rel="stylesheet" type="text/css" href="../css/reset.css">
            <link rel="stylesheet" type="text/css" href="../css/main_header.css">
            <link rel="stylesheet" type="text/css" href="../css/main_footer.css">
            <link rel="stylesheet" type="text/css" href="../css/main.css">
            <link rel="stylesheet" type="text/css" href="../css/m_menu.css">
            <link rel="stylesheet" type="text/css" href="../css/search.css">
            <link rel="stylesheet" type="text/css" href="../css/search_responsive.css">
            <!-- <link rel="stylesheet" type="text/css" href="../css/main_header_responsive.css"> -->
            <link rel="stylesheet" type="text/css" href="../css/responsive.css">
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
            <script>

                function check(f) {
                    //로그인여부(안된경우)
                    if ("${ empty user }" == "true") {

                        if (confirm("장바구니 담기는 로그인후에 가능합니다\n로그인 하시겠습니까?") == false) return;

                        //로그인창 이동 : location.href <=현재경로
                        location.href = "../member/login_form.do?url=" +
                            encodeURIComponent(location.href);
                        return;
                    }
                    location.href = "../product/cart_list.do?mem_idx=${user.mem_idx}"
                }

            </script>
        </head>

        <body>

            <div class="header">
                <div class="inner">

                    <h1>
                        <a href="../main/main.do">
                            <img src="../../../images/logo.png" alt="피씨로고" class="pc_ver" style="height: 50px">
                            <img src="../../../images/logo.png" alt="모바일로고" class="mo_ver">
                        </a>
                    </h1>
                    <nav class="menu_pc ">
                        <ul id="gnb" class="main_gnb acc_btn">
                            <li class="depth1 on acc_btn">
                                <a href="../charge/map.do">충전소조회</a>
                            </li>

                            <li class="depth1 on acc_btn">
                                <a href="../board/list.do">게시판</a>
                            </li>
                            <li class="depth1 on acc_btn">
                                <a href="../product/main_list.do">스토어</a>
                            </li>

                            <li class="depth1 on acc_btn">
                                <a style="cursor: pointer;" onclick="check()">장바구니</a>
                            </li>
                        </ul>
                        <ul class="gnb_sub acc_btn">
                            <li class="depth1 on">
                                <a href="">스토어</a>
                                <ul class="depth2">
                                    <li class="sub_menu">
                                        <ul>
                                            <li><a href="">쇼핑몰 관련 메뉴1</a></li>
                                            <li><a href="">쇼핑몰 관련 메뉴2</a></li>
                                            <li><a href="">쇼핑몰 관련 메뉴3</a></li>
                                            <li><a href="">쇼핑몰 관련 메뉴4</a></li>
                                            <li><a href="">쇼핑몰 관련 메뉴5</a></li>
                                            <li><a href="">쇼핑몰 관련 메뉴6</a></li>
                                        </ul>
                                    </li>

                                    <li class="depth1 on"></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>

                    <div class="search_b_all ">
                        <!-- 로그인 안된경우-->
                        <c:if
                            test="${ empty sessionScope.user && empty sessionScope.owner && empty sessionScope.admin_user or not empty sessionScope.admin_user }">
                            <div class="search_login_out ">
                                <a href="../member/login_form.do" class="login_btn">로그인 / 회원가입
                                </a>
                            </div>
                        </c:if>
                        <!-- <c:if
                        test="${ not empty sessionScope.admin_user }">
                        <div class="search_login_out ">
                            <a href="../member/login_form.do" class="login_btn">로그인 / 회원가입
                            </a>
                        </div>
                    </c:if> -->


                        <!-- 로그인 된경우 -->
                        <c:if test="${ not empty sessionScope.user }">
                            <span class="user_name"><b>${ sessionScope.user.mem_name }</b>일반회원님 환영합니다</span>
                            <div class="search_login_out">
                                <a href="/logout" class="login_btn">로그아웃</a>
                            </div>
                            <button type="button" class="search_btn">
                                <img src="../images/user.png" alt="마이페이지" class="search"
                                    onclick="location.href='../member/mypage.do?mem_idx='+'${user.mem_idx}'"
                                    style="cursor: pointer;"></button>



                        </c:if>

                        <!-- 로그인 된경우-->
                        <c:if test="${ not empty sessionScope.owner }">
                            <span class="user_name"><b>${sessionScope.owner.o_name}</b>판매자님 환영합니다</span>
                            <div class="search_login_out">
                                <a href="../owner/logout.do" class="login_btn">로그아웃</a>
                            </div>

                            <button type="button" class="search_btn">
                                <img src="../images/user.png" alt="마이페이지" class="search"
                                    onclick="location.href='../owner/modify_form.do?o_idx='+'${owner.o_idx}'"
                                    style="cursor: pointer;"></button>



                        </c:if>
                        <!-- 로그인 된경우 -->
                        <!-- <c:if test="${ not empty sessionScope.admin_user }">
                            <div class="login_btn">
                                <a href="../member/login_form.do">로그인 / 회원가입
                                </a>
                            </div>
                        </c:if> -->
                        <!-- 로그인 된경우-->
                        <!-- <c:if test="${ not empty sessionScope.admin_user }">
                            <span class="user_name"><b>${sessionScope.admin_user.admin_name}</b>관리자님 환영합니다</span>
                            <div class="search_login_out">
                                <a href="../admin/main_logout.do" class="login_btn">로그아웃</a>
                            </div>

                            <button type="button" class="search_btn">
                                <img src="../images/user.png" alt="마이페이지" class="search"
                                    onclick="location.href='../admin/list.do?admin_idx='+'${admin.admin_idx}'"
                                    style="cursor: pointer;"></button>



                        </c:if> -->

                        <button type="button" id="search_btn_pc" class="search_btn">
                            <img src="../images/search.png" alt="찾기버튼" class="search" style="cursor: pointer;"></button>

                        <button type="button" class="btn_call"><img src="../../../images/icon_gnb_mo.png"
                                alt="메뉴"></button>
                        <div class="menu_mo">




                            <div class="depth1">
                                <!-- 로그인 안된경우-->
                                <c:if
                                    test="${ empty sessionScope.user && empty sessionScope.owner && empty sessionScope.admin_user && not empty sessionScope.admin_user }">
                                    <div class="login_btn">
                                        <a href="../member/login_form.do">로그인 / 회원가입
                                        </a>
                                    </div>
                                </c:if>



                                <!-- 로그인 된경우 -->
                                <c:if test="${ not empty sessionScope.user }">
                                    <!-- <span class="user_name"><b>${ sessionScope.user.mem_name }</b>일반회원님 환영합니다</span> -->
                                    <div class="login_btn">
                                        <a href="../member/logout.do">로그아웃</a>
                                    </div>
                                    <!-- <button type="button" class="search_btn">
                                        <img src="../images/user.png" alt="마이페이지" class="search"
                                            onclick="location.href='../member/mypage.do?mem_idx='+'${user.mem_idx}'"
                                            style="cursor: pointer;"></button>

 -->

                                </c:if>

                                <!-- 로그인 된경우-->
                                <c:if test="${ not empty sessionScope.owner }">
                                    <!-- <span class="user_name"><b>${sessionScope.owner.o_name}</b>판매자님 환영합니다</span> -->
                                    <div class="login_btn">
                                        <a href="../owner/logout.do">로그아웃</a>
                                    </div>

                                    <!-- <button type="button" class="search_btn">
                                        <img src="../images/user.png" alt="마이페이지" class="search"
                                            onclick="location.href='../owner/modify_form.do?o_idx='+'${owner.o_idx}'"
                                            style="cursor: pointer;"></button> -->



                                </c:if>
                                <!-- 로그인 된경우 -->
                                <!-- <c:if test="${ not empty sessionScope.admin_user }">
                                    <div class="login_btn">
                                        <a href="../member/login_form.do">로그인 / 회원가입
                                        </a>
                                    </div>
                                </c:if> -->
                                <!-- 로그인 된경우 -->
                                <!-- <c:if test="${ not empty sessionScope.admin_user }">
                                    <span class="user_name"><b>${sessionScope.admin.admin_name}</b>관리자님 환영합니다</span>
                                    <div class="login_btn">
                                        <a href="../admin/logout.do">로그아웃</a>
                                    </div>

                                    <button type="button" class="search_btn">
                                        <img src="../images/user.png" alt="마이페이지" class="search"
                                            onclick="location.href='../admin/list.do?o_idx='+'${admin.admin_idx}'"
                                            style="cursor: pointer;"></button>



                                </c:if> -->


                                <a id="m_ctg" href="../charge/map.do">충전소 조회</a>
                                <a id="m_ctg" href="../product/list.do">스토어</a>
                                <a id="m_ctg" href="../board/list.do">게시판</a>
                            </div>

                        </div>



                    </div>

                </div>


        </body>

        </html>