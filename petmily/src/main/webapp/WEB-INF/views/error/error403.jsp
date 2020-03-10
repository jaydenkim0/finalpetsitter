<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<meta charset="UTF-8">
	<title>403</title>
<!-- 
기본 CSS
:	font css
	regist css
-->
	<!-- error css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/error.css"/>   
    <!-- font css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css"/>

	<div class="error-wrap">
		<img alt="펫밀리_로고 " src="${pageContext.request.contextPath}/resources/img/logo_gradation.png">
		<h3>403</h3>
		<h4>권한이 없습니다.</h4>
		<a href="${pageContext.request.contextPath}"><button id="main_btn"> 메인페이지로 이동</button></a>	
	</div>