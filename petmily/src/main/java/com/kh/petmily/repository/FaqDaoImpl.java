package com.kh.petmily.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.FaqDto;
import com.kh.petmily.vo.FaqVO;

@Repository
public class FaqDaoImpl implements FaqDao{
	
	@Autowired
	SqlSession sqlSession;
	
	//게시글 조회
	@Override
	public List<FaqDto>list() throws Exception {
		return sqlSession.selectList("faq.faqlist");
	}
	
	//게시글 작성
	@Override
	public void write(FaqDto faqDto) throws Exception {
		sqlSession.insert("faq.faqwrite",faqDto);
	}

	//게시글 상세보기
	@Override
	public FaqDto view(int faq_no) throws Exception {
		return sqlSession.selectOne("faq.faqview",faq_no);
	}
	
	//게시글 작성 실행
	@Override
	public void update(FaqDto faqDto) throws Exception {
		sqlSession.update("faq.faqupdate",faqDto);
	}
	
	//게시글 삭제 실행
	@Override
	public void delete(int faq_no) throws Exception {
		sqlSession.delete("faq.faqdelete",faq_no);
	}
}
