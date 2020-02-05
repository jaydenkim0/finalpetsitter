package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor 
@AllArgsConstructor
@Builder 
public class CareConditionDto {

	private int care_condition_name; // care_condition_name 테이블의 care_condition_no
	private int condition_sitter_no; // pet_sitter 테이블의 pet_sitter_no
}
