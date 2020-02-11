<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <c:set var="context" value="${pageContext.request.contextPath}"></c:set>
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<c:choose>
	<c:when test="${sessionScope.id == null }">
		<a href="${context}/member/login">로그인</a>
	</c:when>
	<c:otherwise>
	${sessionScope.id}님이 로그인 중입니다.
	<a href = "${context}/member/logout">로그아웃</a>
	</c:otherwise>
</c:choose>
<h2>게시글 상세 보기</h2>
<script>
	$(".reply_submit").submit(function(e){
    e.preventDefault();

    var url = $(this).attr("action");
    var method = $(this).attr("method");

    var data = $(this).serialize();

    $.ajax({
        url:url,
        type:method,
        data:data,
        success:function(resp){
        }
    });
    window.location.reload();
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
	<td>작성자 : ${qnaVO.qna_writer} </td>
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
	<c:if test="${sessionScope.id == qnaVO.qna_writer}">
		<input type="hidden" name="qna_no" value="${qnaVO.qna_no}">
			<a href="${context}/board/qna/update?qna_no=${qnaVO.qna_no}">
				<button type="button" id="btnupdate">수정</button>
			</a><br><br>
		<a href="${context}/board/qna/delete?qna_no=${qnaVO.qna_no}">
			<button type="button" id="btndelete">삭제</button>
		</a><br><br>
	</c:if>
	</table>
	<a href="${context}/board/qna/list">
			<button type="button" >문의게시판 목록</button>
	</a><br><br>
</div>
</form>

<!-- 댓글 -->
<table border="1" width="100%">
 	<c:forEach items="${replyList}" var="replyList">
		<tr>
 	   			<th>작성자 : ${replyList.reply_writer}</th>
				<th>작성 날짜 :  ${replyList.wdate}</th>
				<th>${replyList.content}</th>
			</tr>
	</c:forEach>
	</table>
	
<form action="replywrite"  method="post" class="reply_submit">
	<input type="hidden" id="origin" name="origin" value="${qnaVO.qna_no}"><br>
	<input type="text" id="reply_writer" name="reply_writer" value="${sessionScope.id}" readonly><br>
	<textarea name="content" required placeholder="내용 입력"></textarea>
	<input type="submit" value="등록">
</form>
