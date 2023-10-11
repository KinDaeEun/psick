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

			<div class="container-table">
			${keyName } : ${searchValue }
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
				<div class="flex mt-50">
					<a href="/psick/views/admin/adminAccount.en" class="button2 wt_size">이전</a>
				</div>

			</div>
		</div>
	</section>
</body>
</html>