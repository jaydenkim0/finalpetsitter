package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LicenseFileDto {

	// uproadname 및 sevename 구분
	// uproadname 어떤 방식으로겹치지 않게 하는지 확인
	private int license_image_no;
	private int license_sitter_no;  //  pet_sitter 테이블의 pet_sitter_no
	private String uploadname;
	private String savename;
	private String filetype;
	private long filesize;
	
}
