<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
 <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <c:set var="context" value="${pageContext.request.contextPath}"></c:set>
 <c:set var="admin" value="${grade eq 'admin'}"></c:set>
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
        	//document.querySelectorAll은 우측 선택자에 해당하는 모든 태그를 다 불러옴
        	//.forEach는 불러온 대상을 iteration 하는 반복 명령(한개씩 다시 불러와서 tag이라고 부름)
        	document.querySelectorAll(".naver-viewer").forEach(function(tag){
        		var options = {
					//el(element) : 에디터가 될 영역
					el:tag,
                       
                    viewer:true,

                     //height : 생성될 에디터의 높이
                     height:'auto',
				};

				var viewer = tui.Editor.factory(options);

				//생성된 뷰어에 초기값 표시
                var text = $(tag).next("input[type=hidden]").val();
                viewer.setValue(text);//값 설정
        	}); 	            
        });
    </script>
    
	<!-- 네이버 에디터 영역 종료 --> 
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
		$(document).ready(function() {
			$("#btnWrite").click(function() {
				location.herf = "${context}/board/review/insert";
			});
		});
		function list(page) {
			loaction.href = "${context}/board/list?curPage=" + page
					+ "&type-${map.type}" + "&keyword=${map.keyword}";
		}
	</script>
	
	<style>
	.page-navigator li {
		display: inline-block;
	}
	table td img{
		width:60px;
	}
	</style>

	<h1>리뷰 게시판</h1>
	<br>


	<!-- 검색기능  -->
	<c:if test="${sessionScope.grade eq 'admin'}">
		<form method="get" action="${context}/board/review/list">
			<select name="type" class="input-item">
				<option value="review_writer">작성자</option>
				<option value="sitter_id">펫시터</option>
				<option value="review_title">제목</option>
				<option value="review_content">내용</option>
			</select> <input class="input-item" name="keyword" placeholder="검색어" requierd>
			<input type="submit" value="조회">
		</form>
	</c:if>


	<section>
		
		<table border="1" width="100%">
		<tr>
			<th>글번호</th>
			<th>작성자</th>
			<th>펫시터</th>
			<th>제목</th>
			<th>내용</th>
			<th>별점</th>
			<th>작성일</th>	
		</tr>
	
		<c:forEach var="reviewDto" items="${list}">
		<tr>
			<td>${reviewDto.review_no}</td>
			<td>
				<c:choose>
					<c:when test="${ !empty reviewDto.review_writer}">
						${reviewDto.review_writer}
						<c:if test="${sessionScope.grade eq 'admin'}">
							<a href="${pageContext.request.contextPath}/admin/memberdetail?id=${reviewDto.review_writer}">
								회원정보
							</a>
						</c:if>		
					</c:when>
					<c:otherwise>
						<small> 탈퇴한 회원 </small>
					</c:otherwise>
				</c:choose>	
			</td>
			<td>
				<c:choose>
						<c:when test="${ !empty reviewDto.sitter_id}">
							${reviewDto.sitter_id}	
							<c:if test="${sessionScope.grade eq 'admin'}">
								<a href="${pageContext.request.contextPath}/admin/petsitter/petsitterdetail?pet_sitter_no=${reviewDto.review_sitter_no}">
									펫시터정보
								</a>	
							</c:if>			
						</c:when>
						<c:otherwise>
							<small> 탈퇴한 펫시터 </small>
						</c:otherwise>
				</c:choose>
			</td>
				<td><a href="${context}/petsitter/content?pet_sitter_no=${reviewDto.review_sitter_no}">${reviewDto.review_title}</a></td>		
			<td>	
				<div class="naver-viewer"></div>  
				<input type="hidden" name="review_content" value="${reviewDto.review_content}">  
			</td>
			<td>
				<c:choose>
					<c:when test="${reviewDto.review_star eq 1}">
						<img src="${pageContext.request.contextPath}/resources/img/1.png">
					</c:when>
					<c:when test="${reviewDto.review_star eq 2}">
						<img src="${pageContext.request.contextPath}/resources/img/2.png">
					</c:when>
					<c:when test="${reviewDto.review_star eq 3}">
						<img src="${pageContext.request.contextPath}/resources/img/3.png">
					</c:when>			
				</c:choose>		
			</td>
			
			<td>${reviewDto.getwritedateWithFormat()}</td>
			
			<td width="40">	
				<c:if test="${sessionScope.grade eq 'admin'}">
					<a href="${pageContext.request.contextPath}/board/review/delete?review_no=${reviewDto.review_no}">
						<button type="button" id="btndelete">삭제</button>
					</a>					
				</c:if>
			</td>	
		</tr>
		</c:forEach>
		</table>
	
			<!-- 네비게이터(navigator) -->
			<div class="row">
				<jsp:include page="/WEB-INF/views/board/review/navigator.jsp">
					<jsp:param name="pno" value="${pno}" />
					<jsp:param name="count" value="${count}" />
					<jsp:param name="navsize" value="${navsize}" />
					<jsp:param name="pagesize" value="${pagesize}" />
				</jsp:include>
			</div>
			
	</section>

