package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CarePetTypeDto {

	// pet_sitter 와 CarePetTypeName을 연결해주는 테이블
	// 다대다 관계 테이블이니 중복요소 가 있음
	// pet_sitter 가 돌봄 가능한 동물 타입을 CarePetTypeName 을 가지고 있을 수 있음
	private int care_name; // care_pet_type_name 테이블의 care_type_no 
	private int care_sitter_no; // pet_sitter 테이블의 pet_sitter_no
	
}
