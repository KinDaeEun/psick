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
		var con = confirm("해당 상품를 기획전에서 삭제 하시겠습니까?");
		if(con) {
			location.href="/psick/views/admin/adminDelEventList.en?pno="+delPno+"&eno=${eno}";
		}
	}
</script>
</head>
<body>
	<section>
		<div class="sect_wrap">
			<div class="top">
				<div class="searchForm">

					<div></div>
					<div class="btn_box">
						<a class="button2" href="/psick/views/admin/adminInsertElFrom.en?eno=${eno}">상품추가</a>
					</div>
				</div>
			</div>
			<div class="container-table">
				<table>
					<caption>기획상품</caption>
					<tr>
						<th>상품번호</th>
						<th>상품명</th>
						<th>종류</th>		
						<th>상품가격</th>				
						<th>할인율</th>
						<th>원산지</th>
						<th>등록일</th>
						<th>수량</th>
						<th>삭제</th>

					</tr>
					<c:if test="${empty list }">
						<th colspan="9" class="list">상품이 없습니다</th>
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
								<td><a onclick="del(${product.pno })">삭제</a></td>
							</tr>
						</c:forEach>
					</c:if>
				</table>

			</div>
			<a href="/psick/views/admin/adminEvent.en" class="button2 wt_size">이전</a>

		</div>
	</section>
</body>
</html>