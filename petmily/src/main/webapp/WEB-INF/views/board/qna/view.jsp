<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- BootStrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 에디터와 동일한 의존성 라이브러리 설정을 한다 -->
    <!-- naver toast ui editor를 쓰기 위해 필요한 준비물 -->
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/css/codemirror.min.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/css/github.min.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/css/tui-color-picker.min.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/dist/tui-editor.min.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/dist/tui-editor-contents.min.css">

    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="${context}/resources/lib/toast/dist/tui-editor-Editor-full.min.js"></script>
    
<!-- 네이버 에디터 영역 -->
   <script>        
        $(function(){
            var options = {
                //el(element) : 에디터가 될 영역
                el:document.querySelector(".naver-viewer"),
                
                viewer:true,

                //height : 생성될 에디터의 높이
                height:'auto',
            };

            var viewer = tui.Editor.factory(options);

            //생성된 뷰어에 초기값 표시
            console.log(document.querySelector(".naver-viewer + input[type=hidden]"));
            var text = document.querySelector(".naver-viewer + input[type=hidden]").value;
            viewer.setValue(text);//값 설정
        });
    </script>
    

<!-- 댓글 작성 영역 -->
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

<style>
.notice_table {
	width: 80%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	border-color: #BDBDBD;
	margin-left: auto;
	margin-right: auto;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: left;
	border-color: #BDBDBD;
}

.td2 {
	text-align: right;
	border-bottom: 1px solid #444444;
	padding: 10px;
	border-color: #BDBDBD;
}

a {
	text-decoration: none;
	color: black;
	margin-left: auto;
	margin-right: auto;
}

div {
	padding: 30px;
}

hr {
	width: 80%;
}

.btn {
	display: white;
	width: 120px;
	height: 10x;
	line-height: 20px;
	border: 1px #3399dd solid;
	background-color: white;
	text-align: center;
	font-size : 12px;
	cursor: pointer;
	color: #1482e0;
	transition: all 0.9s, color 0.3;
}

.btn:hover {
	color: white;
}

.hover3:hover {
	background-color: #1482e0;
}
</style>

<c:choose>
	<c:when test="${sessionScope.id eq null }">
		<a href="${context}/member/login">로그인</a>
	</c:when>
	<c:otherwise>
	${sessionScope.id}님이 로그인 중입니다.
	<a href="${context}/member/logout">로그아웃</a>
	</c:otherwise>
</c:choose>


	<h2 align="center">게시글 상세 보기</h2>
		<table class="notice_table">
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
		<c:forEach var="qnaImage" items="${qnaImageList}">
			<c:if test="${qnafileDto.qna_file_no ne 0}">
				<tr>
					<td><img src="${context}/board/qna/view/file_view?qna_file_no=${qnaImage.qna_file_no}" width="200" height="100">
					</td>
				</tr>
			</c:if>
		</c:forEach>
				<tr>
				<td>
					<div class="naver-viewer"></div>  
					<input type="hidden" name="faq_content" value="${qnaVO.qna_content}">  
				</td>
			</tr>



<!-- 댓글화면 -->
<%-- <c:if test="${member_image_no>0"> --%>
<%-- 	<img src="${pageContext.request.contextPath }/member/member/image?member_image_no=${member_image_no}" style="max-width: 40%; height: auto;" onerror="no_image2()" id="member_image"> --%>
<%-- </c:if> --%>
<%-- <c:otherwise> --%>
<!-- 	<img src="http://placehold.it/100x100"> -->
<%-- </c:otherwise> --%>
<c:forEach items="${replyList}" var="reply">
<c:if test="${reply.content ne null}">
<tr>
	<td>
	<div class="grandmother">
		<table width="100%" class="mother">
			<tr>
				<th align="left"> 
				<img src = "${context}/board/qna/member/image?member_image_member_id=${reply.reply_writer}" style="max-width: 15%; height: auto;"  onerror="no_image2()" id="2">${reply.reply_writer}
				<c:if test="${qnaVO.qna_writer == reply.reply_writer}">
					<font color="red">(작성자)</font>
				</c:if></th>

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
						<textarea name="content" required class="val">${reply.content}</textarea>
					</form>
				</th>

			<!-- 댓글 수정 -->
			<c:if
				test="${sessionScope.id eq reply.reply_writer || grade eq 'admin'}">
				<tr>
					<th colspan="2" align="right">
						<button class="reply_view_btn">수정</button>
						<button class="reply_edit_btn">완료</button> 
						<a href="replyDelete?reply_no=${reply.reply_no}&origin=${qnaVO.qna_no}">
							<button class="replyDelete_submit">삭제</button>
						</a>						
						</th>
					</tr>
				</c:if>
			</tr>
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
		<input type="hidden" id="origin" name="origin" value="${qnaVO.qna_no}"><br> 
		<input type="text" id="reply_writer" name="reply_writer" value="${sessionScope.id}" readonly>
				<textarea name="content" required placeholder="내용 입력" rows="4" cols="100" ></textarea>
				<br><br>
				 <input type="submit" value="등록" class="btn hover3">
		</form>
		</td>
	</tr>

<tr>
	<td class="td2">

	<c:if test="${sessionScope.id eq qnaVO.qna_writer || grade eq 'admin'}">
		<input type="hidden" name="qna_no" value="${qnaVO.qna_no}">
		<a href="${context}/board/qna/update?qna_no=${qnaVO.qna_no}">
		<button type="button" id="btnupdate" class="btn hover3">게시글 수정</button></a>
		<a href="${context}/board/qna/delete?qna_no=${qnaVO.qna_no}">
		<button type="button" id="btndelete" class="btn hover3">게시글 삭제</button></a>
	</c:if>
	
	<a href="${context}/board/qna/list">
	<button type="button" class="btn hover3">문의게시판 목록</button></a>
	<a href ="${context}/board/qna/write?superno=${qnaVO.qna_no}">
	<button type="button" class="btn hover3">답글쓰기</button></a>
		</td>
	</tr>
</table>

	