
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>


 	<!-- 배너 -->

	<div id="banner" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#banner" data-bs-slide-to="0"
				class="active" aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#banner" data-bs-slide-to="1"
				aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#banner" data-bs-slide-to="2"
				aria-label="Slide 3"></button>
		</div>

		<div class="carousel-inner">
			<div class="carousel-item active b-item" data-bs-interval="3000">
				<img
					src="https://images.unsplash.com/photo-1448375240586-882707db888b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"
					class="d-block w-100 b-img" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h1 class="fw-bolder">Best</h1>
				</div>
			</div>

			<div class="carousel-item b-item" data-bs-interval="3000">
				<img
					src="https://images.unsplash.com/photo-1542273917363-3b1817f69a2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1174&q=80"
					class="d-block w-100 b-img" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h1 class="fw-bolder">Sale</h1>
				</div>
			</div>

			<div class="carousel-item b-item" data-bs-interval="3000">
				<img
					src="https://images.unsplash.com/photo-1494825514961-674db1ac2700?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"
					class="d-block w-100 b-img" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h1 class="fw-bolder">New</h1>
				</div>
			</div>
		</div>


		<button class="carousel-control-prev" type="button"
			data-bs-target="#banner" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#banner" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<!-- 강력추천 -->
	<section class="utl wow">
		<div class="inner">
			<div class="section_title">
				<a href="#">장바구니로 바로 클릭! 강력 추천 상품</a>
			</div>
			<div class="slogan">취향 맞춤 추천 상품과 신선한 제철 상품을 함께 만나보세요.</div>
		</div>
		<div class="inner">
			<div id="best">
				<c:forEach var="product" items="${bestList }" begin="0" end="3">

					<div class="best_list">
						<a href="/psick/views/display/product_content.sh?pno=${product.pno }">
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
	</section>


	<!-- 세일 -->
	<section class="ltl wow">
		<div class="inner">
			<div class="section_title">
				<a href="#">ON Sale</a>
			</div>
			<div class="slogan">매주 달라지는 다양한 혜택을 모아모아!</div>
		</div>
		<div class="inner">
			<div id="discount"> 

				<c:forEach var="product" items="${disList }" begin="0" end="3">

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
									pattern="#"></fmt:formatNumber></span> <span class="won">원</span> <c:if
								test="${product.discount !=0 }">
								<span class="oldPrice">${product.p_price }</span>
							</c:if>
						</a>
					</div>
				</c:forEach>


			</div>
		</div>
	</section>


	<!-- 신제품 -->
	<section class="rtl wow">
		<div class="inner">
			<div class="section_title">
				<a href="#">오늘 이 재료 어때요?</a>
			</div>
			<div class="slogan">몸과 마음을 따뜻하고 든든하게 채워주는 새로운 식재료</div>
		</div>
		<div class="inner">
			<div id="new">
				<c:forEach var="product" items="${freshList }" begin="0" end="3">

					<div class="new_list">
						<a href="/psick/views/display/product_content.sh?pno=${product.pno }">
							<div class="new_list_cover">
								<div class="new_list_image">
									<img src="/psick/images/product-img/${product.p_detail_img }">
								</div>
							</div>
							<div class="new_list_title">${product.pname }</div> <span
							class="list_Price"><fmt:formatNumber value="${product.p_price- product.discount/100* product.p_price }" pattern="#"></fmt:formatNumber></span> <span class="won">원</span> <c:if
								test="${product.discount !=0 }">
								<span class="oldPrice">${product.p_price }</span>
							</c:if>
						</a>
					</div>


				</c:forEach>

			</div>
		</div>
	</section>
</body>
</html>
