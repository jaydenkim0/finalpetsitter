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
	//리스트
	@Override
	public List<ReviewDto>list() {
		return sqlSession.selectList("review.reviewlist");
	}
	
	// 게시글조회
	@Override
	public List<ReviewDto> listSearch(int review_sitter_no){ 		
		return sqlSession.selectList("review.reviewlistSearch",review_sitter_no);
	}
	//게시글 삭제
	@Override
	public void delete(int review_no) throws Exception{
		sqlSession.delete("review.reviewdelete",review_no);
		
	}
	//게시글 수정
	@Override
	public void update(ReviewDto reviewDto) {
		sqlSession.update("review.reviewupdate",reviewDto);
		
	}
	@Override
	public ReviewDto get(int review_no){
	return sqlSession.selectOne("review.reviewselect",review_no);
	    
	}

	
	}


		
	



		
	


	
	

