<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
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
			<!--FaqVO 안에 있는 정보 불러오기 -->
			<tr>
				<td>글 번호 : ${faqVO.faq_no}</td>
			</tr>

			<tr>
				<td>게시일자 : ${faqVO.writedateWithFormat}</td>
			</tr>

			<tr>
				<td>말머리 : ${faqVO.faq_title}</td>
			</tr>
			
		<tr>
				<td>작성자 : ${faqVO.member_id}</td>
			</tr>

			<tr>
				<td>제목 : ${faqVO.faq_head}</td>
			</tr>

			<c:forEach var="faqImage" items="${faqImageList}">
			<c:if test="${faqfileDto.faq_file_no ne 0}">
				<tr>
					<td>
					<img src="${context}/board/faq/view/file_view?faq_file_no=${faqImage.faq_file_no}" width="200" height="100">
					</td>
				</tr>
			</c:if>
		</c:forEach>
			<tr>
				<td>
					<div class="naver-viewer"></div>  
					<input type="hidden" name="faq_content" value="${faqVO.faq_content}">  
				</td>
			</tr>
	
	<tr>
	
	<td class="td2">
		
		<c:if test="${sessionScope.id eq faqVO.member_id}">
		<input type="hidden" name="faq_no" value="${faqVO.faq_no}">
		<a href="${context}/board/faq/update?faq_no=${faqVO.faq_no}">
		<button type="button" id="btnupdate" class="btn hover3" >게시글 수정</button></a>
		
		<a href="${context}/board/faq/delete?faq_no=${faqVO.faq_no}">
		<button type="button" class="btn hover3"  id="btndelete">게시글 삭제</button></a>
		</c:if>
		
		<a href="${context}/board/faq/list">
		<button type="button" class="btn hover3" >공지게시판 목록</button></a>
	</td>
</tr>
</table>