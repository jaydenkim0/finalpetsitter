package com.kh.petmily.repository;

import java.util.List;

import com.kh.petmily.entity.ReviewDto;


public interface ReviewDao {
   //게시글 작성
	void insert(ReviewDto reviewDto)throws Exception;
   //게시글 조회
	List<ReviewDto> list();
	List<ReviewDto> listSearch(int review_sitter_no);
    //게시글 삭제
	void delete(int review_no) throws Exception;
	//게시글 수정정보 구해오기
	ReviewDto get(int review_no);
    //게시글 수정
	void update(ReviewDto reviewDto) throws Exception;
	//게시글 상세보기	
	
	// 리뷰작성시 포인트 플러스
	void pointplus(ReviewDto reviewDto);

	
	// 별점평균 불러오기
	double star(int pet_sitter_no);
	List<ReviewDto> listall(String type, String keyword, int start, int finish);
	
	
	
	

	
	


}
