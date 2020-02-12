package com.kh.petmily.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data @Builder
@NoArgsConstructor @AllArgsConstructor
public class QnaReplyVO {
	private int reply_no;
	private int origin; // QnA 테이블의 qna_no
	private String reply_writer; //member 테이블의 id
	private String content; // Qna 내용
	private String wdate; // Qna 작성일
	private String writedate;
	
	//테스트
	private String post;
	private String basic_addr;
	private String extra_addr;
	
	public String getwritedateWithFormat()throws Exception{
		SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		Date date = read.parse(wdate);
		SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일 E요일 HH시 mm분");
		String time = write.format(date);
		return time;
	}
}

