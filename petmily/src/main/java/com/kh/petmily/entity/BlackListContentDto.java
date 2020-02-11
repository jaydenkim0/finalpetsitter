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
public class BlackListContentDto {

	private int blackListContent_no;
	private String black_content_id; // 아이디
	private String black_content_grade; // 아이디
	private String black_content; // 차단 이유
	private String black_wdate; // 차단 등록 일시
	
	// 블랙리스트컨텐츠 등록일
	public String getBlackListdateWithFormat()throws Exception{
	      SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
	      Date date = read.parse(black_wdate);
	      SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일");
	      String time = write.format(date);
	      return time;
	   }
	
}
