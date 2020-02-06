<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <c:set var="context" value="${pageContext.request.contextPath}"></c:set>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>

//아래쪽에서 이 함수를 호출해서 페이지값을 컨트롤러에 맵핑시킨다
function list(page){
    console.log("페이지를 이동합니다.");
    location.href="list?curPage="+page;
}
</script>

<h1>공지사항 게시판</h1>
	<a href="${context}/board/faq/write">글쓰기</a><br><br>
<table border="1" width="100%">
<tr>
	<th>글번호</th>
	<th>작성자</th>
	<th>말머리</th>
	<th>제목</th>
	<th>내용</th>
	<th>게시일자</th>
</tr>
<c:forEach var="row" items="${list}">
<tr>
	<td>${row.faq_no}</td>
	<td>${row.member_id}</td>
	<td>${row.faq_title}</td>
	<td>
		<a href="${context}/board/faq/view?faq_no=${row.faq_no}">${row.faq_head}</a>
	</td>
	<td>${row.faq_content}</td>
	<td>${row.wdate}</td>
</tr>
</c:forEach>

 <tr>
        <td colspan = "7" align = "center">
            <c:if test="${map.faqPage.curBlock > 1}">
  	<a href="#" onclick="list('1')">[처음]</a>
            </c:if> <!-- 현재 블록이 1블록보다 크면 (뒤쪽에 있기때문에) 처음으로 갈 수 있도록 링크를 추가 -->
        
            <c:if test="${map.faqPage.curBlock > 1}">
                <a href="#" onclick="list('${map.faqPage.prevPage}')">[이전]</a>
            </c:if> <!-- 현재 블록이 1블록보다 크면 이전 블록으로 이동할 수 있도록 링크 추가 -->
            
            <c:forEach var="num"
                begin="${map.faqPage.blockBegin}"
                end="${map.faqPage.blockEnd}">
                <c:choose>
                    <c:when test="${num == map.faqPage.curPage}">
                    
                    <!-- 현재 페이지인 경우 하이퍼링크 제거 -->
                    <!-- 현재 페이지인 경우에는 링크를 빼고 빨간색으로 처리를 한다. -->
                        <span style="color:red;">${num}</span>
                    </c:when>
                    <c:otherwise>
                        <a href="#" onclick="list('${num}')" >${num}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            
            
            <c:if test="${map.faqPage.curBlock <= map.faqPage.totBlock}">
                <a href="#" onclick="list('${map.faqPage.nextPage}')">[다음]</a>
            </c:if> <!-- 현재 페이지블록이 총 페이지블록보다 작으면 다음으로 갈 수있도록 링크를 추가 -->
            
            
            <c:if test="${map.faqPage.curPage <= map.faqPage.totPage}">
                <a href="#" onclick="list('${map.faqPage.totPage}')">[끝]</a>
            </c:if> <!-- 현재 페이지블록이 총 페이지블록보다 작거나 같으면 끝으로 갈 수 있도록 링크를 추가함-->
            </td>
    </tr>
</table> <br><br>