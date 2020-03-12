<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- 
기본 CSS
:	font css
	info css
	slider css
-->
    <!-- font css -->
    <link rel="stylesheet" href="${context}/resources/css/font.css"/>
    <!-- info css -->
    <link rel="stylesheet" href="${context}/resources/css/info.css">
    <!-- slider css -->
	<link rel="stylesheet" href="${context}/resources/css/slider.css">

	<!-- slider -->
	<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
	<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
	
	<script src="https://unpkg.com/swiper/js/swiper.js"></script>
	<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
  

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

	<script>
		function no_image2(){
			$("#pet_image").attr("src", "/petmily/resources/img/기본프로필.jpeg");
		}
	</script>

<!-- header 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
	
<section class="section-content">
<div class="info-wrap">
	<!-- 소개 이미지 출력 -->
		<!-- Swiper -->
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<c:forEach var="sitterinfoimg" items="${sitterInfoimageList}">
						<div class="swiper-slide">
			             	<img src="${pageContext.request.contextPath}/admin/petsitter/sitterInfoimage?info_image_no=${sitterinfoimg.info_image_no}"> 
						</div>
			        </c:forEach>
				</div>
				<!-- Add Pagination -->
				<div class="swiper-pagination"></div>
			</div>
	
	<!-- 펫시터 정보 -->
	<c:forEach var="petsitterGetList" items="${petsitterList}">
		<div class="petsitter-info">
			<c:forEach var="petsitter" items="${petsitterGetList.petsitterVO}"><br>		
				<!-- 펫시터 번호 변수 등록 -->
				<c:set var="pet_sitter_no" value="${petsitter.pet_sitter_no}"></c:set>
				<!-- 펫시터 상태 변수 등록 -->
				<c:set var="sitter_status" value="${petsitter.sitter_status}"></c:set>		
