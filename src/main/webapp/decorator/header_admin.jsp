<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("/psick/css/admin/admin.css");
</style>

</head>
<body>
	<header>
		<div class='header_inner'>
			<div class='header_logo'>
				<a href="/psick/views/admin/adminMain.en"><img src="/psick/images/main_img/pick_logo.png"></a>
			</div>
			<nav>
				<ul class='nav_sub'>
					<li><a href="/psick/views/member/logout.ys">로그아웃</a></li>
					<li><a href="/psick/views/display/main.en" >피식
							홈페이지</a></li>
				</ul>
				<ul class='nav_main'>
					<li><a href="/psick/views/admin/adminProduct.en" id="adminDisplay">상품
							관리</a></li>
					<li><a href="/psick/views/admin/adminMember.en" id="adminMember">회원
							관리</a></li>
					<li><a href="/psick/views/admin/adminEvent.en" id="adminEvent">기획전
							관리</a></li>
					<li><a href="/psick/views/admin/adminAccount.en" id="adminAccount">게시판
							관리</a></li>
				</ul>
			</nav>
		</div>
	</header>
</body>
</html>