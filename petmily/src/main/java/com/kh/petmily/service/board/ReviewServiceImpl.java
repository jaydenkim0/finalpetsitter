package com.kh.petmily.service.board;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petmily.entity.ReservationDto;
import com.kh.petmily.entity.ReviewDto;
import com.kh.petmily.repository.ReviewDao;
@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDao reviewDao;
	
	// 게시글 리스트	
	@Override
	public List<ReviewDto> list()  {
		return reviewDao.list();
	}
   // 게시글 삭제
	@Override
	public void delete(int review_no) throws Exception {
	    reviewDao.delete(review_no);
		
	}
	// 게시글 조회
	@Override
	public List<ReviewDto> listSearch(int review_sitter_no) throws Exception {
//		System.out.println("service"+review_sitter_no);
		return reviewDao.listSearch(review_sitter_no);
	}
	// 리뷰 작성시 포인트 업
	@Override
	public void pointplus(ReviewDto reviewDto) {
		reviewDao.pointplus(reviewDto);	
	}
    // 리뷰 평균별점
	@Override
	public double star(int pet_sitter_no){
		return reviewDao.star(pet_sitter_no);
		
	}
	@Override
	public List<ReviewDto> listAll(String type, String keyword, int start, int finish) throws Exception {
		return reviewDao.listAll(type,keyword,start,finish);
	}
//	@Override
//	public List<ReviewDto> getList(int start, int finish) {
//	
//	}
	@Override
	public int getCount(String type, String keyword) throws Exception {
		return reviewDao.getCount(type,keyword);
	}
	@Override
	public List<ReviewDto> getList(int start, int finish) {
	    return reviewDao.getList(start,finish);
	}
	@Override
	public ReservationDto getReviewInfo(int reservation_no) {	
		return reviewDao.getReviewInfo(reservation_no);
	}
	
	// 리뷰작
	@Override
	public int isReview(int review_no) {
		// TODO Auto-generated method stub
		return 0;
	}
	




	}


	
	

	
	

