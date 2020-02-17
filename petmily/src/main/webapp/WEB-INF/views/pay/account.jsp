<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<!--  <!-- Bootstrap CSS -->
<!--     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
<!--     awesome CSS -->
<!--     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous"> -->

<style>
    /*박스 넓이가 멋대로 늘어나는것 방지*/
    * {
        box-sizing: border-box;
    }

    div {
        /* div 자신을 가운데 정렬 */
        margin-left: auto;
        margin-right: auto;
    }

    .pick {
        padding: 0.3rem;
    }

    .class_name {
        padding: 30px;
    }

    .payment {
        display: inline-block;
        width: 170px;
    }



    /*
	다단 스타일(.row-multi)
	- 2단 : .row-multi.column-2
	- 3단 : .row-multi.column-3
	- 4단 : .row-multi.column-4
	- 5단 : .row-multi.column-5
*/
    .row-multi::after {
        content: "";
        display: block;
        clear: both;
    }

    .row-multi>* {
        float: left;
    }

    .row-multi.column-2>* {
        width: 50%;
    }

    /*
	row의 방향 설정
	- 기본값 : center
	- 왼쪽 : row-left
	- 오른쪽 : row-right
*/
    .row,
    .row-left,
    .row-right,
    .row-multi {
        margin: 10px 0px;
    }

    .row {
        text-align: center;
    }

    .row-left {
        text-align: left;
    }

    .row-right {
        text-align: right;
    }
    
   

/*
	Title 스타일 : 제목에는 그라데이션 추가
*/
	.title{
	background: rgb(24,222,137);
	background: black;
/* 	background: linear-gradient(93deg, rgba(249,137,103,1) 0%, rgba(252,158,129,1) 47%, rgba(251,199,183,1) 100%); */
	color:white;
	text-align:left;
    padding: 0rem 1.5rem 0rem 1.5rem;
	}
    
/* 버튼 스타일 */    
  .btn_style1{
    height: 50px;
    line-height: 13px;
    background-color: #D8D8D8 ;
    text-align: center;
    cursor: pointer;
    font-size: 13px;
    padding: 0px 13px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(238, 238, 238);
    border-image: initial;
    border-radius: 5px;
}

    .btn_pay{
    width: 290px;
    height: 50px;
    line-height: normal;
    background-color: #F98967;
    text-align: center;
    cursor: pointer;
    color: white;
    font-size: 14px;
    padding: 0px 13px;
    border-radius: 5px;
    border-style: solid;
    border-width: 1px;    
    }
</style>

<c:choose>
	<c:when test="${sessionScope.id eq null }">
		<a href="${context}/member/login">로그인</a>
	</c:when>
	<c:otherwise>
	${sessionScope.id}님이 로그인 중입니다.
	<a href="${context}/member/logout">로그아웃</a>
	</c:otherwise>
</c:choose>

<div class="w-60, row">
        <div class="row-left">
            <h1>견적 내용</h1>
        </div>
        <hr><hr>
        <div class="row-left">
            <div class="class_name">
                펫시터 이름
            </div>
            <hr>
            <div>
               <ul>
                  <li>
                    옵션1) 선택한 날짜 
                  </li>
                  <li>
                    옵션2) 선택옵션 : 방문 / 위탁
                  </li>
               </ul>                
            </div>
        </div>
        <hr>
        <div class="row-multi column-2">
            <div class="row-left">상품 가격</div>
            <div class="row-right">80,000원</div>
          </div>
          <hr>
          <div class="row-multi column-2">
             <div class="row-left">추가 금액</div>
            <div class="row-right">방문 서비스 : 20,000원</div>
        </div>
        <hr>
        <div class="row-multi column-2 title">
            <div class="row-left">최종 결제 금액</div>
            <div class="row-right">100,000원</div>
        </div>
        <br>
        <div class="row-left" >결제수단</div>
        <hr>
       
        <button class="btn_style1">체크/신용카드</button>
        <button class="btn_style1">핸드폰 결제</button>
        <button class="btn_style1">실시간 계좌이체</button>
        <button class="btn_style1">무통장 입금</button>
         <button class="btn_style1">
         <img src="${context}/resources/img/kakaopay.png"></button>
        <br><br>
<%-- 		<form action="<%=request.getContextPath()%>/board/user_pay.do" method="post"> --%>
<%-- 			<input type="hidden" name="host_content_name" value="<%=host_content_name %>"><!--컨텐츠 제목 --> --%>
<%-- 			<input type="hidden" name="host_name" value="<%=host_name%>"><!--호스트 이름 --> --%>
<%-- 			<input type="hidden" name="host_phone" value="<%=host_phone%>"><!--호스트 폰번호 --> --%>
<%-- 			<input type="hidden" name="host_content_no" value="<%=host_content_no%>"><!-- 호스트 컨텐트 넘버 --> --%>
<%-- 			<input type="hidden" name="host_content_location" value="<%=host_content_location %>"><!--호스트 지역 --> --%>
<%-- 			<input type="hidden" name="host_content_cost" value="<%=host_content_cost %>"> <!--호스트 컨텐츠 가격 --> --%>
<%--         	<input type="hidden" name="ticketing" value="<%=ticketing %>"> --%>
<%--         	<input type="hidden" name="start_date" value="<%=start_date %>"> --%>
        <div>
            <input type="checkbox">개인정보 제 3자 제공 동의, 결제 대행 서비스 이용 약관 등 모든 약관에 동의합니다.
        </div><br>
        <div>
            <input type="submit" value="결제">
        </div>
<!--         </form> -->
    </div>