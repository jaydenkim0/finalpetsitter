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
	private String sitter_pets; // 반려동물 여부 '예', '아니오' 만 등록가능
	private String care_condition; // 위탁할 공간이 있는지 있으면 환경을 서술
	private String sitter_status; // '정상' 또는 '휴면' 만등록가능
	

}
