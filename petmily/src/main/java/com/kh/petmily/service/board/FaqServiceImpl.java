package com.kh.petmily.service.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petmily.entity.FaqDto;
import com.kh.petmily.repository.FaqDao;
import com.kh.petmily.vo.FaqVO;

@Service
public class FaqServiceImpl implements FaqService {
	@Autowired
	private FaqDao faqDao;
	
	//글쓰기
	@Override
	public void create(FaqVO faqVO) throws Exception {
		String faq_title = faqVO.getFaq_title();
		String faq_head = faqVO.getFaq_head();
		String faq_content = faqVO.getFaq_content();
		String member_id = faqVO.getMember_id();
		faqVO.setFaq_title(faq_title);
		faqVO.setFaq_head(faq_head);
		faqVO.setFaq_content(faq_content);
		faqVO.setMember_id(member_id);
		faqDao.create(faqVO);
	}
	
	//게시글 전체 목록 조회
	@Override
	public List<FaqVO> listAll() throws Exception {
		return faqDao.listAll();
	}
	
	//게시글 상세보기
	@Override
	public FaqDto read(int faq_no) throws Exception {
		return faqDao.read(faq_no);
	}
	
	//게시글 수정
	@Override
	public void update(FaqVO faqVO) throws Exception {
		faqDao.update(faqVO);
	}
	
	//게시글 삭제
	@Override
	public void delete(int faq_no) throws Exception {
		faqDao.delete(faq_no);
	}
}

