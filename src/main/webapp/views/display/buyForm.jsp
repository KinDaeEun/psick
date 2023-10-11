<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	window.onload = function() {
		document
				.getElementById("delivery-view")
				.addEventListener(
						"click",
						function() { //주소입력칸을 클릭하면
							//카카오 지도 발생
							new daum.Postcode(
									{
										oncomplete : function(data) { //선택시 입력값 세팅
											document
													.getElementById("delivery-view").value = data.address; // 주소 넣기
											document.querySelector(
													"input[name=addr]").focus(); //상세입력 포커싱
										}
									}).open();
						});
	}
</script>
<style>
@import
url("/psick/css/display/buy.css")
</style>
</head>
<body>
	<div class="contents pa_top172">
		<form name="orderForm" action="/psick/views/display/buyResult.sh"
			method="post" id="orderForm">
			<div class="sub_cont myOrderWrapper">
				<h2 class="sub_tit">주문서 작성</h2>
				<div class="cart_cont order_wh_wrap">

					<div class="lef_cart">
						<div class="order_wh_top">
							<div class="sectionTitle">배송지 정보</div>
							<div id="delivery-info-area" class="delivery-info-area">

								<div class="articleWrapper1">
									<div class="formTable1 delivery-table">

										<table class="formTable">
											<colgroup>
												<col style="width: 250px">
												<col style="width: auto">
											</colgroup>
											<!-- 										<tbody> -->
											<!-- 주문자 -->
											<tr>
												<td>
													<div class="formHeaderTextDot14">주문자</div>
												</td>
												<td>
													<div class="_orderMember">
														<input type="text" name="b_reveiver" id="b_reveiver"
															value="${member.name }" required autofocus> <input
															type="text" name="b_tel" id="b_tel"
															value="${member.tel }" required>
													</div>
												</td>
											</tr>
											<!-- 배송지 -->
											<tr>
												<td>
													<div class="formHeaderTextDot14">배송지</div>
												</td>
												<td>
													<div>
														<input type="text" name="b_addr" id="delivery-view"
															value="${member.addr }" required> <input
															type="text" name="addr" value="${member.addr_detail }"
															required>
													</div>
												</td>
											</tr>
											<!-- 배송지 출입방법 -->
											<tr>
												<td>
													<div class="formHeaderTextDot14">배송지 출입방법</div>
												</td>
												<td>
													<div class="inputSelectWrap">
														<input type="text" name="memo" class="selectInnerInput"
															placeholder="공동현관 출입 방법 등의 배송지 출입 방법을 입력해주세요." required
															maxlength="75" style="border-color: rgb(204, 204, 204);">
													</div>
												</td>
											</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>

							<div class="divStoreLogisCart">
								<div class="articleWrapper2 goods-info storeLogisCartList">
									<div class="cart_top_info">
										<span class="amountNumber">배송상품&nbsp; </span>
									</div>
									<div class="cart_sec01">
										<div class="order_check_cont">
											<table class="listTable">
												<colgroup>
													<col style="width: 100px">
													<col style="width: 300px">
													<col style="width: 150px">
													<col style="width: 1px">
													<col style="width: 250px">
												</colgroup>
												<c:forEach var="product" items="${list }" varStatus="v">
													<input type="hidden" name="pno" value="${product.pno}">
													<input type="hidden" name="buy_count" value="${product.buy_count }">
<!-- 													<input type="text" name="count" -->
<%-- 														value="${product.p_count}"> --%>
													<tbody>
														<tr>
															<td class="detail_img"><img
																src="/psick/images/product-img/${product.p_detail_img }">
															</td>
															<td class="name">${product.pname }</td>
															<td class="amount">수량 <span>${product.buy_count }</span>&nbsp;개
															</td>
															<td class="v-line"></td>
															<td class="price"><fmt:formatNumber
																	value="${(product.p_price- product.discount/100* product.p_price)  * product.buy_count }"
																	pattern="#"></fmt:formatNumber>원</td>
														</tr>
												</c:forEach>


												<!-- 총 주문 -->
												<tr class="_total">
													<td colspan="5" class="totalAmountTd pa_rit50">
														<div class="list_total_price">
															<h5>주문금액</h5>
															<p>
																<strong>${goods_price + 3000}</strong> <span>원</span>
															</p>
														</div>
													</td>
												</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>

							<div class="cart_payment_bor">
								<div class="buy_option_line">최종 결제 정보</div>
								<div class="articleWrapper3">
									<table class="formTable2">
										<colgroup>
											<col style="width: 250px">
											<col style="width: auto">
											<%-- <col style="width: 450px"> --%>
										</colgroup>
										<tbody>
											<tr>
												<td>
													<div class="formHeaderTextDot14">
														<!-- ::before -->
														총 상품금액
													</div>
												</td>
												<td></td>
												<td class="alignRight"><span class="price totGoodsAmt"
													id="totGoodsAmt">${goods_price }&nbsp;원</span></td>
											</tr>
											<tr>
												<td>
													<div class="formHeaderTextDot14">
														<!-- before -->
														총 배송비
													</div>
												</td>
												<td></td>
												<td class="alignRight"><span class="price"
													id="totalDlvFee">3000&nbsp;원</span>
													<div class="priceDetail" id="totalDlvFeeInfoTxt"></div></td>
											</tr>
										</tbody>
									</table>
									<table class="formTable3">
										<colgroup>
											<col style="width: 180px">
											<col style="width: auto">
										</colgroup>
										<tbody>
											<tr>
												<td>
													<div class="formHeaderTextDot14">
														<!-- :before -->
														최종결제금액
													</div>
												</td>
												<td class="alignRight"><span
													class="totalPrice totPaymentAmtText" id="totalPaymentAmt">
														${goods_price + 3000 } </span> <span class="totalWon">원</span></td>
											</tr>
										</tbody>
									</table>
									<div class="agreement_box mb30">
										<p class="col_gr">구매조건을 확인하였으며, 구매에 동의합니다</p>
									</div>
									<input type="submit" value="결제하기 &nbsp;${goods_price + 3000 }원"
										class="btn_back_gr payBtn" id="payBtn">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>