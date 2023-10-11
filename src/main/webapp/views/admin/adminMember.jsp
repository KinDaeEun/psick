<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function chk() {
	if (!frm.searchValue.value) {
		alert("검색어를 입력하세요");
		frm.searchValue.focus();
		return false;
	}
}
	function del(delId) {
		var con = confirm("해당 회원을 탈퇴 하시겠습니까?");
		if (con) {
			location.href = "/psick/views/admin/adminDelMemResult.en?id="
					+ delId+"&del=y";
		}
	}
</script>
<style>
@import url("/psick/css/admin/adminProduct.css");
</style>
</head>
<body>
	<section>
		<div class="sect_wrap">
			<div class="top">
				<div class="searchForm">
					<form action="/psick/views/admin/adminFindMember.en" name="frm"
						onsubmit="return chk()" enctype="multipart/form-data">
						<select name="searchKey" class="searchTab">
							<option value="id">아이디</option>
							<option value="name">이름</option>

						</select> 
						<div class="search_box02">
							<input type="text" name="searchValue" class="searchTab"
							placeholder="검색어를 입력해주세요."> <input type="submit"
							value="검색" class="top_address_inp">
						</div>
					</form>
				</div>

			</div>
			<div class="container-table">

				<table>
					<caption>회원목록</caption>
					<tr>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>전화</th>
						<th>성별</th>
						<th>주소</th>
						<th>상세주소</th>
						<th>가입일</th>
						<th>프사</th>
						<th>탈퇴여부</th>
						<th>수정</th>
						<th>탈퇴</th>
						<th>복구</th>
					</tr>
					<c:if test="${empty list }">
						<th colspan="13">회원이 없습니다</th>
					</c:if>

					<c:if test="${not empty list }">
						<c:forEach var="member" items="${list }">
							<tr>
								<td>${member.id }</td>
								<td>${member.password }</td>
								<td>${member.name }</td>
								<td>${member.tel }</td>
								<td>${member.gender }</td>
								<td>${member.addr }</td>
								<td>${member.addr_detail }</td>
								<td>${member.reg_date }</td>
								<td>${member.profile }</td>
								<td>${member.m_del }</td>
								<td><a
								href="/psick/views/admin/adminUpdateMemForm.en?id=${member.id }">수정</a></td>

							<td><a onclick="del('${member.id }')">탈퇴</a></td>
							<td><a
								href="/psick/views/admin/adminDelMemResult.en?id=${member.id }&del=n">복구</a></td>
							</tr>
						</c:forEach>

					</c:if>
				</table>
				<div class="page_btn">
					<!-- 앞에 보여줄께 있어 -->
					<c:if test="${startPage > PAGE_PER_BLOCK}">
						<button
							onclick="location.href='/psick/views/admin/adminMember.en?pageNum=${startPage - 1}'"
							class="button1">이전</button>
					</c:if>

					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<button
							onclick="location.href='/psick/views/admin/adminMember.en?pageNum=${i}'"
							class="button1">${i}</button>
					</c:forEach>
					<!-- 아직 보여줄께 남아있다 -->

					<c:if test="${endPage < totalPage}">
						<button
							onclick="location.href='/psick/views/admin/adminMember.en?pageNum=${endPage + 1}'"
							class="button1">다음</button>
					</c:if>
				</div>
			</div>
		</div>
	</section>
</body>
</html>