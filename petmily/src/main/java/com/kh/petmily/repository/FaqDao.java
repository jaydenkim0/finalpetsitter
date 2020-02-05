package com.kh.petmily.repository;

import java.util.List;

import com.kh.petmily.entity.FaqDto;
import com.kh.petmily.vo.FaqVO;

public interface FaqDao {
	//게시글 목록 보기
	public List<FaqDto>list()throws Exception;
	
	//게시글 작성 실행
	public void write(FaqDto faqDto)throws Exception;
	
	//게시글 상세보기
	public FaqDto view(int faq_no)throws Exception;
	
	//게시글 수정 실행
	public void update(FaqDto faqDto) throws Exception;
	
	//게시글 삭제 실행
	public void delete(int faq_no) throws Exception;

	//게시글 검색 레코드 갯수 메소드
	public int countArticle(String searchOpt, String keyword) throws Exception;
	
	//게시글 네비게이터
	public List<FaqVO> listAll(String search_option, String keyword, int start, int end) throws Exception;
}
