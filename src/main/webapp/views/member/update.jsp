<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url("/psick/css/member/member.css");
</style>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert("암호와 암호 확인이 다릅니다");
			frm.password.focus();
			frm.password.value = "";
			frm.password2.value = "";
			return false;
		}
	}
</script>
</head>
<body>
	<section>
		<form action="updateResult.ys" method="post" name="frm"
			onsubmit="return chk()">
			<input type="hidden" name="id" value="${member.id }">
			<div class="join-wrap">
				<div class="join-title">
					<h1>회원정보수정</h1>
				</div>
				<div>
					<h2>이름</h2>
					<input type="text" id="name" name="name" value="${member.name}"
						placeholder="${member.name }" required="required"
						autofocus="autofocus">
				</div>
				<div class="id-flex">
					<h2>아이디</h2>
					<h2 class="id_see">${member.id }</h2>
				</div>
				<div class="pass-wrap">
					<h2>비밀번호</h2>
					<input type="password" name="password" id="password" required="required">
					<h2>비밀번호확인</h2>
					<input type="password" name="password2" id="password2" required="required">
				</div>
				<div>
					<h2>배송지주소(상세)</h2>
					<input type="text" name="addr" id="addr" required="required"
						value="${member.addr }" placeholder="${member.addr }"><br>
					<input type="text" name="addr_detail" id="addr" required="required"
						value="${member.addr_detail }"
						placeholder="${member.addr_detail }">
				</div>
				<div>
					<h2>성별</h2>
					<input type="radio" name="gender" id="mal" value="남자"
						<c:if test='${member.gender==\'남자\'}'>checked</c:if>> <label
						for="mal">남자</label> <input type="radio" name="gender" id="fem"
						value="여자" <c:if test='${member.gender==\'여자\'}'>checked</c:if>>
					<label for="fem">여자</label>
				</div>
				<div>
					<h2>전화번호</h2>
					<input type="tel" name="tel" id="tel" value="${member.tel }"
						placeholder="${member.tel }">
				</div>
				<input type="submit" value="회원정보 수정" class="sm_btn">
			</div>
		</form>
	</section>
</body>
</html>