package com.kh.petmily.repository;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.ReviewDto;
@Repository
public class ReviewDaoImpl implements ReviewDao{
	@Autowired
	private SqlSession sqlSession;
	//게시글 작성
	@Override
	public void insert(ReviewDto reviewDto) {
	 	sqlSession.insert("review.reviewinsert",reviewDto);
	}
	//게시글 조회
	@Override
	public List<ReviewDto>list() throws Exception {
		return sqlSession.selectList("review.reviewlist");
	}
	
	
  

}
