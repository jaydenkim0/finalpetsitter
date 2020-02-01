package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CareImageDto {
	
	private int care_image_no; // 저장되는 파일이름을 care_image_no 변경
	private int care_reply_no; // care_reply 테이블의 care_reply_no 
	private String savename; // DB에 저장되는 이름 = 사용자에게 보여줄이름
	private String filetype;
	private int filesize;

}
