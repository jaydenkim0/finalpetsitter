package com.kh.petmily.repository;

import java.util.List;

import com.kh.petmily.entity.ReviewDto;

public interface ReviewDao {

	void insert(ReviewDto reviewDto)throws Exception;

	List<ReviewDto> list() throws Exception;

	
	
	


}
