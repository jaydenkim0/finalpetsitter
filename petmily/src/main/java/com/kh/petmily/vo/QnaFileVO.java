package com.kh.petmily.vo;

import com.kh.petmily.vo.FaqFileVO.FaqFileVOBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder
@NoArgsConstructor @AllArgsConstructor
public class QnaFileVO {
	private int qna_no;
	private int qna_no_file;
	private String uploadname;
	private String savename;
	private String filetype;
	private long filesize;
}
