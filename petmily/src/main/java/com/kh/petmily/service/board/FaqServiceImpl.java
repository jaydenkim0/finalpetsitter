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
	
	//게시글 조회
	@Override
	public List<FaqDto> list() throws Exception {
		return faqDao.list();
	}
	//게시글 작성 실행
	@Override
	public void write(FaqDto faqDto) throws Exception {
		faqDao.write(faqDto);
	}
	//게시글 상세보기
	@Override
	public FaqDto view(int faq_no) throws Exception {
		return faqDao.view(faq_no);
	}
	//게시글 수정 실행
	@Override
	public void update(FaqDto faqDto) throws Exception {
		faqDao.update(faqDto);
		
	}
	//게시글 삭제 실행
	@Override
	public void delete(int faq_no) throws Exception {
		faqDao.delete(faq_no);
		
	}
}

