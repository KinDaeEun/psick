<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("/psick/css/admin/adminInsertForm.css");
</style>
</head>
<body>
	<section>
		<form action="/psick/views/admin/adminUpdateRepResult.en"
			method="post" name="frm" >
			<input type="hidden" name="ano" value="${ano}">

			<div class="join-wrap">
				<div class="join-title">
					<h1>댓글수정</h1>
				</div>

				<div>
					<h2>댓글번호</h2>
					<input type="text" id="name" name="re_no" readonly="readonly"
						autofocus="autofocus" placeholder="리뷰번호" value="${reply.re_no }">
				</div>
				<div>
					<h2>작성자</h2>
					<input type="text" id="name" name="r_title" readonly="readonly"
						autofocus="autofocus" placeholder="제목" value="${reply.id }">
				</div>

				<div>
					<h2>상세내용</h2>
					<textarea name="ref_content"
						placeholder="상세 정보에 대한 내용이 있다면 입력해주세요.">${reply.ref_content }</textarea>
				</div>


				<div>
					<input type="submit" value="수정" class="sm_btn"> <input
						type="button" value="취소" class="sm_btn" onclick="history.go(-1)">

				</div>
			</div>
		</form>
	</section>
</body>
</html>