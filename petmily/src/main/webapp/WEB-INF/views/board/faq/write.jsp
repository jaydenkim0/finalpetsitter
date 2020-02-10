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
<!-- <script>
$(document).ready(function(){
	$("btnsave").click(function(){
		var faq_title = $("faq_title").val();
		var faq_head = $("faq_head").val();
		var faq_content = $("faq_content").val();
		if(faq_title=""){
			alert("말머리를 선택하세요")
			document.form1.faq_title.focus();
			return;
		}
		if(faq_head=""){
			alert("제목을 입력하세요")
			document.form1.faq_head.focus();
			return;
		}
		if(faq_content=""){
			alert("내용을 입력하세요")
			document.form1.faq_content.focus();
			return;
		}
		document.form1.submit();
	});
});
</script> -->

	<h2>공지글 작성</h2>
<form method="post" action="insert" enctype="multipart/form-data">
      <input type="hidden" name="member_id" value="${sessionScope.id}">
		<table border="1" width="70%">
        <div>말머리
        	<select name="faq_title" >
        		<option>전체공지</option>
        			<option>펫시터공지</option>
        				<option>유저공지</option>
        	</select>
        </div>
        <br>
        <div>제목<input name="faq_head" id="faq_head" size="80" placeholder="글 제목 입력"></div><br>
        <div>내용<textarea name="faq_content" id="faq_content" rows="8" cols="80" placeholder="글 내용 입력"></textarea></div>
        <div>이미지 첨부
        <input type="file" id="faq_file" name="faq_file" multiple accept="image/*" required>
        </div>
        <div style="width:650px; text-align:center;">
            <input type="submit" value="확인">
            <input type="reset" value="초기화">
        </div>
      </table>
  </form>