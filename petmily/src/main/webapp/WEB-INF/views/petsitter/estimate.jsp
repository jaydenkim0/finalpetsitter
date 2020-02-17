<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>    
<script>
	 $(function(){
		//다중 선택 출력 스크립트 		 
         $("input[type=checkbox]").change(function() {
             //배열 선언
             var skillArray = [];
             var carePetTypeArray = [];
             var careConditionArray = [];

             //체크박스에 체크된 경우
             var skillCheck = $('.skill > input[type=checkbox]:checked');
             var typeCheck = $('.type > input[type=checkbox]:checked');
             var conditionCheck = $('.condition > input[type=checkbox]:checked');

             //반복해서 데이터를 배열에 저장해라
             $(skillCheck).each(function(i){ //스킬
                 skillArray.push($(this).data("skills"));
             });

             $(typeCheck).each(function(i){ //동물종류
                 carePetTypeArray.push($(this).data("animal"));
             });

             $(conditionCheck).each(function(i){ //돌봄환경
                 careConditionArray.push($(this).data("condition"));
             });

                 $("#skills_text").empty();
                 for (var i in skillArray)
                 {
                     $("<span>").text(skillArray[i]+"/").appendTo("#skills_text");
                 }
  
                 $("#care_pet_type_text").empty();
                 for (var i in carePetTypeArray)
                 {
                     $("<span>").text(carePetTypeArray[i]+"/").appendTo("#care_pet_type_text");
                 }

                 $("#care_condition_text").empty();
                 for (var i in careConditionArray)
                 {
                     $("<span>").text(careConditionArray[i]+"/").appendTo("#care_condition_text");
                 }               
         });
    });  
	</script>
    
<h1>펫시터 견적 신청 페이지</h1>
<form action="estimate" method="post" enctype="multipart/form-data">

<!-- 회원 아이디 -->
	<input type="hidden" name="sitter_id" value="${id}">
	<h1>${id}</h1>
	
<!-- 매칭(돌봄) 종류 -->
	<div>
		<label for="mt">가능한 돌봄 종류</label>
		<select id="mt" name="sitter_matching_type">
			<option>방문서비스</option>
			<option>위탁서비스</option>
		</select>
	</div>
	
<!-- 돌봄 시간 -->
	<div>
		<label for="time">돌봄 시작 시간</label>
		<select id="time" name="usage_time_start">
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
	
	<div>
		<label for="time">돌봄 끝나는 시간</label>
		<select id="time" name="usage_time_start">
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
	

	
<!-- 스킬 -->
	<div class="skill">
        <input type="checkbox" id="sick" value="1" name="skills_name" data-skills="투약">
        <label for="sick" id="nameTo1">투약</label>
        
        <input type="checkbox" id="old" value="2" name="skills_name" data-skills="노령견테어">
        <label for="old" id="nameTo2">노령견케어</label>
        
        <input type="checkbox" id="kitten"  value="3" name="skills_name" data-skills="키튼케어">
        <label for="kitten" id="nameTo3">키튼케어</label>
        
        <input type="checkbox" id="walking"  value="4" name="skills_name" data-skills="도그워킹">
        <label for="walking" id="nameTo4">도그워킹</label>
        
        <div id="skills_text"></div>
    </div>

<!-- 돌봄 가능 동물 종류 -->
    <div class="type">
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
    </div>

<!-- 돌봄 환경 -->
    <div class="condition">
        <input type="checkbox" id="apt" value="1" name="care_condition_name" data-condition="아파트">
        <label for="apt">아파트</label>
        
        <input type="checkbox" id="villa" value="2" name="care_condition_name" data-condition="빌라">
        <label for="villa">빌라</label>
        
        <input type="checkbox" id="oneroom"  value="3" name="care_condition_name" data-condition="원룸">
        <label for="oneroom">원룸</label>
        
        <input type="checkbox" id="housing"  value="4" name="care_condition_name" data-condition="주택">
        <label for="housing">주택</label>
        
        <input type="checkbox" id="baby" value="5" name="care_condition_name" data-condition="아기있음">
        <label for="baby">아기있음</label>
        
        <input type="checkbox" id="smoking" value="6" name="care_condition_name" data-condition="흡연자">
        <label for="smoking">흡연자</label>   
        
        <input type="checkbox" id="x" value="7" name="care_condition_name" data-condition="해당사항없음">
        <label for="x">해당사항없음</label>   
        
        <div id="care_condition_text"></div>
    </div>
    
    <!-- 회원 반려동물 정보 -->
    <div>
	<c:forEach var="petDto" items="${petList}">
		<span>반려 동물 이름 : ${petDto.name}</span><br>
		<span>반려 동물 나이 : ${petDto.age}</span><br>
		<span>반려 동물 종류 : ${petDto.type}</span><br>
		<span>반려 동물 기타 : ${petDto.ect}</span><br>
	</c:forEach>    
    </div>
    
	<div>
		<input type="submit" value="견적 요청">
	</div>
</form>