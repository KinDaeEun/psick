<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기획전</title>
<style>
@import
url("/psick/css/display/event.css")
</style>
</head>
<body>
	<!-- 서브타이틀 -->
	<div class="contentFrame">
		<div class="event-inner">
			<div class="contents">

				<div class="sub_cont">
					<h2 class="sub_tit">기획전</h2>
					<div class="event_sec">
						<div class="tab_ui_list tab_menu_list"></div>
					</div>
				</div>

				<!-- 컨텐츠 -->
				<div class="tab_container">
					<form name="exhibitForm" class="event_form">
					<c:forEach var="event" items="${list }">
						<div class="event" id="list">	
								<a href="/psick/views/display/eventlist.sh?eno=${event.eno }">
									<div class="thum_e_img">
										<img src="/psick/images/event_img/${event.e_img }" alt="">
									</div>

									<div class="event_txt">
										<p class="e_tit">${event.ename }</p>
										<strong class="ev_ing">진행중</strong>
									</div>
								</a>	
						</div>
					</c:forEach>
					</form>

				</div>
			</div>
		</div>
	</div>

</body>
</html>