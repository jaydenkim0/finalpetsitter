package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CareBoardDto {

	private int care_board_no;
	private String care_member_id; // 회원 member 테이블의 id
	private String care_sitter_no; // pet_sitter 테이블의 pet_sitter_no
	private String care_board_content; // 돌봄게시판 질문 내용
	private String care_pw; // 숫자 4자리만 등록가능
}
