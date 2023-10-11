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


</head>
<body>
	<section>
		<form action="/psick/views/admin/adminUpdateAccResult.en"
			method="post" name="frm">
			<div class="join-wrap">
				<div class="join-title">
					<h1>게시글 수정</h1>
				</div>
				<input type="hidden" name="ano" value="${account.ano }">
				<h2>제목</h2>
				<div class="id-flex">
					<input type="text" id="id" name="a_title" required="required"
						placeholder="제목" value="${account.a_title }">
				</div>

				<div>
					<h2>아이디</h2>
					<input type="text" id="name" name="id" readonly="readonly"
						autofocus="autofocus" placeholder="아이디" value="${account.id }">
				</div>
				<div>
					<h2>작성자</h2>
					<input type="text" id="name" name="a_name" required="required"
						autofocus="autofocus" placeholder="작성자" value="${account.a_name }">
				</div>

				<div>
					<h2>상세내용</h2>
					<textarea name="a_content"
						placeholder="상세 정보에 대한 내용이 있다면 입력해주세요.">${account.a_content }</textarea>
				</div>
				<div>
					<h2>조회수</h2>
					<input type="number" id="name" name="a_cnt" required="required"
						autofocus="autofocus" placeholder="조회수" min="0"
						value="${account.a_cnt }">
				</div>

				<div>
					<input type="submit" value="게시글수정" class="sm_btn"> <input
						type="button" value="취소" class="sm_btn" onclick="history.go(-1)">
				</div>
			</div>
		</form>
	</section>
</body>
</html>