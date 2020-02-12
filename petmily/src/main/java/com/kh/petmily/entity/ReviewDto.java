package com.kh.petmily.entity;

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
}
