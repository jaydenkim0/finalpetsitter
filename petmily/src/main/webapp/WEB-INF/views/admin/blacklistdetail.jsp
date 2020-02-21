<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    
    
    
	<h3>블랙리스트 정보 디테일 페이지</h3>
	
	
	<a href="${pageContext.request.contextPath}/admin/blackList"><button>블랙리스트 페이지로 이동</button></a>	
	
	
	<c:choose>			
			<c:when test="${blackListdetail.black_grade eq 'petsitter'}">
				<div style="color:red;">
					<table>
						<tr>
							<td> 아이디 : ${blackListdetail.black_id}							
							<a href="${pageContext.request.contextPath}/admin//petsitter/petsitterdetail?pet_sitter_no=${blackListdetail.pet_sitter_no}">							
							| 회원정보 보기
							</a>
							</td>				
						</tr>
						<tr>
							<td> 이름 : ${blackListdetail.black_name}</td>				
						</tr>
							<tr>
							<td> 연락처 : ${blackListdetail.black_phone}</td>									
						</tr>
						<tr>
							<td> 등급 : ${blackListdetail.black_grade}</td>				
						</tr>
						<tr>
							<td> 경고 횟수 : ${blackListdetail.black_count}</td>				
						</tr>		
					</table>		
				
					<h3>※아래와 같은 사유로 경고를 받은 펫시터입니다</h3>
							<hr>						
							<c:forEach var="blacklistcontent" items="${blacklistcontent}">						
							<!-- 경고받을때 등급 -->
								<h5> 경고 등급 : ${blacklistcontent.black_content_grade} </h5>
							<!-- 경고 사유  -->
								<h5> 경고 내용 : ${blacklistcontent.black_content} </h5>
							<!--  경고 등록일-->
								<h5> 경고 등급 : ${blacklistcontent.getBlackListdateWithFormat()} </h5>
							<hr>		
							</c:forEach>
					
							
					<!-- 블랙리스트 등록 회원은 삭제 버튼 노출 -->
					<form  action="${pageContext.request.contextPath}/admin/sitter_delete" method="get">			
							<input type="hidden" name="sitter_id" value="${blackListdetail.black_id}">	
							<input type="hidden" name="sitter_no" value="${blackListdetail.pet_sitter_no}">				
							<button  type="submit" >경고펫시터 탈퇴</button>						
					</form>
					
					<!-- 정상 펫시터로 복귀 -->
					<form action="${pageContext.request.contextPath}/admin/blackList/comebackPet" method="get">
							<input type="hidden" name="black_id" value="${blackListdetail.id}">
							<input type="submit" value="펫시터 복귀">
					</form>
					
				</div>
			</c:when>	
			<c:otherwise>
				<div style="color:#ff8d00;">
									<table>
						<tr>
							<td> 아이디 : ${blackListdetail.black_id}
							<a href="${pageContext.request.contextPath}/admin/memberdetail?id=${blackListdetail.black_id}">
							| 회원정보 보기
							</a>
							</td>				
						</tr>
						<tr>
							<td> 이름 : ${blackListdetail.black_name}</td>				
						</tr>
							<tr>
							<td> 연락처 : ${blackListdetail.black_phone}</td>									
						</tr>
						<tr>
							<td> 등급 : ${blackListdetail.black_grade}</td>				
						</tr>
						<tr>
							<td> 경고 횟수 : ${blackListdetail.black_count}</td>				
						</tr>		
					</table>		
				
					<h3>※아래와 같은 사유로 경고를 받은 회원입니다</h3>
							<hr>						
							<c:forEach var="blacklistcontent" items="${blacklistcontent}">						
							<!-- 경고받을때 등급 -->
								<h5> 경고 등급 : ${blacklistcontent.black_content_grade} </h5>
							<!-- 경고 사유  -->
								<h5> 경고 내용 : ${blacklistcontent.black_content} </h5>
							<!--  경고 등록일-->
								<h5> 경고 등급 : ${blacklistcontent.getBlackListdateWithFormat()} </h5>
							<hr>		
							</c:forEach>
					
					<!-- 블랙리스트 등록 회원은 삭제 버튼 노출 -->
					<form action="${pageContext.request.contextPath}/admin/member_delete" method="get">			
							<input type="hidden" name="id" value="${blackListdetail.black_id}">				
							<button type="submit" >경고회원 탈퇴</button>						
					</form>	
					<!-- 정상 회원으로 복귀 -->						
					<form action="${pageContext.request.contextPath}/admin/blackList/comebackMember" method="get">
							<input type="hidden" name="black_id" value="${blackListdetail.id}">
							<input type="submit" value="회원 복귀">
					</form>
				</div>
		</c:otherwise>
	</c:choose>			