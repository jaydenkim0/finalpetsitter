package com.kh.petmily.repository;

import java.util.List;

import com.kh.petmily.entity.ReservationDto;
import com.kh.petmily.entity.ReviewDto;


public interface ReviewDao {
   //게시글 작성
	void insert(ReviewDto reviewDto);
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
	
	
	
	public int getCount(String type, String keyword) throws Exception;
	
	List<ReviewDto> getList(int start, int finish);
	
	int getSequence();
	
	List<ReviewDto> listAll(String type, String keyword, int start, int finish) throws Exception;
	
	
	ReservationDto getReviewInfo(int reservation_no);
	

	// 메인페이지 찍어줄 리스트
	List<ReviewDto> reviewlist();

	// 리뷰가 있는지확인
	int isReview(int review_reservation_no);



	
	
	
	
	

	
	


}
