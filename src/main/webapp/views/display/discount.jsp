<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="inner">
		<div class="sub_cont">
			<h2 class="sub_tit">OnSale</h2>
			<div class="discount_sec">
				<div class="tab_ui_list tab_menu_list"></div>
			</div>
		</div>
	
	
		<div id="discount">
			<c:forEach var="product" items="${list}">

				<div class="discount_list">
					<a href="/psick/views/display/product_content.sh?pno=${product.pno }">
						<div class="discount_list_cover">
							<div class="discount_list_image">
								<img src="/psick/images/product-img/${product.p_detail_img }">
							</div>
						</div>
						<div class="discount_list_title">${product.pname }</div> <span
						class="list_Price"><fmt:formatNumber
                           value="${product.p_price- product.discount/100* product.p_price }"
                           pattern="#"></fmt:formatNumber></span>
						<span class="won">원</span> <c:if test="${product.discount !=0 }">
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
			<button onclick="location.href='/psick/views/display/discount.en?pageNum=${startPage-1}'" class="button1">이전</button>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<button onclick="location.href='/psick/views/display/discount.en?pageNum=${i}'" class="button1">${i}</button>
		</c:forEach>
		<!-- 아직 보여줄께 남아있다 -->
		<c:if test="${endPage < totalPage}">
			<button onclick="location.href='/psick/views/display/discount.en.do?pageNum=${endPage+1}'" class="button1">다음</button>
		</c:if>
	</div>
</body>
</html>