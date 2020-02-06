package com.kh.petmily.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.FaqDto;
import com.kh.petmily.vo.FaqVO;

@Repository
public class FaqDaoImpl implements FaqDao{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	//게시글 작성
	public void create(FaqVO faqVO) throws Exception {
		sqlSession.insert("faq.faqinsert",faqVO);
	}

	@Override
	//게시글 상세보기
	public FaqVO read(int faq_no) throws Exception {
		return sqlSession.selectOne("faq.faqview",faq_no);
	}

	@Override
	//게시글 수정
	public void update(FaqVO faqVO) throws Exception {
		sqlSession.update("faq.faqupdate",faqVO);
		
	}

	@Override
	//게시글 삭제
	public void delete(int faq_no) throws Exception {
		sqlSession.delete("faq.faqdelete",faq_no);
	}

	@Override
	//게시글 전체 목록 조회
	public List<FaqVO> listAll(String type, String keyword) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("type",type);
		map.put("keyword",keyword);
		return sqlSession.selectList("faq.faqlistAll",map);
	}

	@Override
	public int countArticle(String type, String keyword) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("type",type);
		map.put("keyword",keyword);
		return sqlSession.selectOne("faq.countArticle",map);
	}
}
