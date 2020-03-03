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
	 h3{
	 	padding:20px;
	 }	 
	 </style>
    
    <script>
		// 원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 생성
		function list(page){
			location.href="${pageContext.request.contextPath}/admin/list/reservationstatus?curPage="+page+"&searchOption=${searchOption}"+"&keyword=${keyword}";
			}
	</script>
 
	
	<h3> 예약 현황 </h3>	

    <a href="${pageContext.request.contextPath}/admin/"><button>메인으로</button></a> 
	
	<!-- 검색 기능 -->
	<form method="post" action="${pageContext.request.contextPath}/admin/list/reservationstatus">
		<select name="searchOption" onchange="doChange(this, 'selTwo')">		
			<option value="member_id"  >신청회원</option>
			<option value="sitter_id" >펫시터</option>
			<option value="reservation_no" >예약번호</option>
		</select>		
		<input  name="keyword" value="${keyword}" id="keyword">
		<input type="submit" value="검색">
	</form>
	
	<div>
		<a><button>견적 상태 '대기' 보기</button></a>
		<a><button>견적 상태 '승인' 보기</button></a>
	</div>
	<div>
		<a><button>결제 상태 '완료' 보기</button></a>
		<a><button>결제 상태 '취소' 보기</button></a>
	</div>
	
	${count}개의 게시물이 있습니다.		 	
 	
	<!--  테이블 적용 --> 	
	<table>
		<tr>
			<th> 예약번호 </th>
			<th> 신청회원 </th>
			<th> 펫시터 </th>
			<th> 견적 상태 </th>			
			<th> 결제 상태 </th>
		</tr>	 	
			<!-- 리스트 내용 -->
			<c:forEach var="reservation"  items="${list}">		
				<c:choose>
					<c:when test="${reservation.status eq '대기' &&  empty reservation.statuslist}">						
							<tr>
								<td> 
									<a href="${pageContext.request.contextPath}/admin/reservationstatusdetail?reservation_no=${reservation.reservation_no}">
										${reservation.reservation_no} 
									</a>		
								</td>
								<td> ${reservation.member_id} </td>		
								<td> ${reservation.sitter_id} </td>	
								<td> 펫시터 확인 중 </td>
								<td> 펫시터 확인 중 </td>
							</tr>					
					</c:when>	
					<c:when test="${reservation.status eq '승인' && empty reservation.statuslist}">						
							<tr>
								<td> 
									<a href="${pageContext.request.contextPath}/admin/reservationstatusdetail?reservation_no=${reservation.reservation_no}">
										${reservation.reservation_no} 
									</a>					
								</td>
								<td> ${reservation.member_id} </td>		
								<td> ${reservation.sitter_id} </td>	
								<td> ${reservation.status} </td>
								<td> 회원 결제 준비 중 </td>
							</tr>						
					</c:when>
					<c:when test="${!empty reservation.statuslist}">					
							<tr>							
								<td> 
									<a href="${pageContext.request.contextPath}/admin/reservationstatusdetail?reservation_no=${reservation.reservation_no}">
										${reservation.reservation_no} 
									</a>	
								</td>
								<td> ${reservation.member_id} </td>		
								<td> ${reservation.sitter_id} </td>	
								<td> ${reservation.status} </td>								 
								<td>
									<c:forEach var="paystatus" items="${reservation.statuslist}">
										${paystatus.status}
									</c:forEach> 
								</td>
							</tr>					
					</c:when>
				</c:choose>		
			</c:forEach>		
	</table>


	<!-- 페이징 -->
			<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
			<c:if test="${navi.curBlock > 1}">
				<a href="javascript:list('1')">[처음]</a>
			</c:if>			
			<!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
			<c:if test="${navi.curBlock > 1}">
				<a href="javascript:list('${navi.prevPage}')">[이전]</a>
			</c:if>			
			<!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 -->
			<c:forEach var="num" begin="${navi.blockBegin}" end="${navi.blockEnd}">
				<!-- 현재페이지이면 하이퍼링크 제거 -->
				<c:choose>
					<c:when test="${num == navi.curPage}">
						<span style="color: red">${num}</span>&nbsp;
					</c:when>
					<c:otherwise>
						<a href="javascript:list('${num}')">${num}</a>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>						
			<!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
			<c:if test="${navi.curBlock <= navi.totBlock}">
				<a href="javascript:list('${navi.nextPage}')">[다음]</a>
			</c:if>			
			<!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
			<c:if test="${navi.curPage <= navi.totPage}">
				<a href="javascript:list('${navi.totPage}')">[끝]</a>
			</c:if>	
	<!-- 페이징 -->

	 
	 