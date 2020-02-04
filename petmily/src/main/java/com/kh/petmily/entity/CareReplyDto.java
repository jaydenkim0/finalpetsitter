package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CareReplyDto {

	// CareBoard의 댓글  Dto
	private int care_reply_no;
	private int care_reply_board_no; // care_board 테이블의 care_board_no
	private String care_member_id; // member 테이블의 id
	private int care_sitter_no; // // pet_sitter 테이블의 pet_sitter_no
	private String care_reply_content; // 댓글 내용
	private String wdate; // 댓글 작성 시간
}
