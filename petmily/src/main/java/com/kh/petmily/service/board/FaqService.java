package com.kh.petmily.service.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.kh.petmily.entity.FaqDto;
import com.kh.petmily.vo.FaqVO;

public interface FaqService {
	//게시글 작성
	void create(FaqVO faqVO) throws Exception;
	//게시글 상세보기
	FaqVO read(int faq_no) throws Exception;
	//게시글 수정
	void update(FaqVO faqVO) throws Exception;
	//게시글 삭제
	void delete(int faq_no) throws Exception;
	//게시글 검색목록 조회
	List<FaqVO> listAll(String type, String keyword, int start, int finish) throws Exception;
	//게시글 레코드 갯수
	public int getCount(String type, String keyword) throws Exception;
	//게시글 목록
	List<FaqVO> getList(int start, int finish);

}
