	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 



	
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="context" value="${pageContext.request.contextPath}"></c:set>    
    

	<head>
	<meta charset="UTF-8">
	<title>등록현황</title>
	<!-- 
	기본 CSS
	:	index css,
		font css
	-->
    <!-- index css -->
    <link rel="stylesheet" href="${context}/resources/css/index.css" />
    <!-- font css -->
    <link rel="stylesheet" href="${context}/resources/css/font.css"/>
    
	<!-- 
	FULL-PAGE-JS 이용 시 넣어야할 요소 
	:	jquery js,
		full-page css,
		full-page js,
		full-page script
	-->
	<!-- jquery js -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
	<!-- full-page css -->
	<link rel="stylesheet" href="${context}/resources/css/fullpage.min.css" />   
	<!-- full-page js -->
	<script src="${context}/resources/js/fullpage.min.js"></script>
    
      
  
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
	 
	  	
 	<style>
	 a button{
	 	background: #146fbd;
	    padding: 7px 14px;
	    color: #fff;
	    border: 0;
	    font-weight: bold;
	    border-radius:3px;
	 }
	  a:hover button{
	 	background: #10538c;
	 }
	 h4{
	 	padding:20px;
	 }	 
	 </style> 
	 
	</head>

    
	<!-- header 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include> 
	 

    <a href="${pageContext.request.contextPath}/admin/"><button>메인으로</button></a>	 

	
	<h4>총 등록 수 (회원, 펫시터, 관리자 포함) : ${mtotal} 명</h4> 
	<h4 style="background:#f2f2f2;"> 총 회원 : ${member} 명 </h4> 
	<h4 style="background: #bbbbbb;"> 총 펫시터 : ${ptotal} 명 </h4>
	<h4 style="background:rgba(96, 125, 139, 0.7);"> 총 관리자 : ${atotal} 명 </h4>
	

	<hr>

	<h4 style="background:#f2f2f2;">	어제 가입한 맴버의 수 : ${mlist+slist} 명</h4>
	<h4 style="background: #bbbbbb;"> 어제 가입한 회원 수 :  ${mlist} 명</h4>
	<h4 style="background:rgba(96, 125, 139, 0.7);">	어제 펫시터 신청 수 :  ${slist} 명</h4>
	

	<hr>

	
	<h3>	어제 신고 게시글 수 : ${listBqna} 회</h3>
	<h4 style="background: #bbbbbb;"> 어제 경고 당한 회원의 수 :  ${listBm} 명</h4>
	<h4 style="background:rgba(96, 125, 139, 0.7);"> 어제 경고 당한 펫시터의 수 : ${listBs} 명</h4> 
	
	
     <!-- footer 불러오기 -->
     <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>  
       
