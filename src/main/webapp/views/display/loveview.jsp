<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url("/psick/css/display/loveview.css");
</style>
<script src="/psick/js/jquery.js"></script>
<script type="text/javascript">

	
function checkSelectAll()  {
	  // 전체 체크박스
	  const checkboxes 
	    = document.querySelectorAll('input[name="goodsCd"]');
	  // 선택된 체크박스
	  const checked 
	    = document.querySelectorAll('input[name="goodsCd"]:checked');
	  // select all 체크박스
	  const selectAll 
	    = document.querySelector('input[name="selectall"]');
	  
	  if(checkboxes.length === checked.length)  {
	    selectAll.checked = true;
	  }else {
	    selectAll.checked = false;
	  }

	}

	function selectAll(selectAll)  {
	  const checkboxes 
	     = document.getElementsByName('goodsCd');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}

// 	function folderDeleteClick(){
// 		  var checkBoxArr = []; 
// 		  $("input:checkbox[name='goodsCd']:checked").each(function() {
// 		  checkBoxArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
// 		  console.log(checkBoxArr);
// 		})
	
</script>
</head>
<body>
	<section class="loveview_main">
		<div class="loveview_wrap">
			<div class="title">찜상품</div>
			<div class="caption flexMiddleEdge">
				<div class="flexMiddle">
					<span>찜상품</span>&nbsp;<span class="number" id="totalCount">${list.size()}</span>개
				</div>
				<div class="selectAllWrapper flexBottom">
					<div class="selectAll">
						<label class="check_st01"> <input type="checkbox"
							id="allCheck" name="selectall" onclick='selectAll(this)'
							value="selectall">전체선택 <span class="checkmark"></span></label>
						&nbsp;&nbsp;&nbsp;
						<button type="button" class="btnGray29" id="removeAlarm" onclick="location.href='loveviewDelAll.hu'">선택삭제</button>
					</div>
				</div>
			</div>
			<div class="listWrapper" id="listMst">
				<c:forEach var="product" items="${list}">
					<form name="major" action="/psick/views/member/myCart.ys">
						<input type="hidden" name="pno" value="${product.pno }">
						<div class="list flexMiddle">
							<div class="bott_check_rit selector">
								<label class="check_st01"> <input type="checkbox"
									name="goodsCd" class="goodsCd" value="WG026654"
									data-ordertypedivd="1" onclick="checkSelectAll()"> <span
									class="checkmark"></span></label>
							</div>
							<img
								onclick="javascript:location.href='/psick/views/display/product_content.sh?pno=${product.pno}';"
								src="/psick/images/product-img/${product.p_detail_img }"
								class="goodsImage">
							<div class="text">
								<div
									onclick="javascript:location.href='/psick/views/display/product_content.sh?pno=${product.pno}';">${product.pname}</div>
								<div
									onclick="javascript:location.href='/psick/views/display/product_content.sh?pno=${product.pno}';">${product.p_price}</div>
							</div>
							<div class="btn_my_cart btnPutToCart">
								<input type="submit" class="btn_cart btn-buy" value="장바구니">
							</div>
							<div class="btnDiv">
								<span onclick="location.href='loveviewDel.hu?pno=${product.pno}">
									<img
									onclick="javascript:location.href='loveviewDel.hu?pno=${product.pno}';"
									src="/psick/images/icon_img/icon_delete02.svg" alt="삭제">
								</span>
							</div>
						</div>
					</form>
				</c:forEach>
			</div>
		</div>
	</section>
</body>
</html>