<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<h1>펫시터 예약 조회</h1>
	<c:forEach var="rlist" items="${reservationList}">
			<span>예약 번호 : ${rlist.reservation_no}</span><br>
			<span>예약 회원 : ${rlist.member_id}</span><br>
			<span>예약 날짜 : ${rlist.matching_time}</span><br>
			<span>예약 이용 시간 : ${usageTime}시간</span><br>
			<span>시작 시간 : ${startTime}시</span><br>
			
			<c:forEach var="skill" items="${rlist.list}">
				<span>예약 스킬 : ${skill.payname}</span><br>
			</c:forEach>
			
			<img src="${pageContext.request.contextPath}/petsitter/pet/image?pet_no=${rlist.pet_no}" style="width: 20%; height: auto;" onerror="no_image()" id="pet_image">
			<br><span>반려동물 이름 : ${rlist.pet_name}</span><br>
			<span>반려동물 나이 : ${rlist.age}살</span><br>
			<span>반려동물 종류 : ${rlist.type}</span><br>
			<span>반려동물 특이사항 : ${rlist.pet_ect}</span><br>
			
			<span>예약 총 금액 :${payMent}원</span><br><br>
	</c:forEach>
		
		
		
		
