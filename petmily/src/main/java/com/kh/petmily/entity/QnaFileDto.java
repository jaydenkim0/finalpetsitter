package com.kh.petmily.entity;

import com.kh.petmily.entity.InfoImageDto.InfoImageDtoBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QnaFileDto {
	private int qna_file_no;
	private int qna_qna_no;  //  faq 테이블의 faq_no
	private String uploadname;
	private String savename;
	private String filetype;
	private long filesize;
}
