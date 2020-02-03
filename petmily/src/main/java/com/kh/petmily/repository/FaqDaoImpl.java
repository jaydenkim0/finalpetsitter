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
	
	//게시글 작성
	@Override
	public void create(FaqVO faqVO) throws Exception {
		sqlSession.insert("faq.insert",faqVO);
	}
	
	//게시글 전체 조회
	@Override
	public List<FaqVO> listAll() throws Exception {
		return sqlSession.selectList("faq.listAll");
	}
	
	//게시글 상세보기
	@Override
	public FaqDto read(int faq_no) throws Exception {
		return sqlSession.selectOne("faq.read",faq_no);
	}

	//게시글 수정
	@Override
	public void update(FaqVO faqVO) throws Exception {
		sqlSession.update("faq.update",faqVO);
	}

	//게시글 삭제
	@Override
	public void delete(int faq_no) throws Exception {
		sqlSession.delete("faq.delete",faq_no);
	}
}
