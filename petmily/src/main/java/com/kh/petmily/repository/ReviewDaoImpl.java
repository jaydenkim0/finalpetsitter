package com.kh.petmily.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.petmily.entity.ReviewDto;

public class ReviewDaoImpl implements ReviewDao{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(ReviewDto reviewDto) {
	 	sqlSession.insert("review.reviewinsert",reviewDto);
	}

  

}
