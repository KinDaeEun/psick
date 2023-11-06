<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<!-- 상품평과 별점을 모두 입력하였을 때 -->
<c:if test="${result > 0}">
	<script type="text/javascript">
		alert("상품평이 등록되었습니다");
		location.href="/psick/views/display/product_content.sh?pno=${pno}";
	</script>
</c:if>
<c:if test="${result < 0}">
	<script type="text/javascript">
		alert("상품평 등록에 실패하였습니다");
		history.go(-1);
	</script>
</c:if>
</body>
</html>