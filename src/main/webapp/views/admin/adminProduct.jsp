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
			<div class="top">
				<div class="searchForm">
					<form action="/psick/views/admin/adminFindProduct.en" name="frm"
						onsubmit="return chk()">
						<select name="searchKey" class="searchTab">
							<option value="pno">상품코드</option>
							<option value="pname">상품명</option>
							<option value="p_kind">종류</option>
						</select>
						<div class="search_box02">
							<input type="text" name="searchValue" class="searchTab"
								placeholder="검색어를 입력해주세요."> <input type="submit"
								value="검색" class="top_address_inp">
						</div>
					</form>

					<div class="btn_box">
						<a class="button2" href="/psick/views/admin/adminInsertForm.en">등록</a>
					</div>
				</div>
			</div>
			<div class="container-table">
				<table>
					<caption>상품목록</caption>
					<tr>
						<th>상품번호</th>
						<th>상품명</th>
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
						<th>리뷰</th>
					</tr>
					<c:if test="${empty list }">
						<th colspan="13" class="list">상품이 없습니다</th>
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
									href="/psick/views/admin/adminProReview.en?pno=${product.pno }">리뷰</a></td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
				<div class="page_btn">
					<!-- 앞에 보여줄께 있어 -->
					<c:if test="${startPage > PAGE_PER_BLOCK}">
						<button
							onclick="location.href='/psick/views/admin/adminProduct.en?pageNum=${startPage - 1}'"
							class="button1">이전</button>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<button
							onclick="location.href='/psick/views/admin/adminProduct.en?pageNum=${i}'"
							class="button1">${i}</button>
					</c:forEach>
					<!-- 아직 보여줄께 남아있다 -->
					<c:if test="${endPage < totalPage}">
						<button
							onclick="location.href='/psick/views/admin/adminProduct.en?pageNum=${endPage + 1}'"
							class="button1">다음</button>
					</c:if>
				</div>
			</div>
		</div>
	</section>
</body>
</html>