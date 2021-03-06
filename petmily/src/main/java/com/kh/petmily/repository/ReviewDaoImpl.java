package com.kh.petmily.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.ReservationDto;
import com.kh.petmily.entity.ReviewDto;
@Repository
public class ReviewDaoImpl implements ReviewDao{
		@Autowired
		private SqlSession sqlSession;
		
		//게시글 작성----------------------------------------------------------------------------	
		@Override
		public void insert(ReviewDto reviewDto) {		
		 	sqlSession.insert("review.reviewinsert",reviewDto);
		}
		//리스트----------------------------------------------------------------------------	
		@Override
		public List<ReviewDto>list() {
			return sqlSession.selectList("review.reviewlist");
		}
	
		// 게시글조회----------------------------------------------------------------------------	
		@Override
		public List<ReviewDto> listSearch(int review_sitter_no){ 		
			return sqlSession.selectList("review.reviewlistSearch",review_sitter_no);
		}
		//게시글 삭제----------------------------------------------------------------------------	
		@Override
		public void delete(int review_no) throws Exception{
			sqlSession.delete("review.reviewdelete",review_no);
			
		}
		//게시글 수정----------------------------------------------------------------------------	
		@Override
		public void update(ReviewDto reviewDto) throws Exception {
			sqlSession.update("review.reviewupdate",reviewDto);
		}	
	    //게시글 정보 구해오기------------------------------------------------------------------
		@Override
		public ReviewDto get(int review_no){
		return sqlSession.selectOne("review.reviewselect",review_no);
		    
		}
		//포인트
		@Override
		public void pointplus(ReviewDto reviewDto) {
			sqlSession.update("review.pointplus", reviewDto)	;
		}
		//별점
		@Override
		public double star(int pet_sitter_no) {
			return sqlSession.selectOne("review.star", pet_sitter_no);		
		}
	
		//
		@Override
		public int getCount(String type, String keyword) throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("type",type);
		map.put("keyword", keyword);
		return sqlSession.selectOne("review.getCount",map);
	
		}
		@Override
		public List<ReviewDto> getList(int start, int finish) {
		Map<String, Object> map = new HashMap<>();
		map.put("start",start);
		map.put("finish",finish);
		return sqlSession.selectList("review.getList",map);
		}
		@Override
		public int getSequence() {
			int review_no = sqlSession.selectOne("review.getSequence");
			return review_no;
		}
		
		//게시글 검색 목록 조회
		@Override
		public List<ReviewDto> listAll(String type, String keyword, int start, int finish) throws Exception{
			Map<String, Object> map = new HashMap<>();
			map.put("type",type);
			map.put("keyword",keyword);
			map.put("start",start);
			map.put("finish",finish);
			return sqlSession.selectList("review.reviewlistAll",map);
		}
	
		@Override
		public ReservationDto getReviewInfo(int reservation_no) {
			return sqlSession.selectOne("review.getReviewInfo", reservation_no);
		}
		
		// 메인화면에 리뷰를 찍어주는 확인
		@Override
		public List<ReviewDto> reviewlist() {	
			return sqlSession.selectList("review.reviewlist") ;
		}
		
		// 별점이 있는지 확인
		@Override
		public int isReview(int review_reservation_no) {		
			return sqlSession.selectOne("review.isReview", review_reservation_no);
		}
		

	
	

		
	}
	

	

	
	


		
	



		
	


	
	

