<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url("/psick/css/display/buylist.css");
</style>
</head>
<body>
	<div class="buylist-wrap">
		<div class="my_order_sec">
			<div class="myDelivery">
				<div class="title02">주문내역</div>
				<!-- 				폼 -->
				<form name="searchForm">
					<div class="my_order_bor">
						<div class="myDate">
							<div class="myDate_line">
								<h3 class="h1">상품명</h3>
								<h3 class="h2">수량</h3>
								<h3 class="h3">배송</h3>
							</div>
							<!--  myDate_line : e -->
						</div>
						<!--  myDate : E -->
					</div>
				</form>
				<!-- 				폼 -->


			</div>
			<div class="order_check_cont">
				<c:forEach var="product" items="${pdlist }" varStatus="v">
					<table>
						<colgroup>
							<col style="width: 80px">
							<col style="width: 280px">
						</colgroup>
						<tbody>
							<tr>
								<td class="order_prod_con01">
									<div class="prod_thum_img">
									 <img src="/psick/images/product-img/${product.p_detail_img }"> 
										
									</div>
								</td>
								<td class="order_prod_con02">
									<p>
										<a
											href="/psick/views/display/product_content?pno=${product.pno }">
											${product.pname } </a>
									</p>
								<td class="order_prod_count" rowspan="1">
									<div class="last_td">
										<p>${product.buy_count }</p>
									</div>
								</td>
								<td class="order_prod_con04" rowspan="1">
									<div class="delivery_td">
										<p>배송중</p>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</c:forEach>
			</div>
			<!--  //my_order_bor : e -->
			<div class="date_send">
				<button type="button" name="button" class="btn_send_st01"
					onclick="location.href='/psick/views/display/main.en'">메인으로</button>
			</div>
		</div>
		<!--  //myDelivery : e -->
	</div>

</body>
</html>