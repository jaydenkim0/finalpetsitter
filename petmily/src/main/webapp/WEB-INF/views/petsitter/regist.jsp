<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>    
	<script>
	 $(function(){
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
         })
     });
	</script>
    
<h1>펫시터 가입 페이지</h1>
<!-- 
	받아야하는 목록 : 
		sitter_id,info,sitter_pets,care_condition,sitter_terms_agree
-->
<form action="regist" method="post">
	<input type="hidden" name="sitter_id" value="${id}">
	<h1>${id}</h1>
	<div>
		<label for="info-text">펫밀리 기본 정보</label>
		<textarea id="info-text" name="info" required></textarea>
	</div>
	
	<div>
		<label for="yn">반려동물 키워본 경험 유무</label>
		<!-- 체크박스로 변경예정 -->
		<select id="yn" name="sitter_pets">
			<option>예</option>
			<option>아니오</option>
		</select>
	</div>
	
	<div>
		<label for="mt">가능한 돌봄 종류</label>
		<select id="mt" name="sitter_matching_type">
			<option>방문서비스</option>
			<option>위탁서비스</option>
			<option>둘다</option>
		</select>
	</div>
	
	<div class="skill">
        <input type="checkbox" id="sick" value="1" name="skills" data-skills="투약">
        <label for="sick" id="nameTo1">투약</label>
        
        <input type="checkbox" id="old" value="2" name="skills" data-skills="노령견테어">
        <label for="old" id="nameTo2">노령견케어</label>
        
        <input type="checkbox" id="kitten"  value="3" name="skills" data-skills="키튼케어">
        <label for="kitten" id="nameTo3">키튼케어</label>
        
        <input type="checkbox" id="walking"  value="4" name="skills" data-skills="도그워킹">
        <label for="walking" id="nameTo4">도그워킹</label>
        
        <div id="skills_text"></div>
    </div>

    <div class="type">
        <input type="checkbox" id="dog" value="1" name="care_pet_type" data-animal="강아지">
        <label for="dog">강아지</label>
        
        <input type="checkbox" id="cat" value="2" name="care_pet_type" data-animal="고양이">
        <label for="cat">고양이</label>
        
        <input type="checkbox" id="fish"  value="3" name="care_pet_type" data-animal="물고기">
        <label for="fish">물고기</label>
        
        <input type="checkbox" id="rabbit"  value="4" name="care_pet_type" data-animal="토끼">
        <label for="rabbit">토끼</label>
        
        <input type="checkbox" id="hamster" value="5" name="care_pet_type" data-animal="햄스터">
        <label for="hamster">햄스터</label>
        
        <input type="checkbox" id="reptiles" value="6" name="care_pet_type" data-animal="파충류">
        <label for="reptiles">파충류</label>        
        
        <div id="care_pet_type_text"></div>
    </div>

    <div class="condition">
        <input type="checkbox" id="apt" value="1" name="care_condition" data-condition="아파트">
        <label for="apt">아파트</label>
        
        <input type="checkbox" id="villa" value="2" name="care_condition" data-condition="빌라">
        <label for="villa">빌라</label>
        
        <input type="checkbox" id="oneroom"  value="3" name="care_condition" data-condition="원룸">
        <label for="oneroom">원룸</label>
        
        <input type="checkbox" id="housing"  value="4" name="care_condition" data-condition="주택">
        <label for="housing">주택</label>
        
        <input type="checkbox" id="baby" value="5" name="care_condition" data-condition="아기있음">
        <label for="baby">아기있음</label>
        
        <input type="checkbox" id="smoking" value="6" name="care_condition" data-condition="흡연자">
        <label for="smoking">흡연자</label>   
        
        <input type="checkbox" id="x" value="7" name="care_condition" data-condition="해당사항없음">
        <label for="x">해당사항없음</label>   
        
        <div id="care_condition_text"></div>
    </div>
	
	<div>
		<input type="submit" value="펫시터 등록">
		<h5>다음 단계로 진행하면 펫밀리 신청 약관 에 동의하는 것으로 간주됩니다.</h5>
	</div>
</form>