<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<style>
@import url("/psick/css/account/list.css");
@import url("/psick/css/fonts.css");
</style>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
<form action="writeResult.hu" method="post">
	<div class="board_write_wrap">
		<div class="inner">
			<div class="board_write_title">건의사항</div>
			<div class="board_writebox_cover">
				<div class="board_writebox">
					<div class="board_writebox_inner">
					<div class="board_tit">
						<dl>
							<dt>제목</dt>
							<dd>
								<input type="text" name="a_title"
									class="form-control" placeholder="제목 입력" autofocus="autofocus"
									required="required">
							</dd>
						</dl>
					</div>
					<div class="board_info">
						<dl>
							<dt>글쓴이</dt>
							<dd>
								<input type="text" name="a_name"
									class="form-control" placeholder="글쓴이 입력" required="required">
							</dd>
						</dl>
					</div>
					</div>
					 <textarea id="summernote" name="a_content"></textarea>
					<div class="board_write_button">
					  <input type="submit" value="확인" class="btn_style vb" >
<!-- 						<input type="button" value="저장" class="btn_style vb" onclick="location.href='list.hu?num=0&pageNum=1'"> -->
						<input type="submit" value="취소" class="btn_style db"onclick="location.href='list.hu?num=0&pageNum=1'">
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#summernote').summernote(
				{
					placeholder : '내용을 입력해주세요',
					tabsize : 2,
					height : 400,
					toolbar : [ [ 'style', [ 'style' ] ],
							[ 'font', [ 'bold', 'underline', 'clear' ] ],
							[ 'color', [ 'color' ] ],
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							[ 'table', [ 'table' ] ],
							[ 'insert', [ 'link', 'picture', 'video' ] ],
							[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ]
				});
	</script>
</form>
</body>
</html>