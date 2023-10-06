<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


		<html>
		
		<head>
			<meta charset="UTF-8">
	
			<title>로그인폼</title>
			<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">


			<link rel="stylesheet" href="../../css/admin_login_page.css">
			<link rel="stylesheet" href="../../css/reset.css">


			<!-- Bootstrap3.x 설정 -->
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
			<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
			<link rel="preconnect" href="https://fonts.googleapis.com">
			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
			<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
			<script type="text/javascript">

				function send(f) {

					var admin_id = f.admin_id.value.trim();
					var admin_pwd = f.admin_pwd.value.trim();

					if (admin_id == '') {

						alert('아이디를 입력하세요');
						f.admin_id.value = '';
						f.admin_id.focus();
						return;
					}

					if (admin_pwd == '') {

						alert('비밀번호를 입력하세요');
						f.admin_pwd.value = '';
						f.admin_pwd.focus();
						return;
					}

					//전송
					f.action = "login.do";//MemberLoginAction
					f.submit();

				}
			</script>



			<script type="text/javascript">

				//jQuery초기화 이벤트
				$(document).ready(function () {

					// 0.1초후에 호출 : 로그인폼 show된후에 호출
					setTimeout(show_message, 100);
					// show_message();

				});

				function show_message() {

					//login_form.do?reason=fail_id
					if ("${ param.reason eq 'fail_id' }" == "true") {
						alert('아이디가 틀렸습니다!!');
					}

					//login_form.do?reason=fail_pwd
					if ("${ param.reason eq 'fail_pwd' }" == "true") {
						alert('비밀번호가 틀렸습니다!!');
					}

					//login_form.do?reason=fail_session_timeout
					if ("${ param.reason eq 'fail_session_timeout' }" == "true") {
						alert('로그아웃되었습니다\n로그인후에 이용하세요!!');
					}

				}

			</script>

		<body>

			<h5 style="text-align: center;
               font-size: 40px; font-weight: bold; margin-bottom: 30px;"> </h5>
			<form action="login.do">
				<input type="hidden" name="url" value="${ param.url }">
				<main id="contaniner" class="login_page">
					<div class="sub_container">
						<section class="section01">
							<div class="page_title_box">
								<h2 class="page_title">Admin</h2>
							</div>

							<div class="tab">
								<div class="tab_container">
									<div class="tab_effect_box">
										<div class="tab_effect">
											<div class="tab_icon">
												<img src="img/sub/member/icon_tab_cursor.png" alt="" />
											</div>
										</div>
									</div>
									<ul class="tab_ul login-tab">
										<li class="tab_li on">
											관리자 페이지</li>


									</ul>
								</div>
							</div>

							<div class="tab_content">
								<div id="frmMaster" class="tab_content_li on">
									<form id="loginform" class="form_box" name="loginform" action="newlogin.html"
										method="POST" target="hiddenlogin" onsubmit="return false">


										<fieldset>
										
											<label for="id" class="input_box">
												<span class="tit">아이디</span>
												<input type="text" name="admin_id" value="${ param.admin_id }"
													id="admin_id" class="input_text" placeholder="아이디를 입력하세요.">
											</label>
											<label for="password" class="input_box type-password ">
												<span class="tit">비밀번호</span>
												<input type="password" name="admin_pwd" value="${ param.admin_pwd }"
													id="admin_pwd" class="input_text enterMaster"
													placeholder="비밀번호를 입력하세요.">
											</label>



											<div class="check_line d-chk">
												<div class="f_cs">
													<label for="id_save" class="check_box">
														<input type="checkbox" name="idsave" id="id_save" value="Y"
															class="input_checkbox">
														<span class="tit f_cs">아이디 저장</span>
													</label>

												</div>

											</div>
											<button class="btn_ver btn_ver1 f_c login btn_login" type="submit"
												id="login_btn" onclick="send(this.form); return false;">관리자
												로그인</button>
										</fieldset>
									</form>
								</div>


						</section>

					</div>
				</main>
			</form>
		</body>

