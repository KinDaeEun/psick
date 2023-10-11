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
<script type="text/javascript" src="/psick/js/jquery.js"></script>
<script>
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
		<form action="/psick/views/admin/adminInsertResult.en" method="post"
			name="frm" onsubmit="return chk();" enctype="multipart/form-data">
			<div class="join-wrap">
				<div class="join-title">
					<h1>상품등록</h1>
				</div>
				<div>
					<h2>상품명</h2>
					<input type="text" id="name" name="pname" required="required"
						autofocus="autofocus" placeholder="상품명">
				</div>
				<div>
					<h2>종류</h2>
					<div class="id-flex">
						<select name="p_kind" required="required">
							<option>쌀·잡곡</option>
							<option>채소</option>
							<option>과일·견과·건과</option>
							<option>수산</option>
							<option>정육·계란류</option>
							<option>차·음료·생수·유제품</option>
							<option>과자·간식</option>
							<option>장류·양념·가루</option>
						</select>
					</div>
					<div id="err"></div>
				</div>
				<div>
					<h2>가격</h2>
					<input type="text" id="name" name="p_price" required="required"
						autofocus="autofocus" placeholder="가격">
				</div>
				<div>
					<h2>할인율</h2>
					<input type="number" id="name" name="discount" required="required"
						autofocus="autofocus" placeholder="할인율" min="0">
				</div>
				<div>
					<h2>원산지</h2>
					<input type="text" id="name" name="p_country" required="required"
						autofocus="autofocus" placeholder="원산지">
				</div>
				<div>
					<h2>수량</h2>
					<input type="number" id="name" name="p_count" required="required"
						autofocus="autofocus" placeholder="수량" min="0">
				</div>
				<div>
					<h2>상세내용</h2>
					<textarea name="p_detail_content"
						placeholder="상세 정보에 대한 내용이 있다면 입력해주세요."></textarea>
				</div>
				<div>
					<div class="column_box">
						<div class="column">
							<label for="f1" class="file_label">상세 정보 이미지 업로드</label>
							 <input type="file" id="f1" name="p_detail_img">
						</div>
					</div>
				</div>

				<div>
					<input type="submit" value="등록" class="sm_btn">
					<input type="button" value="취소" class="sm_btn" onclick="history.go(-1)" >
				</div>
			</div>
		</form>
	</section>
</body>
</html>