package com.kh.petmily.service.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.kh.petmily.entity.FaqDto;
import com.kh.petmily.vo.FaqVO;

public interface FaqService {
	//게시글 조회
	public List<FaqDto>list()throws Exception;
	//게시글 작성 실행
	public void write(FaqDto faqDto)throws Exception;
	//게시글 상세보기
	public FaqDto view(int faq_no) throws Exception;
	//게시글 수정 실행
	public void update(FaqDto faqDto) throws Exception;
	//게시글 삭제 실행
	public void delete(int faq_no) throws Exception;
}
