package com.kh.petmily.service.board;

import java.util.List;


import com.kh.petmily.entity.FaqDto;
import com.kh.petmily.entity.ReviewDto;
import com.kh.petmily.vo.FaqVO;

public interface ReviewService {
   //리스트
	List<ReviewDto>list();

	void delete(int review_no) throws Exception;


	



	
	
	// 게시글 조회
//	List<ReviewDto> listSearch(int review_sitter_no);

	
	


}
