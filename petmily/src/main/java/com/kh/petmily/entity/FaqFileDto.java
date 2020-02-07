package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder
@NoArgsConstructor @AllArgsConstructor
public class FaqFileDto {
	private int faq_file_no;
	private int faq_file_faq_no;
	private String uploadname;
	private String savename;
	private String filetype;
	private long filesize;
}
