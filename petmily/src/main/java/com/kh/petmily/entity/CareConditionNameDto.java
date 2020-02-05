package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CareConditionNameDto {

	// 돌봄환경이름
	private int care_condition_no;
	private String care_condition_name;
}
