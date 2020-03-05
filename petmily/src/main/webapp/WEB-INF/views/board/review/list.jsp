<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<!-- BootStrap CDN -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
   
    
  <link rel="stylesheet" href="${context}/resources/css/header.css">
  
   <script>
      $(function() {
          $('body').addClass('js');
          $('#masthead').addClass('color');
          
          var $hamburger = $('.hamburger'),
              $nav = $('#site-nav'),
              $masthead = $('#masthead');

          $hamburger.click(function() {
            $(this).toggleClass('is-active');
            $nav.toggleClass('is-active');
            $masthead.toggleClass('is-active');
            return false; 
          })
      });
    </script>
    
    <!-- 
FOOTER 이용 시 넣어야할 요소 
:	jquery js,
	footer css, 
	Required meta tags, 
	Bootstrap CSS,
	아이콘을 사용하기 위해 추가로 불러오는 CSS
-->
  	<!-- footer css -->
    <link rel="stylesheet" href="${context}/resources/css/footer.css"/>  
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- 아이콘을 사용하기 위해 추가로 불러오는 CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    

<!-- 에디터와 동일한 의존성 라이브러리 설정을 한다 -->
<!-- naver toast ui editor를 쓰기 위해 필요한 준비물 -->
<link rel="stylesheet" type="text/css"
   href="${context}/resources/lib/toast/css/codemirror.min.css">
<link rel="stylesheet" type="text/css"
   href="${context}/resources/lib/toast/css/github.min.css">
<link rel="stylesheet" type="text/css"
   href="${context}/resources/lib/toast/css/tui-color-picker.min.css">
<link rel="stylesheet" type="text/css"
   href="${context}/resources/lib/toast/dist/tui-editor.min.css">
<link rel="stylesheet" type="text/css"
   href="${context}/resources/lib/toast/dist/tui-editor-contents.min.css">

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script
   src="${context}/resources/lib/toast/dist/tui-editor-Editor-full.min.js"></script>

