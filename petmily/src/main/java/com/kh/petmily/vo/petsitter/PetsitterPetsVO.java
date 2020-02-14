package com.kh.petmily.vo.petsitter;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class PetsitterPetsVO {
	//회원 + 펫시터 정보
	private String id; 
	private String pw; 
	private String name; 
	private String nick;
	private String email;
	private String phone;
	private String post;
	private String basic_addr;
	private String extra_addr;
	private int point;
	private String grade;
	private String pets; // 반려동물 여부 '예', '아니오' 만 등록가능
	private String joindate;
	private String lastlogin;
	private String Privacy_agree; // 회원가입 개인정보 동의, 무조건 'true' 일때 만 가입가능
	private String terms_agree; // 회원 이용약관 동의, 무조건 'true' 일때 만 가입가능

	private int pet_sitter_no;
	private String sitter_id; // member 테이블의 id 
	private String info; // 소개글
	private String sitter_pets; // 반려동물 여부 '예', '아니오' 만 등록가능	
	private String sitter_status; // '정상' 또는 '휴면' 만등록가능	
	private String sitter_terms_agree; // 펫시터 이용약관 동의, 무조건 'true' 일때 만 가입가능
	private String sitter_joindate; // 시터 가입일
	private String sitter_matching_type; // '방문서비스', '위탁서비스', '둘다' 만 작성가능
	
	//펫 정보
	private int pet_no;
	private String pet_name; // 반려 동물 이름
	private int pet_age; // 반려동물 나이
	private String pet_type; // 반려동물의 종류
	private String pet_ect; // 반려동물의 기타 정보
	
	
}
