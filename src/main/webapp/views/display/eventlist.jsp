<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기획전 목록</title>
<style>
@import
url("/psick/css/display/eventlist.css")
</style>
</head>
<body>
	<div class="inner">
		<div class="sub_cont">
			<!-- <h2 class="sub_tit">추천상품</h2> -->
			<div class="best_sec">
				<div class="tab_ui_list tab_menu_list"></div>
			</div>
		</div>

	<h3 class="e_tit">${event.ename }</h3>
		<div class="event" id="list">
			<c:forEach var="product" items="${list }">
				<div class="event_list">
					<a
						href="/psick/views/display/product_content.sh?pno=${product.pno }">
						<div class="event_list_cover">
							<div class="event_list_image">
								<img src="/psick/images/product-img/${product.p_detail_img }">
							</div>
						</div>
						<div class="event_list_title">${product.pname }</div> <span
						class="list_Price"> <fmt:formatNumber
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
</body>
</html>