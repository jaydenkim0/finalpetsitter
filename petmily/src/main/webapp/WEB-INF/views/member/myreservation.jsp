<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
    
    <script>
   	$(document).ready(function(){   
			var reviewis = $(".reservation1").val();
			$.ajax({
					url:'${pageContext.request.contextPath}/board/review/isReview?review_reservation_no='+reviewis,
					type:'get',
					success : function(data){					
						if(data == 1) {
							$(".20").text("완료");										
						}else{							
							$(".20").text("대기");
						}
					}
				});
			});    		
	</script>
    
    <!-- footer css -->
    <link rel="stylesheet" href="${context}/resources/css/footer.css"/>  
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- 아이콘을 사용하기 위해 추가로 불러오는 CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<style>




.page-navigator li{
   display: inline-block;
   margin-left: 10px;
    padding: 5px 10px; 
   font-size:15px;
   font-weight: 600;   
}

.restab {
   width: 72%;
   border-top: 1px solid #444444;
   border-collapse: collapse;
   border-color: #BDBDBD;
}



td{
   
   border-bottom: 1px solid #444444;
   padding: 10px;
   border-color: #BDBDBD;
    padding: 10px;
   text-align: center;
  
}


a {
   text-decoration: none;
   color: black;
}

button{
   display: white;
   width: 70px;
   height: 30px;
   line-height: 20px;
   border: 1px #3399dd solid;
   background-color: white;
   text-align: center;
   font-size: 12px;
   cursor: pointer;
   color: #1482e0;
   transition: all 0.9s, color 0.3;
   
   }

   .button:hover{
   color: white;
   }

   
   .hover:hover{
   background-color: #1482e0;
   }
  




th, td {
   border-bottom: 1px solid #444444;
   padding: 10px;
   text-align: center;
   border-color : #BDBDBD;
}

a {
   text-decoration: none;
   color: #1482e0;
}

a:hover{
   color: black;
}
.right_mar {
   margin-right: 10%;
}



.page-navigator li.active>a {
   color: #1482e0;
}

.btn {
   display: white;
   width: 80px;
   height: 10x;
   line-height: 20px;
   border: 1px #3399dd solid;
   background-color: white;
   text-align: center;
   font-size : 12px;
   cursor: pointer;
   color: #1482e0;
   transition: all 0.9s, color 0.3;
}

.btn:hover {
   color: white;
}

.hover3:hover {
   background-color: #1482e0;
}

.input {
   width: 150px;
   height: 35px;
   font-size: 14px;
   vertical-align:middle; 
   border-color : #BDBDBD;
   border-style: solid;
   border-width: 1px;
   border-radius: 4px;
}

select {
   width: 80px;
   height: 35px;
   font-size: 14px;
   vertical-align:middle; 
   border-color : #BDBDBD;
   border-style: solid;
   border-width: 1px;
   border-radius: 4px;
   }
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
</style>
<!-- header 불러오기  -->
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<section class="section-content">


<div align="center">
<br>
   <h1>예약 조회</h1>
   
   <br>
   <p>리뷰는 결제 후 이용날짜 다음날부터 작성 가능합니다.</p>
   <p>리뷰 작성 시 500p 지급</p>
   <section>
  
  	<!-- 리뷰 작성 및 완료표시 위한내용 --> 

   <table  class="restab">
 

      <tr>
         <td>예약번호</td>
         <td>예약일자</td>
         <td>펫시터</td>
         <td>결제상태</td>
         <td>리뷰작성</td>
      </tr>
      <c:forEach var="reservation" items="${reservation_list }">
         <tr>
	    	
            <td>${reservation.reservation_no }</td>
            <td>${reservation.totalMatchingTime }</td>
            <td>
               <c:choose>
                  <c:when test="${not empty reservation.sitter_id }">
                     ${reservation.sitter_id }
                  </c:when>
                  <c:otherwise>
                     탈퇴회원
                  </c:otherwise>
               </c:choose>               
            </td>
            <td>
               <c:choose>
                  <c:when test="${reservation.pay_status =='완료' }">
                     완료
                  </c:when>
                  <c:when test="${reservation.pay_status =='준비' }">
                     준비
                  </c:when>
                  <c:otherwise>
                     취소
                  </c:otherwise>
                  
               </c:choose>                           
            </td>
            <td>
               <c:choose>
                  <c:when test="${reservation.review_no<1 &&reservation.pay_status =='완료' &&reservation.gap<0}">
                     <a href="${context }/board/review/insert?reservation_no=${reservation.reservation_no}&sitter_id=${reservation.sitter_id}">
                     <button class="button hover">작성</button></a>
                  </c:when>
                  <c:otherwise>
                  	 <input type="hidden" name="review_reservation_no" class="reservation1" value="${reservation.reservation_no}">	
                     <small class="20"></small>
                  </c:otherwise>
               </c:choose>      
               
            </td>
         </tr>
      </c:forEach>
   </table>

<br>

   <!-- 네비게이터(navigator) -->
   <jsp:include page="/WEB-INF/views/member/navigator_myreservation.jsp">
      <jsp:param name="pno" value="${pno}"/>
      <jsp:param name="count" value="${count}"/>
      <jsp:param name="navsize" value="${navsize}"/>
      <jsp:param name="pagesize" value="${pagesize}"/>
      <jsp:param name="care_board_no" value="${care_board_no }"/>
   </jsp:include>

   
</section>
</div>

</section>
   <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>    