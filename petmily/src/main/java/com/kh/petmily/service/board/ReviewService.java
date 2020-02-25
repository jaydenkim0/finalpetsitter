package com.kh.petmily.service.board;

import java.util.List;


import com.kh.petmily.entity.FaqDto;
import com.kh.petmily.entity.ReviewDto;
import com.kh.petmily.repository.ReviewDao;
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
	//별점 평균	
	double star(int pet_sitter_no);
	//검색조회		
	List<ReviewDto> listAll(String type, String keyword, int start, int finish) throws Exception;
	
	List<ReviewDto> getList(int start, int finish);
	
	public int getCount(String type, String keyword) throws Exception;
	List<ReviewDto> get(int review_reservation_no) throws Exception;
		
	//리뷰 별점 
	

		
		
	}
	



	
	



