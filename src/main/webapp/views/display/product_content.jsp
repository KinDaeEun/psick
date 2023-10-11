<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<c:set var="id" value='${sessionScope.id}'></c:set>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript" src="/psick/js/jquery.js"></script>
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">
	var one = 1;
	
 	// session check
	function ssChk() {
		if (${empty id}) {
			var con = confirm("로그인 후 이용해 주시기 바랍니다.");
			location.href="/psick/views/member/loginForm.ys";
			return false;
		} 
	} 
	// 리뷰 삭제 confirm
	function del(rno,pno) {
		var con = confirm("상품평을 삭제하시겠습니까?");
		if (con) {
		location.href = "reviewDelete.sh?rno="+rno+"&pno="+pno;
			// location.href = "reviewDelete.sh?pno=${product.pno }&rno=${review.rno }";
		}
	}
	
	function clip(){

		var url = '';
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = "http://localhost:8080/psick/views/display/product_content.sh?pno=${pno}";
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		alert("URL이 복사되었습니다.")
	}
	
	$(function() {

		$('.slick').slick({
			slidesToShow : 6,
			slidesToScroll : 1,
			autoplay : true,
			autoplaySpeed : 2000,
		});

	});

	$(function() {
		// input range rate 조절
		$('input[type="range"]')
				.on(
						'change mousemove',
						function() {
							var val = ($(this).val() - $(this).attr('min'))
									/ ($(this).attr('max') - $(this)
											.attr('min'));
							$(this).css(
									'background-image',
									'-webkit-gradient(linear, left top, right top, '
											+ 'color-stop(' + val
											+ ', #ff5f06), ' + 'color-stop('
											+ val + ', #e4e4e4)' + ')');
							// span에 등록한 별점(range value) 넣기
							$('#input_span').text($(this).val());
						});

	});

	$(function() {
		const acoAco = $('.accordion li .product_cont_list');
		acoAco.on('dblclick', function() {
			const item = $(this);
			acoAco.parent().find('.listArticle').slideUp();
			if (item.hasClass('active')) {
				item.find('.listArticle').slideUp();
				item.removeClass('active');
			} else {
				item.parent().find('.listArticle').slideDown();
				acoAco.removeClass('active');
				item.addClass('active');
			}
		});
		
	});

	function count1(type) {
		// 결과 Element
		const resultElement = document.getElementById('pd_count');
		// 현재
		let number = resultElement.value;

		if (type === 'plus') {
			number = parseInt(number) + 1;

			frm.goodsQty.value = number;

		} else if (type === 'minus') {
			if (number <= 1) {
				alert("1개 이상 구매 가능합니다");
			} else {
				number = parseInt(number) - 1;
			}
		}
		resultElement.value = number;
		let price = number
				* parseInt("${product.p_price- product.discount/100* product.p_price }");
		$('#goods_price').text(price);
		one = number;
	}
	 function count2(pno, id) {
	      let data = "?pno="+pno + "&id="+id + "&buy_count="+frm.goodsQty.value + "&goods_price="+$("#goods_price").html();
	      location.href="/psick/views/display/buyForm.sh"+data;
	      // alert(data);
	   }
	 
	 function count3(pno, id) {
	      let data = "?pno="+pno + "&id="+id + "&buy_count="+frm.goodsQty.value + "&goods_price="+$("#goods_price").html();
	      location.href="/psick/views/member/myCart.ys"+data;
	      alert(data);
	   }
</script>


