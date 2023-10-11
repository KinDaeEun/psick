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
			<h1>아이디 찾기</h1>
			<form action="findIdResult.ys" method="post">
				<input type="text" name="name" placeholder="이름" required="required" id="name" class="mb">
				<P></P>
				<input type="tel" name="tel"
					placeholder="연락처" required="required" id="tel"> <input type="submit"
					class="btn-area btn_style" value="확인">
			</form>
		</div>
	</section>
</body>
</html>