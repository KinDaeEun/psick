<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url("/psick/css/display/buysee.css");
</style>
</head>
<body>
	<div class="order_completed">
		<img src="/psick/images/icon_img/iconCompleteOrder.svg" alt="icon">
		<p class="customer_name">
			<span>${member.id }</span> 고객님
		</p>
		<p class="guide_message">주문 결제가 완료되었습니다.</p>
		<!-- 1:일반 , 2:예약, 3:매장,4:혼합 8:새벽 -->
		<p class="comple_message_txt">
			매장 주문상품은 <span>2일</span> 이내 발송됩니다.
		</p>
		<div class="my_bott_btn my_bott_btn02">
			<button type="button" name="button" class="btnGray40"
				onclick="location.href='/psick/views/display/main.en'">쇼핑계속하기</button>
			<button type="button" name="button" class="btn_send_st01"
				onclick="location.href='/psick/views/display/buyList2.sh?bno=${bno}'">주문내역보기</button>
		</div>
	</div>
</body>
</html>