<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="inner">
	<h3 >${kind }</h3>
		<div class="prod_list_filter">
			
			<div class="lef_fil">
			
				<a
					onclick="location.href='/psick/views/display/categories.en?order=avg(star) desc&kind=${kind}'"
					id="recommend" class="on">추천순 </a> <a
					onclick="location.href='/psick/views/display/categories.en?order=p_date desc&kind=${kind}'"
					id="recommend" class="on">신상품순 </a> <a
					onclick="location.href='/psick/views/display/categories.en?order=(p_price - (discount/100 * p_price))&kind=${kind}'"
					id="topPrice" class="on">최저가격순</a> <a
					onclick="location.href='/psick/views/display/categories.en?order=(p_price - (discount/100 * p_price)) desc&kind=${kind}'"
					id="lowPrice" class="on">최고가격순</a>
			</div>
		</div>
		<div id="best">
			<c:forEach var="product" items="${list}">

				<div class="best_list">
					<a
						href="/psick/views/display/product_content.sh?pno=${product.pno }">
						<div class="best_list_cover">
							<div class="best_list_image">
								<img src="/psick/images/product-img/${product.p_detail_img }">
							</div>
						</div>
						<div class="best_list_title">${product.pname }</div> <span
						class="list_Price"><fmt:formatNumber
								value="${product.p_price- product.discount/100* product.p_price }"
								pattern="#"></fmt:formatNumber></span> <span class="won">원</span> <c:if
							test="${product.discount !=0 }">
							<span class="oldPrice">${product.p_price }</span>
						</c:if>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>

	<div align="center">
		<!-- 앞에 보여줄께 있어 -->
		<c:if test="${startPage > PAGE_PER_BLOCK }">
			<button
				onclick="location.href='/psick/views/display/categories.en?pageNum=${startPage-1}&kind={kind}&order=${order }'">이전</button>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<button
				onclick="location.href='/psick/views/display/categories.en?pageNum=${i}&kind=${kind}&order=${order }'" class="button1">${i}</button>
		</c:forEach>
		<!-- 아직 보여줄께 남아있다 -->
		<c:if test="${endPage < totalPage}">
			<button
				onclick="location.href='/psick/views/display/categories.en?pageNum=${endPage+1}&kind=${kind}&order=${order }'">다음</button>
		</c:if>
	</div>
</body>
</html>