<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>펫시터 가입 페이지</h1>
<!-- 
	받아야하는 목록 : 
		sitter_id,info,sitter_pets,care_condition,sitter_terms_agree
-->
<form action="regist" method="post">
	<input type="hidden" name="sitter_id" value="test2">
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
		<input type="submit" value="펫시터 등록">
	</div>
</form>