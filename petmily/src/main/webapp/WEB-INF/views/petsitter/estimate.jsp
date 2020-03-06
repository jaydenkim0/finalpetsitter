<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>    
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>

<!-- 
기본 CSS
:	font css
	estimate css
-->
    <!-- font css -->
    <link rel="stylesheet" href="${context}/resources/css/font.css"/>
    <!-- estimate css -->
    <link rel="stylesheet" href="${context}/resources/css/estimate.css">
     
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
$(function(){
    $("#time_start").change(function(){
        calcurate();
    });
    $("#time_end").change(function(){
        calcurate();
    });
    $("#mt").change(function(){
        calcurate();
    });
    $("#walking").change(function(){
         calcurate();
    }); 
    $("#sick").change(function(){
         calcurate();
    }); 
   $(".skill").change(function(){
     var skillArray = [];

     //체크박스에 체크된 경우
     var skillCheck = $('.skill > input[type=checkbox]:checked');

      //반복해서 데이터를 배열에 저장해라
      $(skillCheck).each(function(i){ //스킬
         skillArray.push($(this).data("skills"));
     });

     $("#skills_text").empty();
         for (var i in skillArray)
         {
             $("<span>").text(skillArray[i]+"/").appendTo("#skills_text");
         }
   });
   $(".type").change(function(){
	   	var carePetTypeArray = [];

	     //체크박스에 체크된 경우
	     var typeCheck = $('.type > input[type=checkbox]:checked');

	      //반복해서 데이터를 배열에 저장해라
	       $(typeCheck).each(function(i){ //동물종류
               carePetTypeArray.push($(this).data("animal"));
           });

	       $("#care_pet_type_text").empty();
           for (var i in carePetTypeArray)
           {
               $("<span>").text(carePetTypeArray[i]+"/").appendTo("#care_pet_type_text");
           }
	   });

 var total;
 function calcurate(){
     var start = $("#time_start option:selected").val();
     var end = $("#time_end option:selected").val();
     var use_time_cal = end-start;
  	
     $("#usage_time").val(use_time_cal);

     //총 시간 * 10.000원
     total = use_time_cal *10000;

     var matching = $("#mt option:selected").text();

     //만약 위탁 서비스가 선택 되어 있다면
     if(matching == "위탁서비스"){
         total +=10000;
     }else{
         total +=20000;
     }
     if($("#walking").is(":checked")){
         total += 10000;
     }
     if($("#sick").is(":checked")){
         total += 20000;
     }
     
     $("#payment").empty();
     $("#payment").append("총 "+total+" 원");
 }
 
//이메일
	$(".estimate1").submit(function(e) {
		// 이벤트 정지
		e.preventDefault();				
		// 버튼 속성 및 내용 변경
		$(".sendemail").prop("disabled", true);
		$(".sendemail").val("견적서 발송중");				
		
		var url = $(this).attr("action"); 
		var method = $(this).attr("method");
		var data = $(this).serialize();
		
			$.ajax({
				url:url,
				type:"post",
				data:data,
				success:function(resp){
					console.log(resp);
					if(resp == "success"){
						alert("견적서 발송 완료");								
						location.href = '${pageContext.request.contextPath}/';
					}
					else{
						alert("견적서 발송 실패");								
						$(".sendemail").prop("disabled", false);
						$(".sendemail").val("견적 요청");
					}
				}
			});
		});					
 });
</script>
    
    
    
<!-- header 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
	
