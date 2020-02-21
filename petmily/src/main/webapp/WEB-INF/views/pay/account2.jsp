<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<style>
	
</style>

<c:forEach var="rlist" items="${reservationList}">
 	<form action=account method="post">
	<input type="hidden" name="member_id" value="${sessionScope.id}">
	<input type="hidden" name="reservation_no" value="${param.reservation_no}">
<h1>견적 내용</h1>
<hr>
	<table border="1" width="100%">
      <tr>
        <th>예약 번호</th>
        <th>예약 날짜</th>
        <th>예약 회원</th>
        <th>펫시터번호</th>
        <th>이용 시간</th>
        <th>예약 스킬</th>
        <th>예약 총 금액</th>
      </tr>
      <tr>
      <td>
      <input type="text" name="partner_order_id" value="${rlist.reservation_no}" readonly>
      </td>
      <td>${rlist.matching_time}</td>
      <td>
      <input type="text" name="partner_user_id" value="${rlist.member_id}" readonly>
      </td>
      <td>
       <input type="text" name="item_name" value="${rlist.reservation_sitter_no}" readonly>
      </td>
   <c:forEach var="skill" items="${rlist.list}">     
      <td>
      <input type="text" name="quantity" value="${skill.usage_time}" readonly>시간</td>
     <td>
     ${skill.payname}
     </td>
      </c:forEach>
      <td>
      <input type="text" name="total_amount" value="${payMent}" readonly>원</td>
      </tr>
 </table>
</form>
</c:forEach>

<c:forEach var="rlist" items="${reservationList}">
<form action=account method="post">
	<!-- reservation_no -->
	<input type="text" name="partner_order_id" value="44" placeholder="주문번호"><br><br>
	<!-- member_id -->
	<input type="text" name="partner_user_id" value="122" placeholder="사용자번호"><br><br>
	<!-- petsitter_no -->
	<input type="text" name="item_name" value="죠르디이" placeholder="상품명"><br><br>
	<!-- usage_time_start -->
	<input type="text" name="quantity" value="1" placeholder="수량"><br><br>
	<!-- payMent -->
	<input type="text" name="total_amount" value="${payMent}" placeholder="총 가격"><br><br>
	
	<input type="submit" value="최종 결제하기">
</form>
</c:forEach>
       
<!--         <button class="btn_style1">체크/신용카드</button> -->
<!--         <button class="btn_style1">핸드폰 결제</button> -->
<!--         <button class="btn_style1">실시간 계좌이체</button> -->
<!--         <button class="btn_style1">무통장 입금</button> -->
<!--          <button class="btn_style1"> -->
<%--          <img src="${context}/resources/img/kakaopay.png"></button> --%>
<!--         <br><br> -->
        <div>
            <input type="checkbox">개인정보 제 3자 제공 동의, 결제 대행 서비스 이용 약관 등 모든 약관에 동의합니다.
        </div><br>
        <div>
            <input type="submit" value="결제">
        </div>