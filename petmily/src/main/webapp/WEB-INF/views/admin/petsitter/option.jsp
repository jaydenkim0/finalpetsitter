<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<style>
	a button{
	 	background: #ad3a11;
	    padding: 7px 14px;
	    color: #fff;
	    border: 0;
	    font-weight: bold;
	 }
	  a:hover button{
	 	background: rgba(173, 58, 17, 0.78);
	 }
	 h2{
	 	margin-top:35px;
	 	padding-top: 35px;
    	border-top: 1px solid #ddd;
	 }
	 .regis-form{
		display: flex;
	    justify-content: flex-start;
	    align-items: center;
	    text-align: center;
    }
    .regis-form > div{
    	display: block;
    	width: 16.666%;
    	margin-right: 7px;
    	border-right: 1px solid skyblue;
    }
     .regis-form > div:last-child{
     	border-right:0;
     	margin-right:0;
     }
    .regis-form > div form input{
    	background: #f2f2f2;
	    border: none;
	    padding: 7px 14px;
	    margin-top:12px;
	}
	.resgis-btn{
		margin-top:35px;
	}
	.resgis-btn form input{
		background: #ad3a11;
		color:#fff;
	    border: none;
	    padding: 7px 14px;
	    font-weight:bold;
	    vertical-align:middle;
	}
	.resgis-btn form input[type="text"]{
		background:#fff;
		font-weight:normal;
		border:1px solid #ddd;
		height:32px;
	}
	</style>
	
	<h1> 펫시터 옵션 기능 추가 삭제 </h1>
	
	<a href="${pageContext.request.contextPath}/admin/petsitter"><button>펫시터페이지로 이동</button></a>
	
	<h2>펫시터 케어가능 동물 추가 제거</h2>
	
	<div class="regis-form">
		<c:forEach var="carePetType" items="${CTlist}">	
		<div>
				
			${carePetType.care_type}
		
		<!-- 삭제 -->
			<form action="${pageContext.request.contextPath}/admin/petsitter/option/carePetTypeD"  method="get">
				<input type="hidden" name="care_type_no" value="${carePetType.care_type_no}">
				<input type="submit" value="삭제하기">
			</form>
			</div>
		</c:forEach>
	</div>
	<div class="resgis-btn">
	<!-- 등록하기 -->
		<form action="${pageContext.request.contextPath}/admin/petsitter/option/scarePetTypeI"  method="get">
				<input type="text" name="care_type" placeholder="돔봄가능한 동물" required>
				<input type="submit" value="등록하기">
		</form>
	</div>
	
	
		<h2>펫시터 스킬 네임 추가 제거</h2>
	
	<div class="regis-form">	
		<c:forEach var="petSkillName" items="${SKlist}">	
			<div>		
			${petSkillName.skill_name}
		
		<!-- 삭제 -->
			<form action="${pageContext.request.contextPath}/admin/petsitter/option/petSkillNameD"  method="get">
				<input type="hidden" name="skill_no" value="${petSkillName.skill_no}">
				<input type="submit" value="삭제하기">
			</form>
			</div>
		</c:forEach>
	</div>
	<div class="resgis-btn">
	<!-- 등록하기 -->
		<form action="${pageContext.request.contextPath}/admin/petsitter/option/petSkillNameI"  method="get">
				<input type="text" name="skill_name" placeholder="스킬이름등록" required>
				<input type="submit" value="등록하기">
		</form>	
	</div>
	
		<h2>펫시터 환경 추가 제거</h2>
	
	<div class="regis-form">	
		<c:forEach var="petCareCondition" items="${CClist}">	
			<div>
			${petCareCondition.care_condition_name}
		
		<!-- 삭제 -->
			<form action="${pageContext.request.contextPath}/admin/petsitter/option/petCareConditionD"  method="get">
				<input type="hidden" name="care_condition_no" value="${petCareCondition.care_condition_no}">
				<input type="submit" value="삭제하기">
			</form>
			</div>	
		</c:forEach>
	</div>
	<div style="padding-bottom:35px;" class="resgis-btn">
	<!-- 등록하기 -->
		<form action="${pageContext.request.contextPath}/admin/petsitter/option/petCareConditionI"  method="get">
				<input type="text" name="care_condition_name" placeholder="스킬이름등록" required>
				<input type="submit" value="등록하기">
		</form>	
	</div>
	