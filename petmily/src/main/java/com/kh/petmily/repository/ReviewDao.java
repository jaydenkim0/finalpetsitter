package com.kh.petmily.repository;

import java.util.List;

import com.kh.petmily.entity.ReviewDto;


public interface ReviewDao {

	void insert(ReviewDto reviewDto)throws Exception;

	List<ReviewDto> list();

	
	List<ReviewDto> listSearch(int review_sitter_no);

	void delete(int review_no) throws Exception;

	void update(ReviewDto reviewDto);

	ReviewDto get(int review_no);

	

	

	

	
	

	

	

	
	
	


}
