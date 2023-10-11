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

	function del(delRno) {
		var con = confirm("해당 상품를 삭제 하시겠습니까?");
		if(con) {
			location.href="/psick/views/admin/adminDelRewResult.en?rno="+delRno+"&del=y&pno=${pno}";
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
					<caption>${pno }번상품의댓글</caption>
					<tr>
						<th>댓글번호</th>
						<th>작성자</th>
						<th>제목</th>
						<th>점수</th>
						<th>작성일</th>
						<th>삭제여부</th>
						<th>상세내용</th>
						<th>삭제</th>
						<th>전시</th>

					</tr>
					<c:if test="${empty list }">
						<th colspan="9">댓글이 없습니다</th>
					</c:if>

					<c:if test="${not empty list }">
						<c:forEach var="review" items="${list }">
							<tr>
								<td>${review.rno }</td>
								<td>${review.id }</td>
								<td>${review.r_title }</td>
								<td>${review.star }</td>
								<td>${review.r_date }</td>
								<td>${review.r_del }</td>

								<td><a
									href="/psick/views/admin/adminUpdateRevForm.en?rno=${review.rno }&pno=${pno}">수정</a></td>
								<td><a onclick="del(${review.rno })">삭제</a></td>
								<td><a
									href="/psick/views/admin/adminDelRewResult.en?rno=${review.rno }&del=n&pno=${pno}">전시</a></td>

							</tr>
						</c:forEach>

					</c:if>
				</table>

			</div>
			<a href="/psick/views/admin/adminProReview.en?pno=${pno }" class="button2 wt_size">이전</a>

		</div>
	</section>



</body>
</html>