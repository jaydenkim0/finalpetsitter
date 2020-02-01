package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QnaReplyDto {

	private int reply_no;
	private int origin; // QnA 테이블의 qna_no
	private String reply_writer; //member 테이블의 id
	private String content; // Qna 내용
	private String wdate; // Qna 작성일
}
