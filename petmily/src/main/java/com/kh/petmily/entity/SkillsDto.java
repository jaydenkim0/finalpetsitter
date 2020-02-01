package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SkillsDto {

	// pet_sitter 와 skill_name을 연결해주는 테이블
	// 다대다 관계 테이블이니 중복요소 가 있음
	// pet_sitter 가 여러 skills_name 을 가지고 있을 수 있음 
	private int skills_name; // skill_name 테이블의 skill_no
	private int skills_sitter_no; // pet_sitter 테이블의 pet_sitter_no
	
}
