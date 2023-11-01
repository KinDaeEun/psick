<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<style type="text/css">
@import url("/psick/css/member/mycart.css");
</style>

<script type="text/javascript">
$(document).ready(function () {
	  calculateTotalPrice();
	  $('input[type="checkbox"][name="pno"]').change(function () {
	    calculateTotalPrice();
	  });
	  $('.Qty').change(function () {
	    updatePrice($(this));
	  });
	  function calculateTotalPrice() {
	    var totalPrice = 0;
	    var totalAmt = 0; 
	    // 배송비 미포함 총 가격	    
	    var totalAmts = 0;
	    // 배송비 포함 총 가격
	    $('input[type="checkbox"][name="pno"]').each(function () {
	      var priceElement = $(this).closest('tr').find('.priceNum');
	      var quantity = parseInt($(this).closest('tr').find('.Qty').val());
	      var unitPrice = parseFloat(priceElement.val());
	      var totalAmount = quantity * unitPrice;	    
	      if ($(this).is(':checked')) {
	    	  totalAmt += totalAmount;
	        totalAmts += totalAmount;
	      }
	    });
	    var totalAmt = totalAmt;
	    var totalAmts = totalAmts + 3000;
	    $('#subTotPrc').text(totalAmt.toLocaleString());
	    $('#goods_price').val(totalAmt);
	    $('#subTotPrc1').text(totalAmt.toLocaleString());
	    $('#subTotPrc4').text(totalAmt.toLocaleString());
	    $('#subTotPrc3').text(totalAmts.toLocaleString());
	  }
	  function updatePrice(input) {
	    calculateTotalPrice();
	  }
	});




$(function() {

  $('.btn_plus').click(function() {
    updateQuantity(this, 1);
  });


  $('.btn_minus').click(function() {
    updateQuantity(this, -1);
  });

  function updateQuantity(button, change) {
    let quantityInput = $(button).siblings('.Qty');


    let currentQuantity = parseInt(quantityInput.val());
    let newQuantity = currentQuantity + change;

    let priceElement = $(button).closest('tr').find('.priceNum');

    let unitPrice = parseFloat(priceElement.val());
    let totalAmount = newQuantity * unitPrice;

    newQuantity = Math.max(1, newQuantity);
    quantityInput.val(newQuantity);

 
    if (newQuantity === 0) {
      alert("1개 이상 구매해야 합니다.");
      newQuantity = 1; // 최소값 1로 설정
      quantityInput.val(newQuantity); // 수량 업데이트
      totalAmount = unitPrice; // 총 가격 업데이트
    }


    $(button).closest('tr').find('.car_won').text(totalAmount);
  }
});


</script>

<%@ include file="/views/sessionChk.jsp"%>
</head>
<body>
	<form name="frm" action="/psick/views/display/buyForm.sh">
		<!-- 전체 -->
		<section>
			<c:if test="${empty list }">
				<div align="center">
					<span>상품이 없습니다.</span>
				</div>
			</c:if>
			<c:if test="${not empty list }">
				<div class="cart-content-wrap">
					<div class="cart-content">
						<h2 class="sub_tit_st02">${member.name }님의장바구니</h2>
						<div class="tab_ui_cont event_cont">
							<div class="cart_top_info">
								<div class="selectAllWrapper flexBottom">
									<div class="bott_check_rit">
