package com.kh.petmily.vo.petsitter;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SkillsVO {
	
	//SkillNameDto
	private int skill_no; // 해당 기능을 스킬넘버로 pet_sitter 와 연결
	private String skill_name; // 노령케어, 투약가능 등등
	//SkillsDto
	private int skills_sitter_no; // pet_sitter 테이블의 pet_sitter_no
	
}
