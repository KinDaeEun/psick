<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("/psick/css/member/member.css");
</style>
<%@ include file="/views/sessionChk.jsp"%>
<script type="text/javascript">
	function del() {
		var con = confirm("탈퇴 하시겠습니까?");
		if (con)
			location.href = "delete.ys";
		else
			alert("탈퇴가 취소 되었습니다.");
	}
</script>
</head>
<body>
	<div class="mypageForm-wrap">
		<div class="section">
			<div>
				<div class="my_top_class">
					<div class="nema-class">
						${member.name }님 <span>welcome</span> <a
							href="/psick/views/member/update.ys" class="btn_info_write"><span>정보
								수정</span></a>
					</div>
					<div class="my_benefit_info">
						<a href="/psick/views/display/loveview.hu" class="info-title">찜목록</a>
						 <a href="/psick/views/display/buyList.ys"
							class="info-title">구매목록 </a>
					</div>
					<button id="del-btn" onclick="del()">회원탈퇴</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>