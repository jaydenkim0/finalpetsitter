<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set> 

   <!-- 헤더 시작 -->
            <div class="hero">
                <header id="masthead" role="banner">
                  <div class="container">
                  
            <!-- 상단바 펼치기 버튼 -->
                    <button class="hamburger hamburger--boring" type="button">
                      <span class="hamburger-box">
                        <span class="hamburger-inner"></span>
                      </span>
                     <span class="hamburger-label">PETMILY</span>
                    </button>
                    
            <!-- 검색 -->
                  <form id="masthead-search" method="post" action="${pageContext.request.contextPath}/petsitter/searchlist">
                  	  <input type="hidden" name="searchOption" value="nick">
                      <input type="search" name="keyword" aria-labelledby="search-label" placeholder="| 펫밀리 찾기" class="draw">
                      <button type="submit">&rarr;</button>
                  </form>  
            
            <!-- 로그인 -->
            <div id="masthead-login">
                <c:choose>
	                <c:when test="${empty id}">
	                	<button id="login_btn"><a href="${context}/member/login">로그인</a></button>                
	                	<button id="login_btn"><a href="${context}">HOME</a></button>           
	                </c:when>
					<c:otherwise>
					   <!-- 프로필 이미지 -->
		                <div class="img_box" style="background: #f5f5f5">
		                    <img class="profile" src="${context}/resources/img/logo_b_back01.jpg" alt="프로필 이미지"> 
		                </div>
		
		                <!-- 회원 닉네임 -->
		                <a id="member" href="${context}/member/mypage">${id}</a>
		                <a id="member" href="${context}" style="margin-left:8px;">HOME</a>
					</c:otherwise>
                </c:choose>
            </div>
                    
            <!-- 네비게이션 시작 -->
                    <nav id="site-nav" role="navigation">	                     
                    <c:choose>
                    	<c:when test="${grade!='petsitter'}">
                    		<div class="col">
		                       <h4>펫밀리 지원</h4>
		                       <ul>
		                         <li><a href="${context}/petsitter/regist">펫밀리를 지원해보세요.</a></li>
		                       </ul>            
		                     </div>
                    	</c:when>
                    	
                    	<c:otherwise>
                    		<div class="col">
		                       <h4>펫밀리 정보</h4>
		                       <ul>
		                         <li><a href="${context}/petsitter/info">펫밀리 정보를 조회해보세요.</a></li>
		                         <li><a href="${context}/petsitter/reservation">펫밀리 예약 정보를 조회해보세요.</a></li>
		                       </ul>            
		                     </div>
                    	</c:otherwise>
                    </c:choose>
           	
                      <div class="col">
                        <h4>펫밀리 토크</h4>
                        <ul>
                          <li><a href="${context}/board/care/list">펫밀리와 대화 해보세요.</a></li>
                        </ul> 
                      </div>
                      
                      <div class="col">
                        <h4>펫밀리 둘러보기</h4>
                        <ul>
                          <li><a href="${context}/petsitter/list">펫밀리를 찾아보세요.</a></li>
                        </ul>             
                      </div>
                      
                      <div class="col">
                        <h4>게시판</h4>
                        <ul>
                          <li><a href="${context}/board/faq/list">공지사항</a></li>
                          <li><a href="${context}/board/qna/list">문의사항</a></li>
                          <li><a href="${context}/board/stray/list">세이브더 펫</a></li>
                        </ul>               
                      </div>
                      
                      <c:if test="${grade=='admin'}">
	                      <div class="col">
	                        <h4>관리자</h4>
	                        <ul>
	                          <li><a href="${context}/admin/">관리자</a></li>
	                          <li><a href="${context}/admin/list/reservationstatus">예약 현황</a></li>
	                          <li><a href="${context}/admin/account">정산 관리</a></li>
	                          <li><a href="${context}/board/review/list">리뷰 관리</a></li>
	                          <li><a href="${context}/admin/list/member">회원 관리</a></li>
	                          <li><a href="${context}/admin/petsitter">펫시터 (모아보기)</a></li>
	                          <li><a href="${context}/admin/list/petsitter">펫시터 관리</a></li>
	                          <li><a href="${context}/admin/list/petsitterapply">펫시터 신청</a></li>
	                          <li><a href="${context}/adminlist/petsittersleep">펫시터 휴면</a></li>
                         	  <li><a href="${context}/admin/blackList">경고 게시판</a></li>	                                
	                        </ul>               
	                      </div>
					</c:if>
					
						<c:if test="${not empty id}">
						<div class="col">
						  <h4></h4>
						  <ul>
						    <li><a href="${context}/member/logout">로그아웃</a></li>
						  </ul>               
						</div>
					</c:if>
					
                  </nav>
                </div>
              </header>
            </div>