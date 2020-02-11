package com.kh.petmily.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MemberPetsVO {
	private int pet_no;
	private String id; // member 테이블의 id
	private String pet_name; // 반려 동물 이름
	private int pet_age; // 반려동물 나이
	private String pet_type; // 반려동물의 종류
	private String pet_ect; // 반려동물의 기타 정보
}
