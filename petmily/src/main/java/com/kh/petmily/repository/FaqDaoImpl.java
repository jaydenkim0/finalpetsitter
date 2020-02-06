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
	
	@Override
	public List<FaqVO> listAll(String search_option, String keyword, int start, int end) throws Exception {
		//검색 옵션 , 키워드 맵에 저장
		Map<String,Object>map = new HashMap<>();
		map.put("search_option",search_option);
		map.put("keyword",keyword);
		map.put("start", start); 
        map.put("end", end);
		return sqlSession.selectList("faq.faqlistAll",map);
	}
	
	//게시글 검색 레코드 갯수 메소드
	@Override
	public int countArticle(String search_option, String keyword) throws Exception {
		//검색 옵션 , 키워드 맵에 저장
		Map<String,String>map = new HashMap<>();
		map.put("search_option",search_option);
		map.put("keyword",keyword);
		return sqlSession.selectOne("faq.faqCountList",map);
	}
}