<section class="section-content">    
	<div class="estimate-wrap" align="center">    
		<form class="estimate1" action="estimate" method="post" enctype="multipart/form-data">
	    	<div id="align-left">
			    <h1>펫시터 견적 신청 페이지</h1>
			    <div id="step1">
			        <img src="${context}/resources/img/estimate_step.png" alt="step1">
			    </div>
			    <br><br>
			
				<!-- 펫시터 아이디 -->
					<input type="hidden" name="reservation_sitter_no" value="${reservation_sitter_no}">
					
				<!-- 회원 아이디 -->
					<input type="hidden" name="member_id" value="${id}">
				<!-- 돌봄 종류 -->	
					<div>
			            <label for="mt">돌봄 종류</label><br>
			            <hr>
						<select id="mt" name="payinfo_no">
				            <option value="">돌봄 종류</option>
							<option value="3">방문서비스</option>
							<option value="2">위탁서비스</option>
						</select>
			        </div>
			        
				<br><br>
				<!-- 돌봄 날짜 -->
					<input type="hidden" name="usage_time" id="usage_time">
					<!-- 나중에 달력 api가져오기 -->
					<div>
			            <label>돌봄 예약일시</label><br>
			            <hr>
						<input type="text" name="matching_time" placeholder="날짜">
			        </div>	
			
			        <br><br>
			        <!-- 돌봄 시간 -->
			        <div>
			            <label for="time_start">돌봄 시간</label><br>
			            <hr>
						<select id="time_start" name="start_time" >
				            <option value="">시작 시간</option>
							<option value="6">오전 6시(06:00)</option>
							<option value="7">오전 7시(07:00)</option>
							<option value="8">오전 8시(08:00)</option>
							<option value="9">오전 9시(09:00)</option>
							<option value="10">오전 10시(10:00)</option>
							<option value="11">오전 11시(11:00)</option>
							<option value="12">오후 12시(12:00)</option>
							<option value="13">오후 1시(13:00)</option>
							<option value="14">오후 2시(14:00)</option>
							<option value="15">오후 3시(15:00)</option>
							<option value="16">오후 4시(16:00)</option>
							<option value="17">오후 5시(17:00)</option>
							<option value="18">오후 6시(18:00)</option>
							<option value="19">오후 7시(19:00)</option>
							<option value="20">오후 8시(20:00)</option>
							<option value="21">오후 9시(21:00)</option>
							<option value="22">오후 10시(22:00)</option>
						</select>
				
						<select id="time_end" name="end_time">
				            <option value="">끝나는 시간</option>
							<option value="6">오전 6시(06:00)</option>
							<option value="7">오전 7시(07:00)</option>
							<option value="8">오전 8시(08:00)</option>
							<option value="9">오전 9시(09:00)</option>
							<option value="10">오전 10시(10:00)</option>
							<option value="11">오전 11시(11:00)</option>
							<option value="12">오후 12시(12:00)</option>
							<option value="13">오후 1시(13:00)</option>
							<option value="14">오후 2시(14:00)</option>
							<option value="15">오후 3시(15:00)</option>
							<option value="16">오후 4시(16:00)</option>
							<option value="17">오후 5시(17:00)</option>
							<option value="18">오후 6시(18:00)</option>
							<option value="19">오후 7시(19:00)</option>
							<option value="20">오후 8시(20:00)</option>
							<option value="21">오후 9시(21:00)</option>
							<option value="22">오후 10시(22:00)</option>
						</select>
				    </div>
			    
			    <br><br>
				<!-- 이용할 스킬 -->	
				    <div class="skill">
			            <label id="large-text">돌봄 시 이용할 스킬</label><br>
			            <hr>
				        <input type="checkbox" id="sick" value="5" name="payinfo_no" data-skills="투약">
				        <label for="sick">투약</label>
				        
				        <input type="checkbox" id="old" value="6" name="payinfo_no" data-skills="노령견테어">
				        <label for="old">노령견케어</label>
				        
				        <input type="checkbox" id="kitten" value="7" name="payinfo_no" data-skills="키튼케어">
				        <label for="kitten" >키튼케어</label>
				        
				        <input type="checkbox" id="walking"  value="4" name="payinfo_no" data-skills="도그워킹">
				        <label for="walking" >도그워킹</label>
				        
				        <div id="skills_text"></div>
			        </div>
			        
			    <br><br>
				<!-- 이용할 동물 종류 -->
				    <div class="type">
			            <label id="large-text">돌봄 반려동물 종류</label><br>
			            <hr>
				        <input type="checkbox" id="dog" value="1" name="care_name" data-animal="강아지">
				        <label for="dog">강아지</label>
				        
				        <input type="checkbox" id="cat" value="2" name="care_name" data-animal="고양이">
				        <label for="cat">고양이</label>
				        
				        <input type="checkbox" id="fish"  value="3" name="care_name" data-animal="물고기">
				        <label for="fish">물고기</label>
				        
				        <input type="checkbox" id="rabbit"  value="4" name="care_name" data-animal="토끼">
				        <label for="rabbit">토끼</label>
				        
				        <input type="checkbox" id="hamster" value="5" name="care_name" data-animal="햄스터">
				        <label for="hamster">햄스터</label>
				        
				        <input type="checkbox" id="reptiles" value="6" name="care_name" data-animal="파충류">
				        <label for="reptiles">파충류</label>        
				        
				        <div id="care_pet_type_text"></div>
				    </div><br>
				
				    <div id="payment"></div><br>
				    
				    <br><br>
				    <!-- 회원 반려동물 정보 -->
				    <div>
			        <span id="large-text">반려동물 정보</span><br>
			        <span id="medium-text">*회원 ${id}님의 반려 동물 정보가 맞습니까?</span>
			        <hr>    
					<c:forEach var="petDto" items="${petList}">
					<input type="hidden" name="pet_name" value="${petDto.name}">
						<span>반려 동물 이름 : ${petDto.name}</span><br>
						<span>반려 동물 나이 : ${petDto.age}</span><br>
						<span>반려 동물 종류 : ${petDto.type}</span><br>
						<span>반려 동물 기타 : ${petDto.ect}</span><br>
					</c:forEach>    
				    
				    <br><br>
			        <label for="ect" id="large-text">특이사항</label><br>
			        <hr>
				    <textarea rows="10" cols="110" id="ect" name="ect" style="resize: vertical;"></textarea>
				    </div>
			    </div>
		        <br><br>
		        
			<div align="center">
				<input id="send_btn" class="sendemail" type="submit" value="견적 요청">
			</div>
	    </form>
	</div>
</section>

	<br><br>
	<!-- footer 불러오기 -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>   