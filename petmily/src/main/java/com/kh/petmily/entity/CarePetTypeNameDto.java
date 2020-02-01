package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CarePetTypeNameDto {
	
	private int care_type_no; // 해당 돌봄 가능한 동물을 no 로 pet_sitter 와 연결
	private String care_type; // 펫시터가 돌봄 가능한 동물들

}
