<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url("/psick/css/admin/adminProduct.css");github에서 수정
</style>
<script type="text/javascript">
	function chk() {
		if (!frm.searchValue.value) {
			alert("검색어를 입력하세요");
			frm.searchValue.focus();
			return false;
		}
	}
	function del(delAno) {
		var con = confirm("해당 게시글를 삭제 하시겠습니까?");
		if(con) {
			location.href="/psick/views/admin/adminDelAccResult.en?ano="+delAno+"&del=y";
		}
	}
</script>
</head>
<body>
	<section>
		<div class="sect_wrap">
			<div class="top">
				<div class="searchForm">
					<form action="/psick/views/admin/adminFindAccount.en" name="frm"
						onsubmit="return chk()" enctype="multipart/form-data">
						<select name="searchKey" class="searchTab">
							<option value="ano">게시글번호</option>
							<option value="id">아이디</option>
							<option value="a_title">제목</option>
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
					<caption>게시글목록</caption>
					<tr>
						<th>게시글번호</th>
						<th>아이디</th>
						<th>작성자</th>
						<th>제목</th>
						<th>조회수</th>
						<th>작성일</th>
						<th>삭제여부</th>
						<th>상세</th>
						<th>삭제</th>
						<th>전시</th>
						<th>댓글</th>
	
					</tr>
					<c:if test="${empty list }">
						<th colspan="11" class="list">게시글이 없습니다</th>
					</c:if>
					<c:if test="${not empty list }">
						<c:forEach var="account" items="${list }">
							<tr>
								<td>${account.ano }</td>
								<td>${account.id }</td>
								<td>${account.a_name }</td>
								<td>${account.a_title }</td>
								<td>${account.a_cnt }</td>
								<td>${account.a_date }</td>
								<td>${account.a_del }</td>
			
								<td><a
									href="/psick/views/admin/adminUpdateAccForm.en?ano=${account.ano }">수정</a></td>
								<td><a onclick="del(${account.ano })">삭제</a></td>
								<td><a
									href="/psick/views/admin/adminDelAccResult.en?ano=${account.ano }&del=n">전시</a></td>
								<td><a
									href="/psick/views/admin/adminReply.en?ano=${account.ano }">댓글</a></td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
				<div class="page_btn">
					<!-- 앞에 보여줄께 있어 -->
					<c:if test="${startPage > PAGE_PER_BLOCK}">
						<button
							onclick="location.href='/psick/views/admin/adminAccount.en?pageNum=${startPage - 1}'"
							class="button1">이전</button>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<button
							onclick="location.href='/psick/views/admin/adminAccount.en?pageNum=${i}'"
							class="button1">${i}</button>
					</c:forEach>
					<!-- 아직 보여줄께 남아있다 -->
					<c:if test="${endPage < totalPage}">
						<button
							onclick="location.href='/psick/views/admin/adminAccount.en?pageNum=${endPage + 1}'"
							class="button1">다음</button>
					</c:if>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
