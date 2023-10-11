<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url("/psick/css/member/member.css");
</style>
</head>
<body>
	<section class="login-form">
		<div class="login-form_inner">
			<h1>비밀번호 찾기</h1>
			<form action="findPwResult.ys" method="post">
				<input type="text" name="id" placeholder="아이디" required="required"
					id="id" class="idc">
				<P></P>
				<input type="text" name="name" placeholder="이름" required="required"
					id="name"> <input type="submit" class="btn-area btn_style"
					value="비밀번호 찾기">
			</form>
		</div>
	</section>
</body>
</html>