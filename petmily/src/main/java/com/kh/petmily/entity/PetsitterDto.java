package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PetsitterDto {

	private int pet_sitter_no;
	private String sitter_id; // member 테이블의 id 
	private String info; // 소개글
	private String sitter_pets; // 반려동물 경험 여부 '예', '아니오' 만 등록가능	
	private String sitter_status; // '정상' 또는 '휴면' 만등록가능	
	private String sitter_terms_agree; // 펫시터 이용약관 동의, 무조건 'true' 일때 만 가입가능
	private String sitter_matching_type; // 펫시터가 가능한 매칭서비스 종류(위탁서비스/방문서비스)
	private String sitter_joindate; // 펫시터 가입일
	private String sitter_bankname; // 펫시터 은행
	private String sitter_bank_account;  // 펫시터 계좌번호
}
