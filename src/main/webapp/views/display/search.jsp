<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url("/psick/css/display/search.css")
</style>
<script>
function search() {
	let searchInput = document.querySelector('#searchInput').value;
	if (!searchInput) {
		alert("검색어를 입력해주세요");
	} else
	location.href="/psick/views/display/search.sh?search_data="+searchInput;
}

function enter() {
    if (window.event.keyCode == 13) {

         search();
    }
}

</script>

</head>
<body>
	<div class="sub_cont">
		<form name="searchForm" onsubmit="return false">
			<!-- <div class="search_sec01"> -->
				<div class="integrated_search">
					<div class="search_box">
						<input type="text" name="keyword" value=""
							class="totalSearchInputbox"
							id="searchInput" autocomplete="off" onkeyup="enter()"> 
							<!-- 다시 검색 -->
						<div onclick="search()" class="iconTotalSearchboxGlass" id="searchBtn"> 
							<img src="/psick/images/main_img/search.svg">
						</div>
					</div>
					<h2 class="keyword">' ${search_data } '
					<strong>검색 결과</strong>
					</h2>
					
					<div class="pd_list">
						<c:if test="${empty pdList}">
							<div class="search_text">
								검색 결과가 없습니다 <br> 다시 검색해 주세요
							</div>
						</c:if>
						<c:if test="${not empty pdList}">
							<div class="search_product">
								<c:forEach var="product" items="${pdList }">
									<div class="discount_list">
										<a href="/psick/views/display/product_content.sh?pno=${product.pno }">
											<div class="discount_list_cover">
												<div class="discount_list_image">
													<img
														src="/psick/images/product-img/${product.p_detail_img }">
												</div>
											</div>
											<div class="discount_list_title">${product.pname }</div> <span
											class="list_Price"><fmt:formatNumber
													value="${product.p_price- product.discount/100* product.p_price }"
													pattern="#">
												</fmt:formatNumber></span> <span class="won">원</span> <c:if
												test="${product.discount !=0 }">
												<span class="oldPrice">${product.p_price }</span>
											</c:if>
										</a>
									</div>
								</c:forEach>
							</div>
						</c:if>
					</div>
				</div>
			<!-- </div> -->
		</form>
	</div>
</body>
</html>