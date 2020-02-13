<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<c:choose>
	<c:when test="${sessionScope.id eq null }">
		<a href="${context}/member/login">로그인</a>
	</c:when>
	<c:otherwise>
	${sessionScope.id}님이 로그인 중입니다.
	<a href="${context}/member/logout">로그아웃</a>
	</c:otherwise>
</c:choose>
<h2>게시글 상세 보기</h2>
<script>
	// 댓글 작성
	$(function() {
		$(".reply_submit").submit(function(e) {
			e.preventDefault();

			var url = $(this).attr("action");
			var method = $(this).attr("method");

			var data = $(this).serialize();

			$.ajax({
				url : url,
				type : method,
				data : data,
				success : function(resp) {
				}
			});
			window.location.reload();
		});
		//댓글 삭제
		$(".replyDelete_btn").click(
				function(e) {
					e.preventDefault();

					var url = $(this).parentsUntil(".mother").find(
							".replyDelete_submit").attr("action");
					var method = $(this).parentsUntil("mother").find(
							".replyDelete_submit").attr("method");
					var data = $(this).parentsUntil(".mother").find(
							".replyDelete_submit").serialize();

					$.ajax({
						url : url,
						type : method,
						data : data
					});

					$(this).parentsUntil(".grandmother").hide();
				});

		// 댓글 수정
		$(".reply_edit").hide();
		$(".reply_edit_btn").hide();

		$(".reply_view_btn").click(function() {
			$(this).hide();
			$(this).parentsUntil(".mother").find(".reply_view").hide();
			$(this).next(".reply_edit_btn").show();
			$(this).parentsUntil(".mother").find(".reply_edit").show();
		});

		var textoriginal = $(this).parentsUntil(".mother").find(".content")
				.val();
		$(this).parentsUntil(".mother").find("textarea").text(textoriginal);

		$(".reply_edit_btn")
				.click(
						function(e) {
							var text = $(this).parentsUntil(".mother").find(
									"textarea").val();

							e.preventDefault();

							var url = $(this).parentsUntil(".mother").find(
									".reply_change_submit").attr("action");
							var method = $(this).parentsUntil(".mother").find(
									".reply_change_submit").attr("method");
							var data = $(this).parentsUntil(".mother").find(
									".reply_change_submit").serialize();
							console.log(url, method, data);

							$.ajax({
								url : url,
								type : method,
								data : data
							});

							$(this).hide();
							$(this).parentsUntil(".mother").find(".reply_edit")
									.hide();
							$(this).parentsUntil(".mother").find(".reply_view")
									.show();
							$(this).parentsUntil(".mother").find(
									".reply_view_btn").show();
							$(this).parentsUntil(".mother").find(".content")
									.text('');
							$(this).parentsUntil(".mother").find(".content")
									.text(text);
						});
	});
</script>
<form name="form1" method="post">
	<div align="center">
		<table border="1" width="70%">
			<!--qnaVO 안에 있는 정보 불러오기 -->
			<tr>
				<td>글번호 : ${qnaVO.qna_no}</td>
			</tr>

			<tr>
				<td>게시일자 : ${qnaVO.writedateWithFormat}</td>
			</tr>

			<tr>
				<td>작성자 : ${qnaVO.qna_writer}</td>
			</tr>

			<tr>
				<td>말머리 : ${qnaVO.qna_title}</td>
			</tr>

			<tr>
				<td>제목 : ${qnaVO.qna_head}</td>
			</tr>
			<tr>
				<td>${qnaVO.qna_content}</td>
			</tr>
		</table><br>


		<c:forEach var="qnaImage" items="${qnaImageList}">
			<c:if test="${faqfileDto.faq_file_no ne 0}">
				<tr>
					<td><img
						src="${context}/board/qna/view/file_view?qna_file_no=${qnaImage.qna_file_no}"></td>
				</tr>
			</c:if>
		</c:forEach>
	</div>
</form>

<a href="${context}/board/qna/list">
	<button type="button">문의게시판 목록</button>
</a>

<!-- 댓글 등록 -->
<form action="replywrite" method="post" class="reply_submit">
	<br><table border="1" width="100%">
		<tr>
			<td align="right"><input type="hidden" id="origin" name="origin"
				value="${qnaVO.qna_no}"><br> <input type="text"
				id="reply_writer" name="reply_writer" value="${sessionScope.id}"
				readonly><br> <textarea name="content" required
					placeholder="내용 입력"></textarea><br> <input type="submit"
				value="등록"></td>
		</tr>
	</table>
</form>

<!-- 댓글화면 -->
<c:forEach items="${replyList}" var="reply">
	<div class="grandmother">
		<table width="50%" class="mother">
			<tr>
				<th align="left">작성자 : ${reply.reply_writer}</th>
				<th align="left">${reply.writedateWithFormat}</th>
			</tr>
			<tr class="reply_view">
				<th class="content" colspan="2" align="left">${reply.content}</th>
			</tr>
			<tr class="reply_edit">
				<th colspan="2" align="left">
					<form action="replyUpdate" method="post"
						class="reply_change_submit">
						<input type="hidden" name="reply_no" value="${reply.reply_no}">
						<input type="hidden" name="origin" value="${reply.origin}">
						<textarea name="content" required class="val">${reply.content}</textarea>
					</form>
				</th>
			</tr>
			<!-- 댓글 수정 -->
			<c:if
				test="${sessionScope.id eq reply.reply_writer || grade eq 'admin'}">
				<tr>
					<th colspan="2" align="right">
						<button class="reply_view_btn">수정</button>
						<button class="reply_edit_btn">완료</button> <a
						href="replyDelete?reply_no=${reply.reply_no}&origin=${qnaVO.qna_no}">
							<button class="replyDelete_submit">삭제</button>
					</a>
					</th>
				</tr>
			</c:if>
		</table>
	</div>
</c:forEach>
