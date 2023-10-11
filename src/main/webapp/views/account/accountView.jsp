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
</style>
<script type="text/javascript" src="/psick/js/jquery.js"></script>
<script type="text/javascript">
function delone(ano) {
	let ch = confirm("정말로 삭제하시겠습니까 ?");
	if (ch)
		location.href = "delete.hu?&ano="+ano;
	else
		alert("삭제가 취소 되었습니다.");
}


	function del(ano,re_no) {
		let ch = confirm("정말로 삭제하시겠습니까 ?");
		if (ch)
			location.href = "replyDelete.hu?&ano="+ano+"&re_no="+re_no;
		else
			alert("삭제가 취소 되었습니다.");
	}
	$(function() {

		$(".reply_Btn").click(
				function() {
					var re_reply = $(this).parents(".replyTable").find(
							".replyBtn_box");
					if (re_reply.css("display") == "none") {
						$(".replyBtn_box").css("display", "none");
						re_reply.css("display", "block");
					} else {
						$(".replyBtn_box").css("display", "none");
					}
				});
		$(".re_btn").click(
				function() {
					var re_reply = $(this).parents(".replyTable").find(
							".content");
					if (re_reply.css("display") == "none") {
						$(".content").css("display", "none");
						re_reply.css("display", "block");
					} else {
						$(".content").css("display", "none");
					}
				});
		$(".replyModBtn").click(
				function() {
					var re_reply = $(this).parents(".replyTable").find(
							".replyModBtn_box");
					if (re_reply.css("display") == "none") {
						$(".replyModBtn_box").css("display", "none");
						re_reply.css("display", "block");
					} else {
						$(".replyModBtn_box").css("display", "none");
					}
				});
	});
	function sessionChk() {
		if (${empty id}) {
			    confirm("로그인 후 이용해 주시기 바랍니다.");
					location.href = "/psick/views/member/loginForm.ys";
					return false;
		}
}
</script>
</head>
<body>
	<section>
		<div class="a_view_inner">
			<div class="a_view">
				<div class="a_view_tit">고객의 소리</div>
				<div class="a_view_info">
					<div class="a_title">${account.a_title}</div>
					<div class="a_date">${account.a_date}</div>
				</div>
				<div class="a_view_info">
					<div class="a_name">${account.a_name}</div>
					<div class="a_cnt">${account.a_cnt}</div>
				</div>
				<div class="a_view_content">
					<div class="a_content">${account.a_content}</div>
				</div>
				<div class="a_viewbutton">
					<c:if test="${account.id == id}">
						<a href="updateForm.hu?ano=${account.ano}" class="btn_style vb">수정</a>
						<a onclick="delone(${account.ano})" class="btn_style vb">삭제</a>
						<a href="list.hu?ano=${account.ano}" class="btn_style">목록</a>
					</c:if>
					<c:if test="${account.id != id}">
						<a href="list.hu?ano=${account.ano}" class="btn_style">목록</a>
					</c:if>
				</div>
			</div>
		</div>
	</section>


	<!-- 	댓글 시작 -->
	<div class="replySection">
		<div class="replySection_cover">
			<div class="replySection_box">
				<div class="replyForm ">
					<div class="totalReply">
						관련 댓글 총 <span class="number">${list.size()}</span>건
					</div>
					<form
						action="replyWriteResult.hu?ano=${account.ano}&re_no=0&ref=0&ref_level=0&ref_step=0"
						method="post" class="reply_insert_frm"
						onsubmit="return sessionChk()">
						<div class="inputWrapper flex">
							<textarea class="replyInput ref_content flex" name="ref_content"></textarea>
							<!-- <input type="text" class="replyInput insContet" name="insContet" value=""> -->
							<input type="submit" class="btnGray60 btnRegist replyBtn"
								value="등록하기">
						</div>
					</form>
				</div>
			</div>
			<c:forEach var="reply" items="${list}">
				<c:if test="${reply.ref_level != 0 }">
					<!-- 답글일 때 -->
					<table class="replyTable" id="replyField">
						<colgroup>
							<col style="width: 30px">
							<col style="width: 150px">
							<col style="width: auto">
							<col style="width: 200px">
							<col style="width: 120px">
						</colgroup>

						<tr class="re_reply_list_inner">
							<td class="re">ㄴ</td>
							</c:if>
							<c:if test="${reply.ref_level == 0 }">
								<!-- 답글이 아닐 때(그냥 댓글) -->
								<table class="replyTable" id="replyField">
									<colgroup>
										<col style="width: 150px">
										<col style="width: auto">
										<col style="width: 200px">
										<col style="width: 120px">
									</colgroup>
									<tr class="reply_list_inner">
										</c:if>
										<td>${reply.id}</td>
										<td>${reply.ref_content}</td>
										<td class="date">${reply.ref_date}</td>
										<td class="reply_btn"><c:if test="${reply.id == id}">
												<button class="reply_Btn btnGray40 btnReply subReplyBtn">답변</button>
												<div class="label_content">
													<div class="re_btn">
														<img src="/psick/images/icon_img/61140.png">
														<div class="content">
															<span class="replyModBtn" data-toggle="modal"
																data-target="#modModal"> 수정 </span><span
																onclick="del(${account.ano},${reply.re_no})"
																class="ref_del">삭제</span>
														</div>
													</div>

												</div>
											</c:if> <c:if test="${reply.id != id}">
												<button class="reply_Btn btnGray40 btnReply subReplyBtn">답변</button>
											</c:if></td>

									</tr>
									<c:if test="${reply.id == id}">

										<tr class="replyModBtn_box">
											<form
												action="replyUpdate.hu?ano=${reply.ano}&re_no=${reply.re_no}"
												method="post" class="reply_update_frm">
												<td></td>
												<td colspan="2" class="textarea_size"><textarea
														class="ref_content" name="ref_content"></textarea></td>
												<td><input type="submit"
													class="btnGray40 widthFull replyBtn"
													data-top-reply-id="162414" value="완료"></td>
											</form>

										</tr>
										<form
											action="replyWriteResult.hu?ano=${reply.ano}&re_no=${reply.re_no}&ref=${reply.ref}
											&ref_level=${reply.ref_level}&ref_step=${reply.ref_step}"
											method="post" class="re_reply_insert_frm"
											onsubmit="return sessionChk()">
											<tr class="replyBtn_box">
												<td></td>
												<td colspan="2" class="textarea_size"><textarea
														class="ref_content" name="ref_content"></textarea></td>
												<td><input type="submit"
													class="btnGray40 widthFull replyBtn" value="확인"></td>
											</tr>
										</form>
									</c:if>

									<!-- 									답글 입력 폼 -->
									<c:if test="${reply.id != id}">
										<form
											action="replyWriteResult.hu?ano=${reply.ano}&re_no=${reply.re_no}&ref=${reply.ref}
											&ref_level=${reply.ref_level}&ref_step=${reply.ref_step}"
											method="post" class="re_reply_insert_frm"
											onsubmit="return sessionChk()">
											<tr class="replyBtn_box">
												<td></td>
												<td colspan="2" class="textarea_size"><textarea
														class="ref_content" name="ref_content"></textarea></td>
												<td><input type="submit"
													class="btnGray40 widthFull replyBtn" value="확인"></td>
											</tr>
										</form>
									</c:if>
									<!-- 									reply_list_inner 끝 -->
									</c:forEach>
								</table>

								<div align="center" class="page_btn">
									<!-- 앞에 보여줄께 있어 -->
									<c:if test="${startPage > PAGE_PER_BLOCK }">
										<button
											onclick="location.href='/psick/views/account/accountView.hu?pageNum=${startPage-1}&ano=${account.ano }'"
											class="button2">이전</button>
									</c:if>
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<button
											onclick="location.href='/psick/views/account/accountView.hu?pageNum=${i}&ano=${account.ano }'"
											class="button1">${i}</button>
									</c:forEach>
									<!-- 아직 보여줄께 남아있다 -->
									<c:if test="${endPage < totalPage}">
										<button
											onclick="location.href='/psick/views/account/accountView.hu?pageNum=${endPage+1}&ano=${account.ano }'"
											class="button2">다음</button>
									</c:if>
								</div>
								</div>
								</div>
</body>
</html>
