<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("/psick/css/member/member.css");
</style>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
	function dupChk() {
		if (!frm.id.value) {
			alert("아이디를 입력하고 체크하세요");
			frm.id.focus();
			return false;
		}
		/* $가 jQuery post방식 */
		$.post("/psick/views/member/confirm2.ys", "id=" + frm.id.value,
		//data는 confirm2.jsp를 수행하고 전달 받은 값
		function(data) {
			//id가 err인 곳에 html로 보여줘라
			$('#err').html(data);
		});
		frm.dup.value = "1";
		/* window.open("firm1.jsp?id=" + frm.id.value, "", "width=300 height=300"); */
	}

	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert("암호와 암호확인 다릅니다");
			frm.password.focus();
			frm.password.value = "";
			frm.password2.value = "";
			return false;
		}
	}

	$(
			function() {
				$('input[type="file"]').on('change', function() {
					var fileName = $(this).val();
					var realFileName = fileName.split("\\");
					$(this).siblings('label').text(realFileName[2]);
				})
				var selectValue = "${member.gender}";
				$('select option[value=' + selectValue + ']').attr('selected',
						'selected');
			})
</script>

</head>
<body>
	<section>
		<form action="/psick/views/admin/adminUpdateMemResult.en"
			method="post" name="frm" onsubmit="return chk();">
			<div class="join-wrap">
				<div class="join-title">
					<h1>회원정보 수정</h1>
				</div>
				<h2>아이디</h2>
				<div class="id-flex">
					<input type="text" id="id" name="id" 
						placeholder="영문소문자,숫자6~14자리" value="${member.id }" readonly="readonly">
				
				</div>
				
				<div>
					<h2>이름</h2>
					<input type="text" id="name" name="name" required="required"
						autofocus="autofocus" placeholder="이름" value="${member.name }">
				</div>
				<div></div>
				<div class="pass-wrap">
					<h2>비밀번호</h2>
					<input type="text" name="password" id="password"
						required="required" placeholder="영문, 숫자, 특수문자 8자리 이상" value="${member.password }"><br>

				</div>
				<div>
					<h2>배송지 주소(선택)</h2>
					<input type="text" name="addr" id="addr" required="required"
						placeholder="주소" value="${member.addr }"><br> <input
						type="text" name="addr_detail" id="addr_detail"
						required="required" placeholder="상세주소"
						value="${member.addr_detail }">
				</div>
				<h2>성별</h2>
				<div>
					<input type="radio" name="gender" id="mal" value="남자"
						<c:if test="${member.gender=='남자' }">checked</c:if>> <label
						for="mal">남자</label> <input type="radio" name="gender" id="mal"
						value="여자" <c:if test="${member.gender=='여자' }">checked</c:if>>
					<label for="fem">여자</label>
				</div>
				<div>
					<h2>전화번호</h2>
					<input type="tel" name="tel" id="tel" required="required"
						pattern="010-\d{3,4}-\d{4}" placeholder="010-1234-5689형식으로 입력하시오"
						value="${member.tel }">
				</div>
				<div>
					<input type="submit" value="회원수정" class="sm_btn"> <input
						type="button" value="취소" class="sm_btn" onclick="history.go(-1)">
				</div>
			</div>
		</form>
	</section>
</body>
</html>