package com.kh.petmily.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.kh.petmily.entity.QnaReplyDto.QnaReplyDtoBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class StrayReplyDto {

	private int reply_no;
	private int origin; // QnA 테이블의 qna_no
	private String reply_writer; //member 테이블의 id
	private String content; // Qna 내용
	private String wdate; // Qna 작성일
	private String writedate;
	
	public String getwritedateWithFormat()throws Exception{
		SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		Date date = read.parse(wdate);
		SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일");
		String time = write.format(date);
		return time;
	}
}
