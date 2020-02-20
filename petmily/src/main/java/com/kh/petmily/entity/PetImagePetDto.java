package com.kh.petmily.entity;

import com.kh.petmily.entity.PetImageDto.PetImageDtoBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PetImagePetDto {

	
	//PetDto
	private int pet_no;
	private String member_id; // member 테이블의 id
	private String name; // 반려 동물 이름
	private int age; // 반려동물 나이
	private String type; // 반려동물의 종류
	private String ect; // 반려동물의 기타 정보
	
	//PetImageDto
	private int pet_image_no;
//	private int pet_image_pet_no;
	private String savename;
	private String filetype;
	private long filesize;
	private String uploadname;
	
}
