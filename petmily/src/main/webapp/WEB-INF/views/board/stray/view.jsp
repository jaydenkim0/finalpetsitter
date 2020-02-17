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

<div align="center">
	<h2>Save the Pets !</h2>
		<table border="1" width="80%">
			<!--strayVO 안에 있는 정보 불러오기 -->
			<tr>
				<td>글번호 : ${strayVO.stray_no}</td>
			</tr>

			<tr>
				<td>게시일자 : ${strayVO.writedateWithFormat}</td>
			</tr>

			<tr>
				<td>작성자 : ${strayVO.stray_writer}</td>
			</tr>

			<tr>
				<td>말머리 : ${strayVO.stray_title}</td>
			</tr>

			<tr>
				<td>제목 : ${strayVO.stray_head}</td>
			</tr>
			
			<tr>
		<c:forEach var="strayImage" items="${strayImageList}">
			<c:if test="${strayfileDto.stray_file_no ne 0}">
				<tr>
					<td><img src="${context}/board/stray/view/file_view?stray_file_no=${strayImage.stray_file_no}" width="200" height="100">
					</td>
				</tr>
			</c:if>
		</c:forEach>
				<td>${strayVO.stray_content}</td>
			</tr>



<!-- 댓글화면 -->
<c:forEach items="${replyList}" var="reply">
<c:if test="${reply.content ne null}">
<tr>
	<td>
	<div class="grandmother">
		<table width="100%" class="mother">
			<tr>
		<c:when test="${not empty reply.reply_writer}">
			<th align="left">
				${reply.reply_writer}
				<c:otherwise>
				비회원
				</c:otherwise>
				<c:if test="${strayVO.stray_writer == reply.reply_writer}">
					<font color="red">(작성자)</font>
				</c:if>
			</th>
				</c:when>
				
				<th align="left">
				작성일 : ${reply.writedateWithFormat}</th>
			</tr>
			
			<tr class="reply_view">
				<th class="content" colspan="2" align="left">${reply.content}</th>
			</tr>
			
			<tr class="reply_edit">
				<td align="right">
				<th colspan="2" align="left">
					<form action="replyUpdate" method="post"
						class="reply_change_submit">
						<input type="hidden" name="reply_no" value="${reply.reply_no}">
						<input type="hidden" name="origin" value="${reply.origin}">
						<textarea name="content" requistray class="val">${reply.content}</textarea>
					</form>
				</th>

			<!-- 댓글 수정 -->
			<c:if
				test="${sessionScope.id eq reply.reply_writer || grade eq 'admin'}">
				<tr>
					<th colspan="2" align="right">
						<button class="reply_view_btn">수정</button>
						<button class="reply_edit_btn">완료</button> 
						<a href="replyDelete?reply_no=${reply.reply_no}&origin=${strayVO.stray_no}">
							<button class="replyDelete_submit">삭제</button>
						</a>
						</th>
					</tr>
				</c:if>
			</tr>
		</td>
		</table>
	</div>
	</td>
</tr>
</c:if>
</c:forEach>


<!-- 댓글 등록 -->
<tr>
<td align="right">
<form action="replywrite" method="post" class="reply_submit">
		<input type="hidden" id="origin" name="origin" value="${strayVO.stray_no}"><br> 
		<input type="text" id="reply_writer" name="reply_writer" value="${sessionScope.id}" readonly>
				<textarea name="content" requistray placeholder="내용 입력" rows="4" cols="100" ></textarea>
				 <input type="submit" value="등록">
		</form>
		</td>
	</tr>

<tr>
	<td align="right">

	<c:if test="${sessionScope.id eq strayVO.stray_writer || grade eq 'admin'}">
		<input type="hidden" name="stray_no" value="${strayVO.stray_no}">
		<a href="${context}/board/stray/update?stray_no=${strayVO.stray_no}">
		<button type="button" id="btnupdate">게시글 수정</button></a>
		<a href="${context}/board/stray/delete?stray_no=${strayVO.stray_no}">
		<button type="button" id="btndelete">게시글 삭제</button></a>
	</c:if>
	
	<a href="${context}/board/stray/list">
	<button type="button">문의게시판 목록</button></a>
	</td>
	</tr>
	</table>
</div>
	