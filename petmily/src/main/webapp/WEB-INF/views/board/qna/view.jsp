<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <c:set var="context" value="${pageContext.request.contextPath}"></c:set>
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<h2>게시글 상세 보기</h2>
<script>
$(document).ready(function(){
	$("#btndelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action = "${context}/board/qna/delete";
			document.form1.submit();
		}
	});
	$("#btnupdate").click(function(){
		var qna_title = $("qna_title").val();
		var qna_head = $("qna_head").val();
		var qna_content = $("qna_content").val();
		if(qna_title=""){
			alert("말머리를 선택하세요")
			document.form1.qma_title.focus();
			return;
		}
		if(qna_head=""){
			alert("제목을 입력하세요")
			document.form1.qna_head.focus();
			return;
		}
		if(qna_content=""){
			alert("내용을 입력하세요")
			document.form1.qna_content.focus();
			return;
		}
		document.form1.action="${context}/board/qna/update"
		document.form1.submit();
	});
});
</script>
<form name="form1" method="post">
	<table border="1">
		<th>정보</th>
		<th>데이터</th>
	
	<!--qnaVO 안에 있는 정보 불러오기 -->
<tr>
	<td>글번호</td>
	<td>${qnaVO.qna_no}</td>
</tr>

<tr>
	<td>게시일자</td>
	<td>${qnaVO.writedateWithFormat}</td>
</tr>

<tr>
	<td>말머리</td>
	<td>${qnaVO.qna_title}</td>
</tr>

<tr>
	<td>제목</td>
	<td>${qnaVO.qna_head}</td>
</tr>
<tr>
	<td>내용</td>
	<td>${qnaVO.qna_content}</td>
</tr>
<div style="width:650px"; text-align : center";>
	<a href="${context}/board/qna/list">
		<button type="button" >문의게시판 목록</button>
	</a><br><br>
	</table><br>
	<input type="hidden" name="qna_no" value="${qnaVO.qna_no}">
<%-- <c:if test="$[sessionScope.qna_writer == qnaVO.qna_writer]"> --%>
<a href="${context}/board/qna/update?qna_no=${qnaVO.qna_no}">
	<button type="button" id="btnupdate">수정</button>
</a><br><br>
<a href="${context}/board/qna/delete?qna_no=${qnaVO.qna_no}">
	<button type="button" id="btndelete">삭제</button>
</a><br><br>
<%-- </c:if> --%>
</form>

<!-- 댓글 -->
<div id="qna_reply">
	<ol class="replyList">
	<c:forEach items="${qnaReplyVO.reply_writer}" var="replyList">
	<li>
		<p>
		작성자 : ${qnaReplyVO.reply_writer}<br/>
		작성 날짜 : ${qnaReplyVO.writedate}
		</p>
		<p>${qnaReplyVO.content}</p>
		</li>
	</c:forEach>
	</ol>
</div>