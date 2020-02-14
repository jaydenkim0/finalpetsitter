package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PetImageDto {

	private int pet_image_no;
	private int pet_image_pet_no;
	private String savename;
	private String filetype;
	private long filesize;
	private String uploadname;
	
}
