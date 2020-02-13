<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<h2>게시글 상세 보기</h2>
<script>
	$(document).ready(function() {
		$("btndelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "${context}/board/faq/delete";
				document.form1.submit();
			}
		});
		$("btnupdate").click(function() {
			var faq_title = $("faq_title").val();
			var faq_head = $("faq_head").val();
			var faq_content = $("faq_content").val();
			if (faq_title = "") {
				alert("말머리를 선택하세요")
				document.form1.faq_title.focus();
				return;
			}
			if (faq_head = "") {
				alert("제목을 입력하세요")
				document.form1.faq_head.focus();
				return;
			}
			if (faq_content = "") {
				alert("내용을 입력하세요")
				document.form1.faq_content.focus();
				return;
			}
			document.form1.action = "${context}/board/faq/update"
			document.form1.submit();
		});
	});
</script>
<form name="form1" method="post">
	<div align="center">
		<table border="1" width="100%">
			<!--FaqVO 안에 있는 정보 불러오기 -->
			<tr>
				<td>글번호 : ${faqVO.faq_no}</td>
			</tr>

			<tr>
				<td>게시일자 : ${faqVO.writedate}</td>
			</tr>

			<tr>
				<td>말머리 : ${faqVO.faq_title}</td>
			</tr>

			<tr>
				<td>제목 : ${faqVO.faq_head}</td>
			</tr>

			<tr>
				<td>${faqVO.faq_content}</td>
			</tr>
		</table><br>

		<c:forEach var="faqImage" items="${faqImageList}">
			<c:if test="${faqfileDto.faq_file_no ne 0}">
				<tr>
					<td><img
						src="${context}/board/faq/view/file_view?faq_file_no=${faqImage.faq_file_no}"></td>
				</tr>
			</c:if>
		</c:forEach>
	</div>
</form>

<a href="${context}/board/faq/list">
	<button type="button">공지게시판 목록</button>
</a>
<br>

<br>
<c:if test="${sessionScope.id eq faqVO.member_id}">
	<input type="hidden" name="faq_no" value="${faqVO.faq_no}">
	<a href="${context}/board/faq/update?faq_no=${faqVO.faq_no}">
		<button type="button" id="btnupdate">수정</button>
	</a>
	<a href="${context}/board/faq/delete?faq_no=${faqVO.faq_no}">
		<button type="button" id="btndelete">삭제</button>
	</a>
	<br>
	<br>
</c:if>