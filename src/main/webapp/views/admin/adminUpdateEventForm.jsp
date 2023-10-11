<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("/psick/css/admin/adminInsertForm.css");
</style>
<script type="text/javascript" src="/psick/js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
				$('input[type="file"]').on('change', function() {
					var fileName = $(this).val();
					var realFileName = fileName.split("\\");
					$(this).siblings('label').text(realFileName[2]);
				})
	})

</script>
</head>
<body>
	<section>
		<form action="/psick/views/admin/adminUpdateEventResult.en"
			method="post" name="frm"
			enctype="multipart/form-data">

			<div class="join-wrap">
				<div class="join-title">
					<h1>기획수정</h1>
				</div>

				<div>
					<h2>기획번호</h2>
					<input type="text" id="name" name="eno" readonly="readonly"
						autofocus="autofocus" placeholder="기획번호" value="${event.eno }">
				</div>
				<div>
					<h2>기획명</h2>
					<input type="text" id="name" name="ename" required="required"
						autofocus="autofocus" placeholder="기획명" value="${event.ename }">
				</div>

				<div>
					<div class="column_box pd">
						<div class="column">
							<label for="f1" class="file_label">${event.e_img }</label>
							<input type="file" id="f1" name="e_img">
						</div>
					</div>

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