package com.kh.petmily.vo.petsitter;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor 
@AllArgsConstructor
@Builder 
public class CareConditionVO {
	
	//CareConditionNameDto
	private int care_condition_no;
	private String care_condition_name;
	
	//CareConditionDto
	private int condition_sitter_no; // pet_sitter 테이블의 pet_sitter_no
}
