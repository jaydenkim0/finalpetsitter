<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="context" value="${pageContext.request.contextPath}"></c:set>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>

<!-- 
기본 CSS
:   index css,
   font css
-->
    <!-- index css -->
    <link rel="stylesheet" href="${context}/resources/css/index.css" />
    <!-- font css -->
    <link rel="stylesheet" href="${context}/resources/css/font.css"/>
    
<!-- 
FULL-PAGE-JS 이용 시 넣어야할 요소 
:   jquery js,
   full-page css,
   full-page js,
   full-page script
-->
   <!-- jquery js -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   
   <!-- full-page css -->
   <link rel="stylesheet" href="${context}/resources/css/fullpage.min.css" />   
   <!-- full-page js -->
   <script src="${context}/resources/js/fullpage.min.js"></script>
    
     
<!-- 
REVIEW 이용 시 넣어야할 요소 
:   jquery js,
   index(안의 review) css, 
   owl-carousel css,
   owl-carousel js,
   owl-carousel script
-->

   <!-- owl-carousel css -->
    <link rel="stylesheet" href="${context}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${context}/resources/css/owl.theme.default.min.css">
   <!-- owl-carousel js -->
    <script src="${context}/resources/js/owl.carousel.min.js"></script>
   <!-- owl-carousel script -->   
    <script>
     $(document).ready(function(){
         var owl = $('.owl-carousel');
         owl.owlCarousel({
             items:4,
             loop:true,
             margin:10,
             autoplay:true,
             autoplayTimeout:4000,
             autoplayHoverPause:true
         });
         $('.play').on('click',function(){
             owl.trigger('play.owl.autoplay',[1000])
         })
         $('.stop').on('click',function(){
             owl.trigger('stop.owl.autoplay')
         })
     });
    </script>     
  
  
<!-- 
HEADER 이용 시 넣어야할 요소 
:   jquery js,
   header css, 
   header script
-->
  <!-- header css -->
  <link rel="stylesheet" href="${context}/resources/css/header.css">
   <!-- header script -->
   <script>
      $(function() {
          $('body').addClass('js');

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
:   jquery js,
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
      function no_image2(){
         $(".noImg").attr("src", "/petmily/resources/img/logo_b_back01.jpg");
      }
   </script>
   
</head>
<body>
     <div id="full-page">
        <div class="section s0">
        
      <!-- header 불러오기 -->
      <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
          
            <h2 id="about">펫밀리란?</h2>
            <h3 id="about">
                ‘당신의 가족이 되어드립니다.’<br>
                   가족 여행을 떠날때, 나의 또다른 가족이 혼자인가요?<br>
                   그렇다면 펫밀리에게 맡겨보세요.<br>
                   <br>
                   전문적인 기술을 가진 신원 보장 펫밀리에게 당신의 가족을 맡겨보세요!                
            </h3><br>
            <a href="petsitter/list"><button id="reservation_btn">펫밀리 예약하기</button></a>
        </div>
        
        <div class="section s1">
            <h2 id="ti">Review</h2>
            <h3 id="co">펫밀리와 함께한 추억들을 공유해요.</h3>
            
           <div class="owl-carousel owl-theme">
           <c:forEach  var="review" items="${list}">
                 <!-- 리뷰 아이템 -->
                        <div class="item">
                            <br>
                            
                            <!-- 프로필 이미지 -->
                             <div>
                                   <img class="img_box" src="${pageContext.request.contextPath }/member/member/image?member_image_no=${review.member_image_no}"  class="noImg"  onerror="no_image2()" > 
                            </div> 
                            
                          <h3 id="nick">${review.review_writer}</h3> 
                            <c:choose>
                              <c:when test="${review.review_star eq 1}">
                                 <img src="${context}/resources/img/1.png" height="15px" style="width: 45px">
                              </c:when>
                              <c:when test="${review.review_star eq 2}">
                                 <img src="${context}/resources/img/2.png"  height="15px" style="width: 45px">
                              </c:when>
                              <c:when test="${review.review_star eq 3}">
                                 <img src="${context}/resources/img/3.png"  height="15px" style="width: 45px" >
                              </c:when>
                          </c:choose>
                          <%--       <span>${review.review_star} 점</span> --%>            
                            <div style="clear: both"></div>
                               
                                
                            <!-- 제목 -->
                            <div class="review_title">
                               <h3>${review.review_title}</h3> 
                            </div>
                            <!-- 내용 -->
                            <p>${review.review_content}</p>                            
                        </div>
            </c:forEach> 
           </div>
          </div>
                         
        
        <div class="section s2">
            <h2>믿고 맡길 수 있는 <br> 
                   펫밀리</h2>
            <h3>꼼꼼한 신원 확인과  자격증 여부 검증과정을 거친 펫밀리와 함께 합니다.</h3>
        </div>
      
            <div class="section s3">
                <h2>소중한 내 아이의<br> 
                       상태를 알 수 있는 1:1 소통</h2>
                    <h3>펫밀리와 1:1 대화로 내 아이의 상태를 확인하세요.</h3>
            </div>

            <div class="section fp-auto-height" id="footer">
               <!-- footer 불러오기 -->
               <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>            
            </div>
    </div>
    
    
      <!-- full-page script -->
    <script>
        new fullpage('#full-page',{
            licenseKey:'',
            sectionsColor:['#f26e41','#f6f6f6','white','white',"gray"],
            navigation: true,
            // navigationTooltips: ['Home','Ahout','Contact','Xtras']
            menu: '.hero',
            scrollingSpeed: 1000,
            onLeave: function(origin, destination, direction){
                if(destination.index==0){
                    $('#masthead').removeClass('color');
                }
                if(destination.index==1){
                    $('#masthead').addClass('color');
                }

                if(origin.index ==2){
                    $('.s2 h2').slideToggle();
                    $('.s2 h3').slideToggle();
                }
                if(origin.index ==3){
                    $('.s3 h2').slideToggle();
                    $('.s3 h3').slideToggle();
                }
            },
            afterLoad: function(origin, destination, direction){
                if(destination.index==0){
                    $('#masthead').removeClass('color');
                }
                
                if(destination.index==1){
                    $('#masthead').addClass('color');
                }
                if(destination.index ==2){
                    $('.s2 h2').slideToggle();
                    $('.s2 h3').slideToggle();
                }
                if(destination.index ==3){
                    $('.s3 h2').slideToggle();
                    $('.s3 h3').slideToggle();
                }
            }
        });
    </script>
</body>
</html>