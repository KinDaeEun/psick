<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<style>
@import url("/psick/css/account/list.css");
</style>
<script src="/psick/views/js/jquery.js"></script>
<script type="text/javascript">
		function sessionChk() {
			if (${empty id}) {
				  var con =  confirm("로그인 후 이용해 주시기 바랍니다.");
						location.href = "/psick/views/member/loginForm.ys";
						return false;
			}
		}	
// 검색
		function listSearch() {
				let listSearchInput = document.querySelector('#listSearchInput').value;
				if (!listSearchInput) {
					alert("검색어를 입력해주세요");
				}else{
						$.post("/psick/views/account/listSearch.hu","list_search_data="+listSearchInput, function(data) {
							$('.board_list_body').html('');
							$('#dish').html(data);
					});
				}
   }
		function enter() {
		    if (window.event.keyCode == 13) {
		    	listSearch();
		    }
		}
</script>
</head>
<body>

	<div class="board_list_wrap">
		<div class="inner">
			<div class="board_list_box">
				<div class="board_list_cover">
					<div class="board_title">고객센터</div>
					<div class="search_box_flex">
						<form name="search_form" method="post" onsubmit="return false">
							<div class="search_box">
								<input type="text" name="keyword" value=""
									class="totalSearchInputbox" id="listSearchInput"
									autocomplete="off" onkeyup="enter()">
								<!-- 다시 검색 -->
								<div onclick="listSearch()" class="iconTotalSearchboxGlass"
									id="searchBtn">
									<img src="/psick/images/main_img/search.svg">
								</div>
							</div>
						</form>
					</div>
					<div class="board_list">
						<div class="board_list_head">
							<div class="num">번호</div>
							<div class="tit">제목</div>
							<div class="writer">글쓴이</div>
							<div class="date">작성일</div>
							<div class="view">조회</div>
						</div>
						<form action="writeForm.hu" method="post"
						>
							<c:if test="${empty list}">
								<div class="item">
									<div class="item_null">게시글이 없습니다</div>
								</div>
							</c:if>
							<c:if test="${not empty list}">
								<c:forEach var="account" items="${list}">
									<div class="board_list_body">
										<div class="item">
											<div class="num">${account.ano}</div>
											<div class="tit">
												<a href="accountView.hu?ano=${account.ano }">${account.a_title}</a>
											</div>
											<div class="writer">${account.a_name}</div>
											<div class="date">${account.a_date}</div>
											<div class="view">${account.a_cnt}</div>
										</div>
									</div>
									<div id="dish"></div>
								</c:forEach>
							</c:if>
							<div class="list_write_btn">
								<input type="submit" value="글쓰기" class="btn_style"
									onclick="return sessionChk()"	onsubmit="return sessionChk()">
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>


	<div align="center">
		<!-- 앞에 보여줄께 있어 -->
		<c:if test="${startPage > PAGE_PER_BLOCK }">
			<button
				onclick="location.href='/psick/views/account/list.hu?pageNum=${i}/psick/views/account/list.hu?pageNum=${startPage-1}'"
				class="button2">이전</button>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<button
				onclick="location.href='/psick/views/account/list.hu?pageNum=${i}'"
				class="button1">${i}</button>
		</c:forEach>
		<!-- 아직 보여줄께 남아있다 -->
		<c:if test="${endPage < totalPage}">
			<button
				onclick="location.href='/psick/views/account/list.hu?pageNum=${i}/psick/views/account/list.hu?pageNum=${endPage+1}'"
				class="button2">다음</button>
		</c:if>
	</div>
</body>
</html>