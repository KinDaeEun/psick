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
			<div class="top">
				<div class="searchForm">
					<form action="/psick/views/admin/adminFindEvent.en" name="frm"
						onsubmit="return chk()">
						<select name="searchKey" class="searchTab">
							<option value="eno">기획번호</option>
							<option value="ename">기획명</option>
						</select>
						<div class="search_box02">
							<input type="text" name="searchValue" class="searchTab"
								placeholder="검색어를 입력해주세요."> <input type="submit"
								value="검색" class="top_address_inp">
						</div>
					</form>

					<div class="btn_box">
						<a class="button2" href="/psick/views/admin/adminInsertEventFrom.en">등록</a>
					</div>
				</div>
			</div>
			<div class="container-table">
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
				<div class="page_btn">
					<!-- 앞에 보여줄께 있어 -->
					<c:if test="${startPage > PAGE_PER_BLOCK}">
						<button
							onclick="location.href='/psick/views/admin/adminEvent.en?pageNum=${startPage - 1}'"
							class="button1">이전</button>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<button
							onclick="location.href='/psick/views/admin/adminEvent.en?pageNum=${i}'"
							class="button1">${i}</button>
					</c:forEach>
					<!-- 아직 보여줄께 남아있다 -->
					<c:if test="${endPage < totalPage}">
						<button
							onclick="location.href='/psick/views/admin/adminEvent.en?pageNum=${endPage + 1}'"
							class="button1">다음</button>
					</c:if>
				</div>
			</div>
		</div>
	</section>
</body>
</html>