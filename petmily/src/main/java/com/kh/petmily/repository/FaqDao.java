package com.kh.petmily.repository;

import java.util.List;

import com.kh.petmily.entity.FaqDto;
import com.kh.petmily.vo.FaqVO;

public interface FaqDao {
	//게시글 작성
	public void create(FaqVO faqVO)throws Exception;
	
	//게시글 전체 조회
	public List<FaqVO> listAll()throws Exception;
	
	//게시글 상세보기
	public FaqDto read(int faq_no)throws Exception;
	
	//게시글 수정
	public void update(FaqVO faqVO)throws Exception;
	
	//게시글 삭제
	public void delete(int faq_no)throws Exception;
}
