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
public class ReviewDto {

	// 펫시터 점수는 어떻게 평가할지
	// 평가한 점수는 어떤방식으로 보여줄지 확인 (평균)
	
	private int review_no; // 리뷰 번호
	private String review_writer; // member 테이블의 id
	private int review_sitter_no; // pet_sitter 테이블의  pet_sitter_no
	private String review_title; // 리뷰제목
	private String review_content; // 리뷰내용
	private int review_star; //리뷰 평점
	private String review_wdate;//리뷰 작성시간
	private int review_reservation_no;//reservation table의 reservation_no
	
	private String sitter_id; // 추가적으로 가지고와야할 시터 id(추가내용)
	
	public String getwritedateWithFormat()throws Exception{
		SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		Date date = read.parse(review_wdate);
		SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일");
		String time = write.format(date);
		return time;
		
	}
	
}
