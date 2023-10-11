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

	function del(delRe_no) {
		var con = confirm("해당 댓글을 삭제 하시겠습니까?");
		if(con) {
			location.href="/psick/views/admin/adminDelRepResult.en?re_no="+delRe_no+"&del=y&ano=${ano}";
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
					<caption>${ano }번게시글의댓글</caption>
					<tr>
						<th>댓글번호</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>삭제여부</th>
						<th>상세</th>
						<th>삭제</th>
						<th>전시</th>

					</tr>
					<c:if test="${empty list }">
						<th colspan="7">댓글이 없습니다</th>
					</c:if>

					<c:if test="${not empty list }">
						<c:forEach var="reply" items="${list }">
							<tr>
								<td>${reply.re_no }</td>
								<td>${reply.id }</td>
								<td>${reply.ref_date }</td>
								<td>${reply.ref_del }</td>
								<td><a
									href="/psick/views/admin/adminUpdateRepForm.en?re_no=${reply.re_no }&ano=${ano}">수정</a></td>
								<td><a onclick="del(${reply.re_no })">삭제</a></td>
								<td><a
									href="/psick/views/admin/adminDelRepResult.en?re_no=${reply.re_no }&del=n&ano=${ano}">전시</a></td>

							</tr>
						</c:forEach>

					</c:if>
				</table>

			</div>
			<a href="/psick/views/admin/adminReply.en?ano=${ano }" class="button2 wt_size">이전</a>
		</div>
	</section>



</body>
</html>