<!-- 네이버 에디터 영역 -->
<script>
   $(function() {
      //document.querySelectorAll은 우측 선택자에 해당하는 모든 태그를 다 불러옴
      //.forEach는 불러온 대상을 iteration 하는 반복 명령(한개씩 다시 불러와서 tag이라고 부름)
      document.querySelectorAll(".naver-viewer").forEach(function(tag) {
         var options = {
            //el(element) : 에디터가 될 영역
            el : tag,

            viewer : true,

            //height : 생성될 에디터의 높이
            height : 'auto',
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

<!--    <style> -->
<style>
	

	#masthead:after {
	  content: '';
	  position: absolute;
	  top: 0;
	  width: 100%;
	  height: 100px;
	  background-color: #fff;
	  opacity: 100;
	  transition: opacity 0.3s ease;
	}
	
	#masthead.is-active{
	 background-color: #fff;
	}
	
	.section-content{
	padding-top:150px;
	
	}
	
.page-navigator li {
   display: inline-block;
   margin-left: 10px;
    padding: 5px 10px; 
   font-size:15px;
   font-weight: 600;

   
/*    background: #white; */
/*    border: 1px solid #444444; */
/*    border-radius:100px; */

}

table td img {
   width: 60px;
}

.review_table {
   width: 72%;
   border-top: 1px solid #444444;
   border-collapse: collapse;
   border-color: #BDBDBD;
}

th {
   border-bottom: 1px solid #444444;
   padding: 10px;
   text-align: center;
   border-color: #BDBDBD;
}

td{
    text-align: left;
    border-bottom: 1px solid #444444;
   padding: 10px;
   border-color: #BDBDBD;
}


a {
   text-decoration: none;
   color: black;
}

.right_mar {
   margin-right: 10%;
}


.page-navigator li.active>a {
   color: #1482e0;
}

.btn {
   display: white;
   width: 50px;
   height: 10x;
   line-height: 20px;
   border: 1px #CF0505 solid;
   background-color: white;
   text-align: center;
   font-size: 12px;
   cursor: pointer;
   color: #CF0505;
   transition: all 0.9s, color 0.3;
}

.btn2 {
   display: white;
   width: 80px;
   height: 10x;
   line-height: 20px;
   border: 1px #3399dd solid;
   background-color: white;
   text-align: center;
   font-size: 12px;
   cursor: pointer;
   color: #1482e0;
   transition: all 0.9s, color 0.3;
}

.btn:hover {
   color: white;
}

.btn2:hover {
   color: white;
}

.hover3:hover {
   background-color: #CF0505;
}

.hover2:hover {
   background-color: #1482e0;
}

input {
   width: 150px;
   height: 35px;
   font-size: 14px;
   vertical-align: middle;
   border-color: #BDBDBD;
   border-style: solid;
   border-width: 1px;
   border-radius: 4px;
}

select {
   width: 80px;
   height: 35px;
   font-size: 14px;
   vertical-align: middle;
   border-color: #BDBDBD;
   border-style: solid;
   border-width: 1px;
   border-radius: 4px;
}
</style>
<head>
<!-- header 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
</head>

<section class="section-content" >
<body>
<div align="center">
   <h1>리뷰 게시판</h1>
   <br>
  
      <table class="review_table">
         <tr>
            <th>글번호</th>
            <th>작성자</th>
            <th>펫시터</th>
            <th>제목</th>
            <th>내용</th>
            <th>별점</th>
            <th>작성일</th>
            <th></th>
         </tr>

         <c:forEach var="reviewDto" items="${list}">
            <tr>
               <td>${reviewDto.review_no}</td>
               <td><c:choose>
                     <c:when test="${ !empty reviewDto.review_writer}">
                  ${reviewDto.review_writer}
                  <c:if test="${sessionScope.grade eq 'admin'}">
                           <a
                              href="${context}/admin/memberdetail?id=${reviewDto.review_writer}">
                              회원정보 </a>
                        </c:if>
                     </c:when>
                     <c:otherwise>
                        <small> 탈퇴한 회원 </small>
                     </c:otherwise>
                  </c:choose></td>
               <td><c:choose>
                     <c:when test="${ !empty reviewDto.sitter_id}">
                     ${reviewDto.sitter_id}   
                     <c:if test="${sessionScope.grade eq 'admin'}">
                           <a
                              href="${context}/admin/petsitter/petsitterdetail?pet_sitter_no=${reviewDto.review_sitter_no}">
                              펫시터정보 </a>
                        </c:if>
                     </c:when>
                     <c:otherwise>
                        <small> 탈퇴한 펫시터 </small>
                     </c:otherwise>
                  </c:choose></td>
               <td><a
                  href="${context}/petsitter/content?pet_sitter_no=${reviewDto.review_sitter_no}">${reviewDto.review_title}</a></td>
               <td width="300">
                  <div class="naver-viewer"></div> <input type="hidden"
                  name="review_content" value="${reviewDto.review_content}" >
               </td>
               <td><c:choose>
                     <c:when test="${reviewDto.review_star eq 1}">
                        <img src="${context}/resources/img/1.png">
                     </c:when>
                     <c:when test="${reviewDto.review_star eq 2}">
                        <img src="${context}/resources/img/2.png">
                     </c:when>
                     <c:when test="${reviewDto.review_star eq 3}">
                        <img src="${context}/resources/img/3.png">
                     </c:when>
                  </c:choose></td>

               <td>${reviewDto.getwritedateWithFormat()}</td>
               
               <td width="40">
               <div align="right" class="right_mar">
               <c:if test="${sessionScope.grade eq 'admin'}">
                     <a
                        href="${context}/board/review/delete?review_no=${reviewDto.review_no}">
                        <button type="button" class="btn hover3" id="btndelete">삭제</button>
                     </a>
                  </c:if>
                  </div>
                  </td>
                  </tr>
                        </c:forEach>
     </table>
   <br>
   <br>

      <!-- 네비게이터(navigator) -->
      
         <jsp:include page="/WEB-INF/views/board/review/navigator.jsp">
            <jsp:param name="pno" value="${pno}" />
            <jsp:param name="count" value="${count}" />
            <jsp:param name="navsize" value="${navsize}" />
            <jsp:param name="pagesize" value="${pagesize}" />
         </jsp:include>
      

      <!-- 검색기능  -->
      <c:if test="${sessionScope.grade eq 'admin'}">
         <form method="get" action="${context}/board/review/list">
            <select name="type" class="input-item">
               <option value="review_writer">작성자</option>
               <option value="sitter_id">펫시터</option>
               <option value="review_title">제목</option>
               <option value="review_content">내용</option>
            </select> <input class="input-item" name="keyword" placeholder="검색어" required>
            <input type="submit" value="조회" class="btn2 hover2">
         </form>
      </c:if>
</div>

</body>

</section>
<footer>
<br><!-- footer 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	
</footer>

</html>