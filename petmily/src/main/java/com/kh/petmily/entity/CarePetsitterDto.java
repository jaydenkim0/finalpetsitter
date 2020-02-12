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
public class CarePetsitterDto {
	
	private int care_board_no;
	private String care_member_id;
	private String sitter_id;
	private String care_board_content;
	private String care_pw;
	private String wdate;
	private String writedate;
	
	public String getwritedateWithFormat()throws Exception{
		SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		Date date = read.parse(wdate);
		SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일");
		String time = write.format(date);
		return time;
		
	}
	
}