<style>
@import url("/psick/css/display/product_content.css");
</style>
</head>
<body>
	<section>


		<form name="frm">
			<!-- 상품컨텐츠 커버 -->

			<div class="product_inner">
				<!-- 윗쪽 박스 -->

				<div class="product">
					<!-- 상품컨텐츠 이미지 -->
					<div class="product_img">
						<img src="/psick/images/product-img/${product.p_detail_img }">
					</div>
					<!-- 상품컨텐츠 이미지 -->

					<!-- 상품컨텐츠 정보 -->

					<div class="product_info">
						<div class="product_tit">${product.pname }</div>
						<!-- 가격 별점 -->
						<div class="product_price">
							<div class="product_price_cover">
								<p class="product_txt_st01">

									<strong class="list_Price"> <fmt:formatNumber
											value="${product.p_price- product.discount/100* product.p_price }"
											pattern="#"></fmt:formatNumber>
									</strong> <span class="won">원</span>
									<c:if test="${product.discount !=0 }">
										<span class="oldPrice">${product.p_price }</span>
									</c:if>
								</p>
							</div>
							<!-- 상품컨텐츠 평점 -->

							<div class="star_rating">
								<c:forEach begin="1" end="${star_rate }">
									<div class="star_rating_img">
										<img src="/psick/images/icon_img/icon_star.svg" alt="평점">
									</div>

								</c:forEach>


								<div class="product_rating">

									<c:if test="${star_rate !=0  }">
										<strong class="star_rating_num"> <fmt:formatNumber
												pattern="#.#">${star_rate }</fmt:formatNumber>
										</strong>

										<a href="#" id="reviewCnt">${star_count }</a>
										<span>개 의 상품평이 있습니다 </span>
									</c:if>

									<c:if test="${star_rate == 0}">
										<span>아직 등록된 상품평이 없습니다</span>
									</c:if>

								</div>
							</div>

							<!-- 상품컨텐츠 평점 -->
						</div>
						<!-- 가격 별점 -->
						<!-- 원산지 상품종류 -->
						<div class="product_info_line">
							<dl>
								<dt>${product.p_kind }</dt>
								<dd>
									<span>${product.pname }</span>
								</dd>
							</dl>
							<dl>
								<dt>배송구분</dt>
								<dd>피식</dd>
							</dl>
							<dl>
								<dt>원산지</dt>
								<dd>${product.p_country }</dd>
							</dl>
						</div>
						<!-- 원산지 상품종류 -->
						<!-- 갯수 가격 -->
						<div class="check_num">
							<div class="product_num">
								<div onclick='count1("minus")' class="btn_minus"></div>
								<input type="text" name="goodsQty" id="pd_count" value="1"
									data-unit-qty="1">
								<div onclick='count1("plus")' class="btn_plus"></div>
							</div>
							<div class="rit_dc_price">
								<div class="check_price">
									<strong id="goods_price"><fmt:formatNumber
											value="${product.p_price- product.discount/100* product.p_price }"
											pattern="#"></fmt:formatNumber> </strong><span>&nbsp;원</span>
								</div>
							</div>
						</div>
						<div class="bott_btnBox">
							<a class="btn_like"
								href="/psick/views/display/love.sh?pno=${product.pno }"><img
								src="${img }"></a> <a href="#" class="btn_share">공유</a>
							<div class="share_sns" style="display: none;"></div>
							<!--장바구니 버튼 클릭시 아이디가 없으면  -->
							<c:if test="${empty id}">
								<a onclick="ssChk()" class="btn_cart btn-buy">장바구니</a>
							</c:if>
							<!--  장바구니 버튼 클릭시 아이디가 있으면 -->
							<c:if test="${not empty id }">
								<c:if test="${empty cart}">
									<a onclick="count3(${product.pno},'${id}')"
										class="btn_cart btn-buy"> ${nmsg}</a>
								</c:if>
								<c:if test="${not empty cart}">
									<a class="btn_cart btn-buy"> ${msg}</a>
								</c:if>
							</c:if>
							<c:if test="${empty id }">
								<div onclick="ssChk()" class="btn_buy btn-buy">바로구매</div>
							</c:if>
							<c:if test="${not empty id }">
								<div onclick="count2(${product.pno },'${id}')"
									class="btn_buy btn-buy">바로구매</div>
							</c:if>
						</div>


						<!-- 갯수 가격 -->
					</div>
					<!-- 상품컨텐츠 정보 -->
				</div>
		</form>





		<!-- 윗쪽 박스 -->
		<h3 class="sub_tit_st01">추천 상품</h3>
		<!--slick -->
		<div class="slick">
			<c:forEach var="bestlist" items="${slogan_pd }" begin="0" end="12"
				varStatus="v">
				<div class="slick_content" data-slick-index="4" aria-hidden="false"
					tabindex="0" style="width: 197px;">
					<a href="#" tabindex="0">
						<div class="thumbnail">
							<div class="thumbnailImageScale">
								<img src="/psick/images/product-img/${bestlist.p_detail_img }"
									alt="상품 이미지">
							</div>
						</div>
						<div class="title">${bestlist.pname }</div>
						<div class="star_rating_img">
							<img src="/psick/images/icon_img/icon_star.svg" alt="평점"
								style="display: inline-block; width: 15px;">
						</div> <strong class="star_rating_num"
						style="font-size: 15px; vertical-align: 0">${slogan_star[v.index] }</strong>
					</a>
				</div>
			</c:forEach>
		</div>
		<!--slick -->
		<!-- text -->
		<div class="product_text">
			<article>
				<div class="product_text_cover">
					<div class="product_text_tit">
						<h3>${product.pname }</h3>
					</div>
					<div class="product_text_img">
						<img src="/psick/images/product-img/${product.p_detail_img }">
					</div>
					<div class="product_text_ex">
						<p>${product.p_detail_content }</p>
					</div>
				</div>
			</article>
		</div>
		<!-- text -->
		<!-- 리뷰 -->
		<c:if test="${not empty id }">
			<div>
				<h4 class="cm_title">상품평 등록</h4>
				<form
					action="/psick/views/display/reviewWrite.sh?pno=${product.pno }"
					method="post">

					<div class="cm_cover">
						<div class="cm_title_write">
							<input type="text" name="title" placeholder="제목을 입력해주세요" requried>
						</div>
						<!-- <p class="detail_txt">별점</p> -->
						<div class="star_avg">
							<!-- 별점 등록 -->
							<div class="star_avg rate">
								<img src="/psick/images/icon_img/icon_star.svg" alt="별"> <input
									type="range" name="star" min="1" max="5" step="1" value="0"
									required> <span class="text" id="input_span">0</span>
							</div>
						</div>
					</div>

					<div class="cm">
						<textarea name="content" placeholder="상품평을 남겨주세요" required></textarea>
					</div>

					<div class="submit_box">
						<input type="submit" onclick="ssChk()" class="btn" value="등록">
					</div>

				</form>
			</div>
		</c:if>
		<c:if test="${empty id }">

		</c:if>
		<!-- 리뷰 -->
		<div class="product_cont">

			<div class="product_cont_cover">
				<div class="product_cont_tit_box">
					<h3 class="product_cont_tit">상품평</h3>
				</div>


				<c:if test="${star_count != 0 }">
					<div class="product_cont_caption">
						<span>총 </span>&nbsp;<span class="number">${star_count}</span>&nbsp;개의
						상품평이 작성되었습니다.
					</div>

					<!-- 상품평 아코디언 -->
					<c:forEach var="review" items="${reviewList }" varStatus="v">
						<ul class="accordion">
							<li>
								<div class="product_cont_list">
									<a class="product_number">${v.count}</a> <a
										class="product_review_star"> <img
										src="/psick/images/icon_img/icon_star.svg" alt="별"> <strong>${review.star }</strong>
									</a> <a class="product_question">${review.r_title }</a> <a
										class="product_Id">${review.id }</a> <a class="inputDate">${review.r_date }</a>
								</div>
								<p class="listArticle">${review.r_content }
									<c:if test="${review.id ==id  }">
										<a onclick="del(${review.rno},${review.pno })"
											class="btn_small">삭제</a>
									</c:if>

								</p>

							</li>
						</ul>
					</c:forEach>
				</c:if>


				<!-- 상품평 아코디언 -->
			</div>
		</div>
		</div>
		<!-- 상품컨텐츠 커버 -->


	</section>
	<textarea style="display: none"></textarea>
</body>
</html>