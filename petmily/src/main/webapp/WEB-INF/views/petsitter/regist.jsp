<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<label for="condition-option">돌봄 환경</label>
		<select id="condition-option" name="care_condition">
			<option>아파트</option>
			<option>빌라</option>
			<option>원룸</option>
			<option>주택</option>
			<option>아기있음</option>
			<option>흡연자</option>
			<!-- 나중에 기타면 입력창 생성 -->
			<option>기타</option>
			<option>해당사항없음</option>
		</select>
	</div>
	
	<div>
		<label for="mt">가능한 돌봄 종류</label>
		<!-- 체크박스로 변경예정 -->
		<select id="mt" name="sitter_matching_type">
			<option>방문서비스</option>
			<option>위탁서비스</option>
			<option>둘다</option>
		</select>
	</div>
	
<!-- 	<div> -->
<!-- 		다중 선택 가능하도록../체크박스로 변경 예정? -->
<!-- 		<label for="skills-option">가능한 스킬</label> -->
<!-- 		<select id="skills-option" name="skills_name" required> -->
<!-- 			<option value="1">투약</option> -->
<!-- 			<option value="2">노령견 케어</option> -->
<!-- 			<option value="3">키튼 케어</option> -->
<!-- 			<option value="4">가축</option> -->
<!-- 			나중에 기타면 입력창 생성 -->
<!-- 			<option>기타</option> -->
<!-- 		</select> -->
<!-- 	</div> -->
<!-- 	<div> -->
<!-- 		다중 선택 가능하도록../체크박스로 변경 예정? -->
<!-- 		<label for="skills-option">가능한 스킬</label> -->
<!-- 		<select id="skills-option" name="care_name" required> -->
<!-- 			<option value="1">강아지</option> -->
<!-- 			<option value="2">고양이</option> -->
<!-- 			<option value="3">물고기</option> -->
<!-- 			<option value="4">토끼</option> -->
<!-- 			<option value="5">햄스터</option> -->
<!-- 			<option value="6">파충류</option> -->
<!-- 			나중에 기타면 입력창 생성 -->
<!-- 			<option>기타</option> -->
<!-- 		</select> -->
<!-- 	</div> -->
	<div>
		<input type="submit" value="펫시터 등록">
		<h5>다음 단계로 진행하면 펫밀리 신청 약관 에 동의하는 것으로 간주됩니다.</h5>
	</div>
</form>