<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url("/psick/css/account/list.css");

.bl_width {
	width: 800px;
}
</style>
</head>
<body>

	<c:forEach var="account" items="${adList}">
		<div class="board_list bl_width">
			<div class="board_list_body">
				<div class="item" id="items">
					<div class="num">${account.ano}</div>
					<div class="tit">
						<a href="accountView.hu?ano=${account.ano }">${account.a_title}</a>
					</div>
					<div class="writer">${account.a_name}</div>
					<div class="date">${account.a_date}</div>
					<div class="view">${account.a_cnt}</div>
				</div>
			</div>
		</div>
</c:forEach>
</body>
</html>