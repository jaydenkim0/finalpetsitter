<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- jquery js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


<!-- 
HEADER 이용 시 넣어야할 요소 
:	jquery js,
	header css, 
	header script
-->
  <!-- header css -->
  <link rel="stylesheet" href="${context}/resources/css/header.css">
   <!-- header script -->
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
* {
	box-sizing: border-box;
}

.notice_table {
	width: 60%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	border-color: #BDBDBD;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}

.no-tr {
	border-bottom: none;
	padding: 10px;
	text-align: left;
	border-color: #BDBDBD;
}

.tr1 {
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

.td3 {
	text-align: left;
	border-bottom: 1px solid #444444;
	padding: 10px;
	border-color: #BDBDBD;
}

.no-td {
	border: none;
}

.mar-td {
	margin-top: 10px;
}

a {
	text-decoration: none;
	color: black;
	margin-left: auto;
	margin-right: auto;
}

hr {
	width: 80%;
}

.no_inputline {
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
	width: 100px;
	text-align: left;
}

.ta {
	padding-top: 70px;
}

.btn {
	display: white;
	width: 120px;
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

.hover3:hover {
	background-color: #1482e0;
}

<!--
header style -->#masthead:after {
	content: '';
	position: absolute;
	top: 0;
	width: 100%;
	height: 130px;
	background-color: #fff;
	opacity: 100;
	transition: opacity 0.3s ease;
}

#masthead.is-active {
	background-color: #fff;
}

.section-content {
	padding-top: 115px;
}

#masthead:after {
	opacity: 100;
}

.title {
	font-size: 50px;
}

.con {
	margin-top: 50px;
	margin-bottom: 50px;
	height: auto;
}
</style>

<!-- header 불러오기 -->
		<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<section class="section-content">
<div align="center">
	<section class="ta">
		<h1 class="title" align="center">Notice</h1>
		<table class="notice_table">
			<!--FaqVO 안에 있는 정보 불러오기 -->
			<tr>
				<td>No : &nbsp;&nbsp;${faqVO.faq_no}</td>
			</tr>

			<tr>
				<td>Date : ${faqVO.writedateWithFormat}</td>
			</tr>
			
		<tr>
				<td>Name : ${faqVO.member_id}</td>
			</tr>
			
			<tr class="tr1">
				<td>Subject : <font color="#1482e0">[${faqVO.faq_title}]</font>
				${faqVO.faq_head}</td>
			</tr>

		<tr class="tr1">
			<c:forEach var="faqImage" items="${faqImageList}">
			<c:if test="${faqfileDto.faq_file_no ne 0}">
				<tr>
					<td class="td1">
					<br>
					<img src="${context}/board/faq/view/file_view?faq_file_no=${faqImage.faq_file_no}" width="200" height="100">
					</td>
				</tr>
			</c:if>
		</c:forEach>
			<tr class="tr1">
				<td>
				<div class="con">
					<div class="naver-viewer"></div>  
					<input type="hidden" name="faq_content" value="${faqVO.faq_content}">  
				</div>
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
</section>
</div>
</section>
<br>
      <!-- footer 불러오기 -->
     <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>            