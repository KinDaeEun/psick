<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:set var="id" value='${sessionScope.id}'></c:set>
<head>
<meta charset="UTF-8">
<title>피식</title>
<script type="text/javascript">
function ssChk(name) {
	   if (${empty id}) {
	      var con = alert("로그인 후 이용해 주시기 바랍니다.");
	      if (con) {
	         if (name == 'main') {
	            location.href = "/psick/views/member/mypageForm.ys";
	         } else if (name == 'cart') {
	            location.href = "/psick/views/member/myCartList.ys";
	         }
	      } 
	      location.href="/psick/views/member/loginForm.ys";
	   } else {
	      if (name == 'main') {
	         location.href = "/psick/views/member/mypageForm.ys";
	      } else if (name == 'cart') {
	         location.href = "/psick/views/member/myCartList.ys";
	      } 
	   }
	}

function headerSearch() {
	let headerSearchInput = document.querySelector('#headerSearchInput').value;
	if (!headerSearchInput) {
		alert("검색 결과가 없습니다");
	} else
	location.href="/psick/views/display/search.sh?search_data="+headerSearchInput;
}
</script>
</head>
<body>
	<header>
		<div class="inner">
			<div class="header_cover">
				<div class="login_nav">
					<c:if test="${empty id }">
						<li class="user_nav"><a
							href="/psick/views/member/joinForm.ys">회원가입</a></li>
						<li class="user_nav"><a
							href="/psick/views/member/loginForm.ys">로그인</a></li>
						<li class="user_nav"><a href="#"
							onclick="return ssChk('main')">마이페이지</a></li>
					</c:if>
					<c:if test="${not empty id }">
						<c:if test="${id != 'admin'}">
							<li class="user_nav"><a class="user_nav"></a></li>
							<li class="user_nav"><a href="/psick/views/member/logout.ys">로그아웃</a></li>
							<li class="user_nav"><a
								href="/psick/views/member/mypageForm.ys">마이페이지</a></li>
						</c:if>
						<c:if test="${id == 'admin'}">
							<li class="user_nav"><a href="/psick/views/member/logout.ys">로그아웃</a></li>
							<li class="user_nav"><a
								href="/psick/views/admin/adminMain.en">관리자페이지</a></li>
						</c:if>
					</c:if>
					
				</div>
				<div class="logo_nav">
					<div class="logo_nav_box"></div>
					<div class="logo">
						<a href="/psick/views/display/main.en"><img
							src="/psick/images/main_img/pick_logo.png" class="topLogoImg"></a>
					</div>
					<div class="searchMain">
						<input type="text" id="headerSearchInput"
							style="ime-mode: active;">
						<div onclick="headerSearch()" class="SearchboxGlass"
							id="headerSearchIcon">
							<img src="/psick/images/main_img/search.svg">
						</div>
					</div>
				</div>

				<nav class="menu_nav">
					<ul class="menu_nav_cover">
						<li class="all_cm_cover"><input type="checkbox" id="all_cm">
							<label for="all_cm"><em></em>전체 카테고리</label>
							<ul class="all_cm_list">
								<li><a href="/psick/views/display/categories.en?kind=쌀·잡곡">쌀·잡곡</a></li>
								<li><a href="/psick/views/display/categories.en?kind=채소">채소</a></li>
								<li><a
									href="/psick/views/display/categories.en?kind=과일·견과·건과">과일·견과·건과</a></li>
								<li><a href="/psick/views/display/categories.en?kind=수산">수산</a></li>
								<li><a
									href="/psick/views/display/categories.en?kind=정육·계란류">정육·계란류</a></li>
								<li><a
									href="/psick/views/display/categories.en?kind=차·음료·생수·유제품">차·음료·생수·유제품</a></li>
								<li><a href="/psick/views/display/categories.en?kind=과자·간식">과자·간식</a></li>
								<li><a
									href="/psick/views/display/categories.en?kind=장류·양념·가루">장류·양념·가루</a></li>

							</ul></li>
						<li class="menu_nav_m"><a href="/psick/views/display/best.sh">추천상품</a>
							<a href="/psick/views/display/discount.en">OnSale</a> <a
							href="/psick/views/display/fresh.sh">신상품</a> <a href="/psick/views/display/brand.jsp">Brand</a>
							<a href="/psick/views/display/event.sh">기획전</a> <a
							href="/psick/views/account/list.hu">고객센터</a></li>
						<li class="menu_nav_c"><a href="#"
							onclick="return ssChk('main')"> <img
								src="/psick/images/main_img/iconTopMyPage.svg">
						</a> <a href="#" onclick="return ssChk('cart')"> <img
								src="/psick/images/main_img/iconTopCart.svg">
						</a></li>
					</ul>
				</nav>

			</div>

		</div>
	</header>
</body>
</html>