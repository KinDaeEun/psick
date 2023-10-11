<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url("/psick/css/admin/adminProduct.css");
</style>
<script type="text/javascript">
	function chk() {
		if (!frm.searchValue.value) {
			alert("검색어를 입력하세요");
			frm.searchValue.focus();
			return false;
		}
	}
	function del(delEno) {
		var con = confirm("해당 기획전를 삭제 하시겠습니까?");
		if(con) {
			location.href="/psick/views/admin/adminDelEventResult.en?eno="+delEno+"&del=y";
		}
	}
</script>
</head>
<body>
	<section>
		<div class="sect_wrap">

			<div class="container-table">
				${keyName } : ${searchValue }
				<table>
					<caption>기획전목록</caption>
					<tr>
						<th>기획번호</th>
						<th>기획명</th>
						<th>삭제여부</th>
						<th>수정</th>
						<th>삭제</th>
						<th>전시</th>
						<th>기획상품</th>
					</tr>
					<c:if test="${empty list }">
						<th colspan="7" class="list">상품이 없습니다</th>
					</c:if>
					<c:if test="${not empty list }">
						<c:forEach var="event" items="${list }">
							<tr>
								<td>${event.eno }</td>
								<td>${event.ename }</td>
								<td>${event.e_del }</td>

								<td><a
									href="/psick/views/admin/adminUpdateEventForm.en?eno=${event.eno }">수정</a></td>
								<td><a onclick="del(${event.eno })">삭제</a></td>
								<td><a
									href="/psick/views/admin/adminDelEventResult.en?eno=${event.eno }&del=n">전시</a></td>
								<td><a
									href="/psick/views/admin/adminEventList.en?eno=${event.eno }">상품보기</a></td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
				<div class="flex mt-50">
					<a href="/psick/views/admin/adminEvent.en" class="button2 wt_size">이전</a>
				</div>
			</div>
		</div>
	</section>
</body>
</html>