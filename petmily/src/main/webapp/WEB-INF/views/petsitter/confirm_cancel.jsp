<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
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
		
		<h3>이미 거절하신 예약입니다.</h3>
		<h5 style="margin-top: -35px;">-예약을 다시 받고싶다면 펫밀리에 문의해주세요.-</h5>

		<a href="${pageContext.request.contextPath}"><button id="main_btn"> 메인페이지로 이동</button></a>	
	</div>