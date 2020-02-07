<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <c:set var="context" value="${pageContext.request.contextPath}"></c:set>
	<form name="update" method="post" action="${context}/board/faq/update">
	
	<div>글 번호</div>
	<div><input name="faq_no" value="${faqVO.faq_no}"  type="number" readonly="readonly"></div>
	
	<div>작성자</div>
	<div><input name="member_id" value="${faqVO.member_id}"  type="text" readonly="readonly"></div>
	
	<div>작성일자</div>
	<div>${faqVO.wdate}</div>
	
	<div>말머리</div>
	<div>
	<select name="faq_title"  value="${faqVO.faq_title}">
        		<option>전체공지</option>
        			<option>펫시터공지</option>
        				<option>유저공지</option>
        	</select>
	</div>
	
	<div>제목 : </div>
	<div><input name="faq_head" value="${faqVO.faq_head}" type="text" ></div>
	
	<div>내용 : </div>
	<div><input name="faq_content" value="${faqVO.faq_content}" type="text" ></div>
	
	<div>
		<input type="submit" value="수정">
		<input type="reset" value="초기화">
	</div>
</form>