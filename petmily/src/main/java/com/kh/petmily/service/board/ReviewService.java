package com.kh.petmily.service.board;

import java.util.List;

import com.kh.petmily.entity.FaqDto;
import com.kh.petmily.entity.ReviewDto;
import com.kh.petmily.vo.FaqVO;

public interface ReviewService {
   //게시글 조회
	List<ReviewDto>list()throws Exception;

	
	


}
