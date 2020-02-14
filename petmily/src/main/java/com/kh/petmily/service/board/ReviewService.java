package com.kh.petmily.service.board;

import java.util.List;


import com.kh.petmily.entity.FaqDto;
import com.kh.petmily.entity.ReviewDto;
import com.kh.petmily.vo.FaqVO;

public interface ReviewService {
   //리스트
	List<ReviewDto>list();
   //삭제
	void delete(int review_no) throws Exception;
   //시터번호 조회	
	List<ReviewDto> listSearch(int review_sitter_no) throws Exception;
	
	// 리뷰 작성시 포인트 업
	void pointplus(ReviewDto reviewDto);


	
	// 게시글 조회
//	List<ReviewDto> listSearch(int review_sitter_no);

	
	


}
