package com.kh.petmily.service.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.kh.petmily.entity.FaqDto;
import com.kh.petmily.vo.FaqVO;

public interface FaqService {
	//public void write(FaqDto faqDto)throws Exception;
	
	//글 작성
	public void create(FaqVO faqVO) throws Exception;
	
	//게시글 전체 목록
	public List<FaqVO> listAll() throws Exception;
	
	//게시글 상세보기
	public FaqDto read(int faq_no) throws Exception;
	
	//게시글 수정
	public void update(FaqVO faqVO) throws Exception;
	
	//게시글 삭제
	public void delete(int faq_no) throws Exception;

}
