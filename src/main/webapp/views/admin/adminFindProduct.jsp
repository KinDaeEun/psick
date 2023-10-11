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
function del(delPno) {
	var con = confirm("해당 상품를 삭제 하시겠습니까?");
	if(con) {
		location.href="/psick/views/admin/adminDelProResult.en?pno="+delPno+"&del=y";
	}
}
</script>
</head>
<body>
	<section>
		<div class="sect_wrap">
			${keyName } : ${searchValue }
			<table>
				<caption>상품목록</caption>
				<tr>
					<th>상품번호</th>
					<th>상품이름</th>
					<th>종류</th>
					<th>상품가격</th>
					<th>할인율</th>
					<th>원산지</th>
					<th>등록일</th>
					<th>수량</th>
					<th>삭제여부</th>
					<th>수정</th>
					<th>삭제</th>
					<th>전시</th>
					<th>댓글</th>
				</tr>
				<c:if test="${empty list }">
					<th colspan="13">상품이 없습니다</th>
				</c:if>

				<c:if test="${not empty list }">
					<c:forEach var="product" items="${list }">
						<tr>
							<td>${product.pno }</td>
							<td>${product.pname }</td>
							<td>${product.p_kind }</td>
							<td>${product.p_price }</td>
							<td>${product.discount }</td>
							<td>${product.p_country }</td>
							<td>${product.p_date }</td>
							<td>${product.p_count }</td>
							<td>${product.p_del }</td>
							<td><a
								href="/psick/views/admin/adminUpdateProForm.en?pno=${product.pno }">수정</a></td>
							<td><a onclick="del(${product.pno })">삭제</a></td>
							<td><a
								href="/psick/views/admin/adminDelProResult.en?pno=${product.pno }&del=n">전시</a></td>
							<td><a
								href="/psick/views/admin/adminProReview.en?pno=${product.pno }">댓글</a></td>
						</tr>
					</c:forEach>

				</c:if>
			</table>
			<div class="flex mt-50">
				<a href="/psick/views/admin/adminProduct.en" class="button2 wt_size">이전</a>
			</div>
		</div>
	</section>
</body>
</html>