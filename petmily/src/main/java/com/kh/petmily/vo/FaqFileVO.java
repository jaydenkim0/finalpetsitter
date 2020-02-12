package com.kh.petmily.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder
@NoArgsConstructor @AllArgsConstructor
public class FaqFileVO {
	//파일업로드
		private int file_no;
		private int faq_no_file;
		private String uploadname;
		private String savename;
		private String filetype;
		private long filesize;
}
