package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BankImageDto {
	
	private int bank_image_no;
	private int bank_sitter_no; // pet_sitter 테이블의 pet_sitter_no
	private String uploadname;
	private String savename; 
	private String filetype;
	private long filesize;
}
