<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
   
<!-- 에디터와 동일한 의존성 라이브러리 설정을 한다 -->
    <!-- naver toast ui editor를 쓰기 위해 필요한 준비물 -->
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/css/codemirror.min.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/css/github.min.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/css/tui-color-picker.min.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/dist/tui-editor.min.css">
    <link rel="stylesheet" type="text/css" href="${context}/resources/lib/toast/dist/tui-editor-contents.min.css">

    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="${context}/resources/lib/toast/dist/tui-editor-Editor-full.min.js"></script>

	<!-- 네이버 에디터 영역 -->
   <script>        
        $(function(){
            var options = {
                //el(element) : 에디터가 될 영역
                el:document.querySelector(".naver-viewer"),
                
                viewer:true,

                //height : 생성될 에디터의 높이
                height:'auto',
            };

            var viewer = tui.Editor.factory(options);

            //생성된 뷰어에 초기값 표시
            console.log(document.querySelector(".naver-viewer + input[type=hidden]"));
            var text = document.querySelector(".naver-viewer + input[type=hidden]").value;
            viewer.setValue(text);//값 설정
        });
    </script>
<!-- 네이버 에디터 영역 종료 -->

    <script src="https://cdn.jsdelivr.net/gh/hiphop5782/js/star/hakademy-star.min.js"></script>
    <script>
        window.addEventListener("load", function(){
        	Hakademy.PointManager.factory(".star-wrap");
        });
    </script>

<!-- 
기본 CSS
:	font css
-->
    <!-- font css -->
    <link rel="stylesheet" href="${context}/resources/css/font.css"/>
    <!-- content css -->
    <link rel="stylesheet" href="${context}/resources/css/content.css">
    <!-- slider css -->
	<link rel="stylesheet" href="${context}/resources/css/slider.css">

	<!-- slider -->
	<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
	<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
	
	<script src="https://unpkg.com/swiper/js/swiper.js"></script>
	<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
  
	<!-- Link Swiper's CSS -->
<!-- 	<link rel="stylesheet" href="../package/css/swiper.min.css"> -->
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
    <!-- header style -->
    <style>
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
    
  
	<!-- header 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
	
<section class="section-content">
	<div class="content-wrap">	
			
		<!-- 소개 이미지 출력 -->
		<!-- Swiper -->
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<c:forEach var="sitterinfoimg" items="${sitterInfoimageList}">
						<div class="swiper-slide"><img src="${pageContext.request.contextPath}/admin/petsitter/sitterInfoimage?info_image_no=${sitterinfoimg.info_image_no}"></div>
					</c:forEach>
				</div>
				<!-- Add Pagination -->
				<div class="swiper-pagination"></div>
			</div>
	
		
			<!-- 펫시터 정보 출력 -->
			<c:forEach var="petsitterGetList" items="${petsitterList}">
			
				<!-- 펫시터 정보 -->
				<div class="petsitter-info">
				<c:forEach var="petsitter" items="${petsitterGetList.petsitterVO}" >
	
					<!-- 펫시터 견적 신청 버튼 -->
					<c:choose>
						<c:when test="${petscheck == 0}">
							<div align="center" id="pet-check">
								<span>
									등록하신 펫 정보가 없습니다.<br>
									펫이 등록되어 있어야 펫시터에게 견적요청이 가능합니다.<br>
									펫을 등록하신후에 견적요청을 진행해 주시기 바랍니다.
								</span> 
							</div><br>
						</c:when>
						<c:otherwise>
							<div class="estimate-wrap">
								<a href="estimate?pet_sitter_no=${petsitter.pet_sitter_no}"><button id="estimate-btn">돌봄 신청</button></a><br><br>
							</div>
						</c:otherwise>			
					</c:choose>
					
					<span id="nick">${petsitter.nick}</span>
					<div class="star-wrap" data-limit="3" data-unitsize="40" data-point="${reviewstar}" data-image="http://www.sysout.co.kr/file/image/288" data-readonly></div>
					<span id="star"><fmt:formatNumber value="${reviewstar}" pattern=".00"/></span>
					<br>
					
					<div class="naver-viewer"></div> 
					<input type="hidden" value="${petsitter.info}">
				</c:forEach>
				</div>
	
				<br><br>
				<!-- 펫시터 지역 정보 -->
				<c:forEach var="location" items="${petsitterGetList.locationDto}">
					<span id="petsitter_city">#${location.city} ${location.area}</span>		
				</c:forEach>
				<br><br>
				
				
				<!-- 펫시터 매칭 정보 -->
				<c:forEach var="petsitter" items="${petsitterGetList.petsitterVO}" ></c:forEach>
					<span>매칭 종류 : ${petsitter.sitter_matching_type}</span>
					<br>
				</c:forEach>
	
				
				<!-- 펫시터 능력 정보 -->
				<c:forEach var="skillName" items="${petsitterGetList.skillNameDto}">
					<span>보유 스킬 : ${skillName.skill_name}</span>
					<br>
				</c:forEach>
				
				<c:forEach var="careConditionName" items="${petsitterGetList.careConditionNameDto}">
					<span>돌봄 환경 : ${careConditionName.care_condition_name}</span>
					<br>
				</c:forEach>
				
				<c:forEach var="carePetTypeName" items="${petsitterGetList.carePetTypeNameDto}">
					<span>돌봄 가능한 동물 : ${carePetTypeName.care_type}</span>
					<br>
				</c:forEach>
				
				<!-- 펫시터 반려동물 정보 -->
				<c:forEach var="petsitterPets" items="${petsitterGetList.petsitterPetsVO}">
					<c:if test="${petsitterPets.pets eq '예'}">
						<span>반려동물 이름 : ${petsitterPets.pet_name}</span>
						<br>
						<span>반려동물 나이 : ${petsitterPets.pet_age}</span>
						<br><br>
					</c:if>
				</c:forEach>
			
	
			<!-- 펫시터 리뷰 목록 -->
			<div class="review-wrap">
				<c:choose>
					<c:when test="${list.size() > 0}">		
						<h3>펫밀리 리뷰</h3>	
						<c:forEach var="reviewDto" items="${list}">
							
							<div class="img_box" style="background: #f5f5f5">
								<img class="profile" src="${pageContext.request.contextPath }/member/member/image?member_image_no=${member_image_no}" onerror="no_image2()" id="2" > 
							</div>
	
							<span id="writer">${reviewDto.review_writer}</span>
							<span id="star-under">${reviewDto.review_star}</span>
							<span id="write-date">${reviewDto.review_wdate}</span>
							<br>
							<span id="title">${reviewDto.review_title}</span>
							<br>
							<span id="content">${reviewDto.review_content}</span>
							
						</c:forEach>
					</c:when>
					
					<c:otherwise>
						<div align="center">
							<br><br><br>
							<h3>리뷰가 없습니다.</h3>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
	
	
			<!-- Swiper JS -->
			<script src="swiper.min.js"></script>
	
			<!-- Initialize Swiper -->
			<script>
			var swiper = new Swiper('.swiper-container', {
				pagination: {
				el: '.swiper-pagination',
				},
			});
			</script>
		</div>
</section>
<br><br>
	<!-- footer 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>  
