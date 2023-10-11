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
	
</script>
</head>
<body>
	<section>

		<div class="sect_wrap">

			<div class="container-table">
				<form action="/psick/views/admin/adminInsertElResult.en">
				<input type="hidden" name="eno" value="${eno }">
				<input type="submit" value="등록">
					<table>
						<caption>상품목록</caption>
						<tr>
							<th>선택</th>
							<th>상품번호</th>
							<th>상품명</th>
							<th>종류</th>
							<th>상품가격</th>
							<th>할인율</th>
							<th>원산지</th>
							<th>등록일</th>
							<th>수량</th>
							<th>삭제여부</th>

						</tr>
						<c:if test="${empty list }">
							<th colspan="13" class="list">상품이 없습니다</th>
						</c:if>
						<c:if test="${not empty list }">
							<c:forEach var="product" items="${list }">

								<tr>
									<td><input type="checkbox" value="${product.pno }"
										name="pno"></td>
									<td>${product.pno }</td>
									<td>${product.pname }</td>
									<td>${product.p_kind }</td>
									<td>${product.p_price }</td>
									<td>${product.discount }</td>
									<td>${product.p_country }</td>
									<td>${product.p_date }</td>
									<td>${product.p_count }</td>
									<td>${product.p_del }</td>

								</tr>
							</c:forEach>
						</c:if>
					</table>
				</form>
			</div>
		</div>

	</section>
</body>
</html>