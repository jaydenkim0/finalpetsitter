<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- jquery js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


<!-- 
HEADER 이용 시 넣어야할 요소 
:	jquery js,
	header css, 
	header script
-->
  <!-- header css -->
  <link rel="stylesheet" href="${context}/resources/css/header.css">
   <!-- header script -->
   <script>
      $(function() {
          $('body').addClass('js');
          $('#masthead').addClass('color');
          
          var $hamburger = $('.hamburger'),
              $nav = $('#site-nav'),
              $masthead = $('#masthead');

          $hamburger.click(function() {
            $(this).toggleClass('is-active');
            $nav.toggleClass('is-active');
            $masthead.toggleClass('is-active');
            return false; 
          })
      });
    </script>

	

<!-- 
FOOTER 이용 시 넣어야할 요소 
:	jquery js,
	footer css, 
	Required meta tags, 
	Bootstrap CSS,
	아이콘을 사용하기 위해 추가로 불러오는 CSS
-->
  	<!-- footer css -->
    <link rel="stylesheet" href="${context}/resources/css/footer.css"/>  
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- 아이콘을 사용하기 위해 추가로 불러오는 CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
 
 <script>
       $(function(){
    	   $('input[name=account]').bind('click',function() {
    		    $('input[name=account]').not(this).prop("checked", false);
    		  });
    	   
            $("input[name=agree]").change(function(){
            	
                if($(this).prop("checked")){
                    $("#submit").prop("disabled", false)
                                                .text("결제");
                }
                else{
                    $("#submit").prop("disabled", true)
                                                .text("약관에 동의해주세요.");
                }
            });
        });
    </script>


<style>
.page-navigator li {
	display: inline-block;
}

.notice_table {
	width: 90%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	border-color: #BDBDBD;
	margin-left: auto;
	margin-right: auto;
}
.account_table {
	width: 90%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	border-color: transparent;
	margin-left: auto;
	margin-right: auto;
}


th {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
	font-size: 15px;
	border-color: #BDBDBD;
}
td {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
	font-size: 12px;
	border-color: #BDBDBD;
}

a {
	text-decoration: none;
	color: black;
}

.right_mar {
	margin-right: 10%;
}

.page-navigator li {
	display: inline-block;
}

.page-navigator li.active>a {
	color: #1482e0;
}

.btn {
	display: white;
	width: 150px;
	height: 10x;
	line-height: 20px;
	border: 1px #3399dd solid;
	background-color: white;
	text-align: center;
	font-size: 12px;
	cursor: pointer;
	color: #1482e0;
	transition: all 0.9s, color 0.3;
	margin-left: auto;
	margin-right: auto;
}

.btn:hover {
	color: white;
}

.hover3:hover {
	background-color: #1482e0;
}
.hover1:hover {
	background-color: #1482e0;
}
.check1{
	width: 20px;
	height: 20px;
	font-size: 15px;
	vertical-align: middle;
	border-color: #BDBDBD;
	border-style: solid;
	border-width: 1px;
	border-radius: 4px;
}
.pay{
	width: 15px;
	height: 15px;
	font-size: 15px;
	vertical-align: middle;
	border-color: #BDBDBD;
	border-style: solid;
	border-width: 1px;
	border-radius: 4px;
}
select {
	width: 80px;
	height: 35px;
	font-size: 14px;
	vertical-align: middle;
	border-color: #BDBDBD;
	border-style: solid;
	border-width: 1px;
	border-radius: 4px;
}
<!-- header style -->
#masthead:after {
	  content: '';
	  position: absolute;
	  top: 0;
	  width: 100%;
	  height: 130px;
	  background-color: #fff;
	  opacity: 100;
	  transition: opacity 0.3s ease;
	}
	
	#masthead.is-active{
	 background-color: #fff;
	}
	
	.section-content{
	padding-top:150px;
	}
	.section-content::after{
		content:"";
		display:block;
		clear:both;
	}
	</style>


<!-- header 불러오기 -->
		<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
  
<section class="section-content">
	<h1 align="center">Check Please !</h1>
<div style="float: left; width: 20%;">
 <img src="${context}/resources/img/board.png"  align="right" width="60%" height="20%"> 
</div>
<div style="float: left; width: 70%;">
<form action=account method="post">
	<input type="hidden" name="member_id" value="${sessionScope.id}">
	<input type="hidden" name="reservation_no" value="${param.reservation_no}">
	
	<section>
	<hr>
	<table class="notice_table" >
		<tr>
			<th>예약 번호</th>
			<th>예약 날짜</th>
			<th>예약 회원</th>
			<th>펫시터번호</th>
			<c:forEach var="skill" items="${reservationList.list}">
				<th>예약 스킬</th>
			</c:forEach>
			<th>예약 시작 시간</th>
			<th>이용 시간</th>
		</tr>
		<tr>
			<td><input type="hidden" name="partner_order_id"
				value="${reservationList.reservation_no}" readonly>
				${reservationList.reservation_no}</td>
			<td>${reservationList.matching_time}</td>
			<td><input type="hidden" name="partner_user_id"
				value="${reservationList.member_id}" readonly>
				${reservationList.member_id}</td>
			<td><input type="hidden" name="item_name"
				value="${reservationList.reservation_sitter_no}" readonly>
				${reservationList.reservation_sitter_no}</td>
			<c:forEach var="skill" items="${reservationList.list}">
				<td>${skill.payname}</td>
			</c:forEach>
			<td>${startTime}시</td>
			<td><input type="hidden" name="quantity" value="${usageTime}"
				readonly> ${usageTime}시간</td>
	</tr>
	</table>
	
	<table class="account_table" >
	<tr>
	<th>Total</th>
	</tr>
	<tr>
			<td>
			<h4>
			<input type="hidden" name="total_amount" value="${payMent}"
				readonly> ${payMent}원</h4>
			</td>
		</tr>
	</table>
	<br>
	<div>
	<div align="center" onclick="pay()" name="account">
	       	  <input type="checkbox"  id="check1" name="account">&nbsp;체크/신용카드&nbsp;
	          <input type="checkbox"  id="check1" name="account">&nbsp;핸드폰 결제&nbsp;
	          <input type="checkbox"  id="check1" name="account">&nbsp;실시간 계좌이체&nbsp;
	 	      <input type="checkbox"  id="check1" name="account">&nbsp;무통장 입금&nbsp;
	          <input type="checkbox"  id="check1" name="account">&nbsp;카카오페이
	        <br>
	</div>
	<hr>
	<div>
	<div align="center">
		<input type="checkbox" id="pay" name="agree">
		<label name="agree">개인정보 제 3자 제공 동의, 결제 대행 서비스 이용 약관 등 모든 약관에 동의합니다.</label>
	</div>
	<hr>
	<div align="center">
		<button id="submit" disabled class="btn hover3">약관에 동의해주세요.</button>
	</div>
</div>
</div>
</section>
</form>

<br>
</div>

</section>


      <!-- footer 불러오기 -->
     <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>            