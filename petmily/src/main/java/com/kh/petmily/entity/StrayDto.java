package com.kh.petmily.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.kh.petmily.entity.QnaDto.QnaDtoBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class StrayDto {
	private int stray_no;
	private String stray_writer;
	private String stray_title;
	private String stray_head;
	private String stray_content;
	private String wdate;
	private String writedate; 
	
	public String getWritedateWithFormat()throws Exception{
		SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		Date date = read.parse(wdate);
		SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일");
		String time = write.format(date);
		return time;
	}
}
