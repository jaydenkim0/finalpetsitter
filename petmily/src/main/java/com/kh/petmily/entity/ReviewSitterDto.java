package com.kh.petmily.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.kh.petmily.entity.CareImageDto.CareImageDtoBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReviewSitterDto {

	private int review_no; // 리뷰 번호
	private String review_writer; // member 테이블의 id
	private int review_sitter_no; // pet_sitter 테이블의  pet_sitter_no
	private String review_title; // 리뷰제목
	private String review_content; // 리뷰내용
	private int review_star; //리뷰 평점
	private String review_wdate;//리뷰 작성시간
	
	private String sitter_id;//join해서 구해온 sitter id
	
	public String getwritedateWithFormat()throws Exception{
		SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		Date date = read.parse(review_wdate);
		SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일");
		String time = write.format(date);
		return time;
		
	}
}