<!-- 										<label class="check_st01">
									 <input type="checkbox"	name="che" onclick='checkmarkAll(this)' id="itemAllCheck">전체선택
											<span class="checkmark all"></span>
										</label> -->
									</div>
									<!-- 		<button type="button" class="btnGray29 removeChoice" 
									<!-- 	    disabled="disabled">선택삭제</button> -->
									<button type="button"
										onclick="javascript:location.href='myCartListAllDel.ys'"
										class="btnGray29 marginL1_0 removeAll">전체삭제</button>
								</div>
							</div>
						</div>
						<div class="cart_top_info">
							<div class="caption flexMiddleEdge">
								<div class="flexMiddle">
									 <span>장바구니 상품 </span>&nbsp;<span id="2121" class="number">${list.size() }${product.p_price }</span>개
									&nbsp; <span class="iconQuestion"> </span>
								</div>
							</div>

						</div>


						<input type="hidden" id="goods_price" name="goods_price">

						<div class="cart_cont">
							<div class="lef_cart" id="cart-general-list-mst">

								<div class="cart_sec01" id="cart-general-list-mst-21"
									data-value="21">

									<div class="order_check_cont cart-general-price-info-mst"
										data-out-schde="">

										<c:forEach var="product" items="${list }" varStatus="v">
											<table>
												<colgroup>
													<col style="width: 40px">
													<col style="width: 90px">
													<col style="width: 356px">
													<col style="width: 101px">
													<col style="width: 20px">
													<col style="width: 177px">
													<col style="width: 73px">
												</colgroup>
												<tr class="product_plus" data-basket-seq="9715603"
													data-goods-cd="WG026654" data-item-cd="026654"
													data-dlv-store="9002">
													<td><label class="check_st01 pl20 checked_${v.index}">
															<input type="checkbox" checked="checked" name="pno" id="che"
															value="${product.pno}" onChange="cal(${v.index})">
															<span class="checkmark"></span>
													</label></td>
													<td class="order_prod_con01"><a
														href="javascript:cl.page.goToGoodsDetail('WG026654')">
															<div class="prod_thum_img prod_thum_img02">
																<img
																	onclick="javascript:location.href='/psick/views/display/product_content.sh?pno=${product.pno}';"
																	src="/psick/images/product-img/${product.p_detail_img }"
																	onerror="this.src='/resources/images/common/produnct_img_default.png';">
															</div>
													</a></td>
													<td class="order_prod_con02"><a
														href="/psick/views/display/product_content.sh?pno=${product.pno}">${product.pname }</a></td>
													<td class="order_prod_con03">
														<div class="product_num product_num_small">
															<a class="btn_minus"></a> <input type="text"
																id="pd_count_${v.index}" name="buy_count" class="Qty"
																value="1" maxlength="3" style="background-color: white;"
																data-unit-qty="1"> <a class="btn_plus"></a>
														</div> <!-- //e  goodsRostokYn 1 : 품절, 2 :일시품절 rewahsNoticeYn : 재입고 알림여부  -->

													</td>
													<td class="tb_pa">
														<div></div>
													</td>
													<td class="td_delivery cart-general-item-sale-mst">
														<!-- goodsRostokYn 1 : 품절, 2 :일시품절 --> <!-- rewahsNoticeYn : 재입고 알림여부 -->
														<div class="rit_price_an">
															<span class="car_won" id="goods_price1_${v.index}">
																<fmt:formatNumber
																	value="${product.p_price- product.discount/100* product.p_price }"
																	pattern="#">
																</fmt:formatNumber>
															</span> <input type="hidden" class="priceNum"
																value="<fmt:formatNumber
																		value="${product.p_price- product.discount/100* product.p_price }"
																		pattern="#"/>" />
														</div>
													</td>

													<td class="order_prod_con04">
														<div class="last_td text-left">
															<a
																onclick="location.href='myCartListDel.ys?pno=${product.pno}';">
																<img
																onclick="javascript:location.href='myCartListDel.ys?pno=${product.pno}';"
																src="/psick/images/icon_img/icon_delete02.svg" alt="삭제">
															</a>
														</div>
													</td>
												</tr>
												</tbody>
											</table>

										</c:forEach>
										<div class="cart_total_price">
											<div class="list_total_price">
												<h5>주문금액</h5>
												<p>
													<span id="subTotPrc" style="color: black;"></span> <span>
														원</span>
												</p>
											</div>
											<div class="cart_list_txt01">
												<span class="subPrcInfo">상품금액 <span id="subTotPrc1"
													style="color: black;"></span> 원 + 배송비 3000 원
												</span>
											</div>

											<div class="delivery_dc_txt">
												<p>
													상품 <span id="caculDlvS">10,000원 이상 무료배송(일부상품제외)</span>
												</p>
											</div>
										</div>
									</div>
									<!--  //cart_sec01 : e -->
								</div>


								<!--결제예정금액 -->
								<div class="rit_cart" id="cart-general-price-totalInfo-mst">
									<div class="price_bar_wrap">
										<div class="cart_payment_bor">
											<h3>결제예정금액</h3>
											<div class="buy_option_line">
												<dl>
													<dt>총 상품금액</dt>
													<dd>
														<strong id="subTotPrc4"></strong> <span>원</span>
													</dd>
												</dl>
												<dl>
													<dt>총 할인금액</dt>
													<dd>
														<strong>- 0</strong> <span>원</span>
													</dd>
												</dl>
												<div class="dc-area">
													<dl id="dlDcPrcTotal" style="display: none;">
														<dt>상품할인</dt>
														<dd>
															- <strong id="strDcPrcTotal">0</strong> <span>원</span>
														</dd>
													</dl>
												</div>
												<dl>
													<dt>총 배송비</dt>
													<dd>
														<strong></strong> <span>3000원</span>
													</dd>
												</dl>
											</div>
											<div class="bott_total_order">
												<dl class="mb40">
													<dt>총 주문금액</dt>
													<dd>
														<strong id="subTotPrc3"></strong><span>원</span>
													</dd>
												</dl>
												<input type="submit" value="주문하기" id="btn_back_gr">

											</div>
										</div>
									</div>
								</div>
								<!--결제예정금액 -->
							</div>
						</div>
					</div>
				</div>


			</c:if>
		</section>
	</form>
	<!--전체 -->
</body>
</html>