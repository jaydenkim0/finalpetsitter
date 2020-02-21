<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>

<style>
	input {
	border:none;
	border-right:0px;
	border-top:0px; 
	boder-left:0px; 
	boder-bottom:0px;
	width:100px;
 	height:50px;
    font-size:20px;
	}
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
      <c:forEach var="skill" items="${rlist.list}">     
        <th >예약 스킬</th>
       </c:forEach>
        <th>이용 시간</th>
        <th>예약 총 금액</th>
      </tr>
      <tr>
      <td>
      <input type="hidden" name="partner_order_id" value="${rlist.reservation_no}" readonly>
      </td>
      <td>${rlist.matching_time}</td>
      <td>
      <input type="text" name="partner_user_id" value="${rlist.member_id}" readonly>
      </td>
      <td>
       <input type="text" name="item_name" value="${rlist.reservation_sitter_no}" readonly>
      </td>
   	<c:forEach var="skill" items="${rlist.list}">     
     <td >${skill.payname}</td>
      </c:forEach>
      <td>
      <input type="text" name="quantity" value="${usageTime}" readonly>시간</td>
      <td>
      <input type="text" name="total_amount" value="${payMent}" readonly>원</td>
      </tr>
 </table>
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
</form>
</c:forEach>       