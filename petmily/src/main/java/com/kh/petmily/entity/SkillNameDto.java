package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SkillNameDto {

	private int skill_no; // 해당 기능을 스킬넘버로 pet_sitter 와 연결
	private String skill_name; // 노령케어, 투약가능 등등
}
