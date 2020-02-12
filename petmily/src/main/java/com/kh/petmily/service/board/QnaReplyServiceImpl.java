package com.kh.petmily.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petmily.repository.QnaReplyDao;
import com.kh.petmily.vo.QnaReplyVO;
@Service
public class QnaReplyServiceImpl implements QnaReplyService{
	
	@Autowired
	QnaReplyService qnaReplyService;
	
	@Autowired
	QnaReplyDao qnaReplyDao;
	
	//댓글 목록
	@Override
	public List<QnaReplyVO> readReply(int qna_no) throws Exception {
		return qnaReplyDao.readReply(qna_no);
	}
	//댓글 작성
	@Override
	public void writeReply(QnaReplyVO qnaReplyVO) {
		qnaReplyDao.writeReply(qnaReplyVO);
	}
	//댓글 수정
	@Override
	public void replyUpdate(QnaReplyVO qnaReplyVO) {
		qnaReplyDao.replyUpdate(qnaReplyVO);
		
	}
	//댓글 삭제
	@Override
	public void replyDelete(QnaReplyVO qnaReplyVO) {
		qnaReplyDao.replyDelete(qnaReplyVO);
	}
}
