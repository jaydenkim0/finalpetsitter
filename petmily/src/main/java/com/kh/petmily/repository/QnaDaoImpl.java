package com.kh.petmily.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.petmily.vo.QnaVO;

@Repository
public class QnaDaoImpl implements QnaDao{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	//게시글 작성
	public void create(QnaVO qnaVO) throws Exception {
		sqlSession.insert("qna.qnainsert",qnaVO);
	}
	//게시글 답글 작성
	@Override
	public void createReply(QnaVO qnaVO) {
		sqlSession.insert("qna.qnaReplyinsert",qnaVO);
	}

	@Override
	//게시글 상세보기
	public QnaVO read(int qna_no) throws Exception {
		return sqlSession.selectOne("qna.qnaview",qna_no);
	}

	@Override
	//게시글 수정
	public void update(QnaVO qnaVO) throws Exception {
		sqlSession.update("qna.qnaupdate",qnaVO);
		
	}

	@Override
	//게시글 삭제
	public void delete(int qna_no) throws Exception {
		sqlSession.delete("qna.qnadelete",qna_no);
	}

	@Override
	//게시글 검색 목록 조회
	public List<QnaVO> listAll(String type, String keyword,int start, int finish) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("type",type);
		map.put("keyword",keyword);
		map.put("start",start);
		map.put("finish",finish);
		return sqlSession.selectList("qna.qnalistAll",map);
	}

	@Override
	public int getCount(String type, String keyword) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("type",type);
		map.put("keyword",keyword);
		return sqlSession.selectOne("qna.getCount",map);
	}
	//게시글 전체 조회
	@Override
	public List<QnaVO> getList(int start, int finish) {
		Map<String, Object> map = new HashMap<>();
		map.put("start",start);
		map.put("finish",finish);
		return sqlSession.selectList("qna.getList",map);
	}
	//게시글 번호 구해오기
	@Override
	public int getSequence() {
		int qna_no = sqlSession.selectOne("qna.getSequence");
		return qna_no;
	}
}
