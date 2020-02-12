package com.kh.petmily.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.petmily.vo.QnaReplyVO;

public class QnaReplyDaoImpl implements QnaReplyDao{
	@Autowired
	private SqlSession sqlSession;
	
	//댓글 목록
	@Override
	public List<QnaReplyVO> readReply(int qna_no) {
		return sqlSession.selectList("qna.readReply",qna_no);
	}
	//댓글 작성
	@Override
	public void writeReply(QnaReplyVO qnaReplyVO) {
		sqlSession.insert("qna.writeReply",qnaReplyVO);
		
	}
	//댓글 수정
	@Override
	public void replyUpdate(QnaReplyVO qnaReplyVO) {
		sqlSession.update("qna.replyUpdate",qnaReplyVO);
		
	}
	//댓글 삭제
	@Override
	public void replyDelete(QnaReplyVO qnaReplyVO) {
		sqlSession.delete("qna.replyDelete",qnaReplyVO);
	}

}
