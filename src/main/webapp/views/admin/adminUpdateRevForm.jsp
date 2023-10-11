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
		<form action="/psick/views/admin/adminUpdateRevResult.en"
			method="post" name="frm">
			<input type="hidden" name="pno" value="${pno}">

			<div class="join-wrap">
				<div class="join-title">
					<h1>리뷰수정</h1>
				</div>

				<div>
					<h2>리뷰번호</h2>
					<input type="text" id="name" name="rno" readonly="readonly"
						autofocus="autofocus" placeholder="리뷰번호" value="${review.rno }">
				</div>
				<div>
					<h2>작성자</h2>
					<input type="text" id="name" name="id" readonly="readonly"
						autofocus="autofocus" placeholder="작성자" value="${review.id }">
				</div>

				<div>
					<h2>제목</h2>
					<input type="text" id="name" name="r_title" required="required"
						autofocus="autofocus" placeholder="제목" value="${review.r_title }">
				</div>


				<div>
					<h2>점수</h2>
					<input type="number" id="name" name="star" required="required"
						autofocus="autofocus" placeholder="점수" value="${review.star }"
						max="5">
				</div>

				<div>
					<h2>상세내용</h2>
					<textarea name="r_content" placeholder="상세 정보에 대한 내용이 있다면 입력해주세요.">${review.r_content }</textarea>
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