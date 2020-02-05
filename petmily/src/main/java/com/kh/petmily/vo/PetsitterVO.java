package com.kh.petmily.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PetsitterVO {

	// member
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
	
	//petsitter
	private int pet_sitter_no;
	private String sitter_id; // member 테이블의 id 
	private String info; // 소개글
	private String sitter_pets; // 반려동물 여부 '예', '아니오' 만 등록가능
	private String care_condition; // 위탁할 공간이 있는지 있으면 환경을 서술
	private String sitter_status; // '정상' 또는 '휴면' 만등록가능	
	private String sitter_terms_agree; // 펫시터 이용약관 동의, 무조건 'true' 일때 만 가입가능
	private String sitter_joindate; // 시터 가입일
	private String sitter_matching_type; // '방문서비스', '위탁서비스', '둘다' 만 작성가능
}