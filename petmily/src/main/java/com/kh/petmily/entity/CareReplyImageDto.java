package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CareReplyImageDto {

	//CareImageDto
	private int care_image_no; // 저장되는 파일이름을 care_image_no 변경
	private int care_reply_no; // care_reply 테이블의 care_reply_no 
	private String savename; // DB에 저장되는 이름 = 사용자에게 보여줄이름
	private String filetype;
	private long filesize;
	private String uploadname;
	
	//CareReplyDto
	private int care_reply_board_no; // care_board 테이블의 care_board_no
	private String care_reply_content; // 댓글 내용
	private String wdate; // 댓글 작성 시간
	private String care_reply_writer;//댓글 작성자(member 테이블의 id)
	
}
