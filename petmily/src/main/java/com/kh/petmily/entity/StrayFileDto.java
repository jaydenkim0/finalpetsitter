package com.kh.petmily.entity;

import com.kh.petmily.entity.QnaFileDto.QnaFileDtoBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class StrayFileDto {
	private int stray_file_no;
	private int stray_stray_no;  //  stray_pet 테이블의 stray_no
	private String uploadname;
	private String savename;
	private String filetype;
	private long filesize;
}
