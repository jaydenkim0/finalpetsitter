package com.kh.petmily.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CareDto {

	private int care_board_no;
	private String care_member_id; // 회원 member 테이블의 id
	private int care_sitter_no; // pet_sitter 테이블의 pet_sitter_no
	private String care_board_content; // 돌봄게시판 질문 내용
	private String care_pw; // 숫자 4자리만 등록가능
	private String wdate; // 게시글 작성일
	private String writedate;
	
	public String getwritedateWithFormat()throws Exception{
		SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		Date date = read.parse(wdate);
		SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일");
		String time = write.format(date);
		return time;
		
	}
	
}
