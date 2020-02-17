package com.kh.petmily.vo;

import com.kh.petmily.vo.QnaFileVO.QnaFileVOBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder
@NoArgsConstructor @AllArgsConstructor
public class StrayFileVO {
	private int stray_file_no;
	private int stray_stray_no;
	private String uploadname;
	private String savename;
	private String filetype;
	private long filesize;
}