<%-- 					<span>펫시터 번호 : ${petsitter.pet_sitter_no}</span><br> --%>
					<span>아이디 : ${petsitter.sitter_id}</span><br>
					<span>닉네임 : ${petsitter.nick}</span><br>
					<span>이름 : ${petsitter.name}</span><br>	
					<span>이메일 : ${petsitter.email}</span><br>	
					<span>핸드폰 : ${petsitter.phone}</span><br>	
					<span>주소 : ${petsitter.total_addr}</span><br>	
					<span>포인트 : ${petsitter.point}</span><br>	
					<span>반려동물 여부 : ${petsitter.pets}</span><br>	
					<span>가입일 : ${petsitter.petsitterdateWithFormat}</span><br>
					<div class="naver-viewer"></div> 
					<input type="hidden" value="${petsitter.info}"><br>
					<span>반려동물 경험 여부 : ${petsitter.sitter_pets}</span><br>
					<span>상태 : ${petsitter.sitter_status}</span><br>
					<span>은행 및 계좌 : ${petsitter.total_account}</span><br><br>
			</c:forEach>
		</div>
		
		<br><br>
	<div class="petsitter-skill-wrap">
		<!-- 펫시터 매칭 정보 -->				
		<h5 id="large-text">펫밀리 가능한 돌봄 서비스 종류</h5>
		<hr>
		<c:forEach var="petsitter" items="${petsitterGetList.petsitterVO}" >
	<%-- 						<span>매칭 종류 : ${petsitter.sitter_matching_type}</span> --%>
									
			<c:if test="${petsitter.sitter_matching_type eq '방문서비스'}">
					<img src="${context}/resources/img/petsitter-skill-icon/visit.png" alt="방문서비스">
					<img src="${context}/resources/img/petsitter-skill-icon/no-leave.png" alt="위탁서비스 안함">
					<br>
					<span id="visit-text">방문서비스</span>
					<span id="leave-text">위탁서비스</span>
			</c:if>
			<c:if test="${petsitter.sitter_matching_type eq '위탁서비스'}">
					<img src="${context}/resources/img/petsitter-skill-icon/no-visit.png" alt="방문서비스 안함">
					<img src="${context}/resources/img/petsitter-skill-icon/leave.png" alt="위탁서비스">
					<br>
					<span id="visit-text">방문서비스</span>
					<span id="leave-text">위탁서비스</span>
			</c:if>
			<c:if test="${petsitter.sitter_matching_type eq '둘다'}">
					<img src="${context}/resources/img/petsitter-skill-icon/visit.png" alt="방문서비스">
					<img src="${context}/resources/img/petsitter-skill-icon/leave.png" alt="위탁서비스">
					<br>
					<span id="visit-text">방문서비스</span>
					<span id="leave-text">위탁서비스</span>
			</c:if>
		</c:forEach>			
		
		
		<br><br>
		<!-- 펫시터 능력 정보 -->
		<h5 id="large-text">펫밀리 가능한 돌봄 서비스</h5>
		<hr>
		<div class="skill-align">
		<c:forEach var="skillName" items="${petsitterGetList.skillNameDto}">						
			<c:if test="${skillName.skill_name eq '투약'}">
				<div id="skill-item">
					<img src="${context}/resources/img/petsitter-skill-icon/inject.png" alt="투약서비스">
					<h5 id="medium-text">투약 서비스</h5>
				</div>
			</c:if>
			
			<c:if test="${skillName.skill_name eq '도그워킹'}">
				<div id="skill-item">
					<img src="${context}/resources/img/petsitter-skill-icon/dogwalking.png" alt="도그워킹서비스">
					<h5 id="medium-text">도그워킹</h5>
				</div>
			</c:if>
			
			<c:if test="${skillName.skill_name eq '키튼케어'}">
				<div id="skill-item">
					<img src="${context}/resources/img/petsitter-skill-icon/kitten.png" alt="키튼케어서비스">
					<h5 id="medium-text">키튼케어 서비스</h5>
				</div>
			</c:if>
			
			<c:if test="${skillName.skill_name eq '퍼피케어'}">
				<div id="skill-item">
					<img src="${context}/resources/img/petsitter-skill-icon/puppy.png" alt="퍼피케어서비스">
					<h5 id="medium-text">퍼피케어 서비스</h5>
				</div>
			</c:if>
			
			<c:if test="${skillName.skill_name eq '노령동물케어'}">
				<div id="skill-item">
					<img id="no-old" src="${context}/resources/img/petsitter-skill-icon/old.png" alt="노령동물케어서비스">
					<h5 id="medium-text">노령동물케어 서비스</h5>
				</div>
			</c:if>						
		</c:forEach>
		</div>
		
		<br><br>
		<!-- 펫시터 돌봄 환경 -->
		<h5 id="large-text">펫밀리 돌봄 환경</h5>
		<hr>
		<c:forEach var="careConditionName" items="${petsitterGetList.careConditionNameDto}">
			<span class="text-box">#${careConditionName.care_condition_name}</span>
		</c:forEach>
		
		
		<br><br>
		<!-- 펫시터 돌봄 가능한 동물 -->
		<h5 id="large-text">펫밀리 돌봄 가능한 동물 종류</h5>
		<hr>
		<c:forEach var="carePetTypeName" items="${petsitterGetList.carePetTypeNameDto}">
			<span class="text-box">#${carePetTypeName.care_type}</span>
		</c:forEach>

		<br><br>		
		<!-- 펫시터 지역 정보 -->
		<h5 id="large-text">펫밀리 활동 지역</h5>
		<hr>
		<div class="location-wrap">
			<c:forEach var="location" items="${petsitterGetList.locationDto}">
					<span id="petsitter_city">#${location.city} ${location.area}</span>		
			</c:forEach>
		</div>
	</div>

	<br><br>
	<!-- 펫시터 반려동물 정보 -->
	<div class="petsitter-pet-wrap">
		<h5 id="large-text">펫밀리  반려동물 정보</h5>
		<hr>
		<c:forEach var="petsitter" items="${petsitterGetList.petsitterVO}">
			<c:if test="${petsitter.pets eq '아니오'}">
				<span id="medium-text">등록된 반려동물이 없습니다.</span>
				<br>
			</c:if>
		</c:forEach>
		
		<c:forEach var="petsitterPets" items="${petsitterGetList.petsitterPetsVO}">
			<c:if test="${petsitterPets.pets eq '예'}">
				<c:if test="${petsitterPets.pet_no > 0}">
					<div>
					<img class="img_box" src="${pageContext.request.contextPath}/petsitter/pet/image?pet_no=${petsitterPets.pet_no}" onerror="no_image()" id="pet_image">
		            </div>
				</c:if>
				<span>반려동물 이름 : ${petsitterPets.pet_name}</span><br>
				<span>반려동물 나이 : ${petsitterPets.pet_age}</span><br>
				<span>반려동물 종류 : ${petsitterPets.pet_type}</span><br>
				<span>반려동물 기타 : ${petsitterPets.pet_ect}</span><br><br>
			</c:if>				
		</c:forEach>
	</div>
	</c:forEach>
	
	
	<br><br><br>
	<form action="info" method="post">
	<input type="hidden" name="pet_sitter_no" value="${pet_sitter_no}"> 
	<!-- 펫시터 상태 변경 (휴면 -> 정상 / 정상 -> 휴면) -->
		<c:choose >
			<c:when test="${black_petsitter_count > 0}">
						<h4 style="color: red;">펫시터 경고를 받아 휴면 상태 조정이 불가합니다</h4>
						<h4 style="color: red;">자세한 내용은 문의 게시판 및 상담센터로 연락 부탁드립니다</h4>
			</c:when>
			<c:otherwise>
						<c:choose>	
						<c:when test="${sitter_status eq '휴면'}">
						<button id="rest_btn" name="sitter_status" value="정상">휴면 해제</button>
						</c:when>
						
						<c:otherwise>
						<button id="rest_btn" name="sitter_status" value="휴면">휴면 신청</button>
						</c:otherwise>
					</c:choose>
			</c:otherwise>
		</c:choose>	
	</form>
	
	<a href="update?pet_sitter_no=${pet_sitter_no}"><button id="updateInfo_btn">정보 수정</button></a>
</div>


			<!-- Swiper JS -->
			<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
	
			<!-- Initialize Swiper -->
			<script>
			var swiper = new Swiper('.swiper-container', {
				pagination: {
				el: '.swiper-pagination',
				},
			});
			</script>

</section>
	<br><br>
	<!-- footer 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>    
