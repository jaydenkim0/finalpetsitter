package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QnaDto {
	// pet_sitter 정보도 연결 해야 되지 않는지 확인!
	// 회원과 QnA 관계는 1대다
	// 펫시터오 QnA 관계도 1대다
	private int qna_no;
	private String qna_writer; // member 테이블의 id
	private String qna_title; //질문 게시판 타이틀
	private String qna_head;//질문 게시판 제목
	private String qna_content; // 질문 게시판 내용
	
}
