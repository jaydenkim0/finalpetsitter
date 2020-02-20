package com.kh.petmily.repository;

import java.util.List;

import com.kh.petmily.vo.QnaReplyVO;

public interface QnaReplyDao {
	//댓글 목록
	List<QnaReplyVO> readReply(int qna_no);
	//댓글 등록
	void writeReply(QnaReplyVO qnaReplyVO);
	//댓글 수정
	void replyUpdate(QnaReplyVO qnaReplyVO);
	//댓글 삭제
	void replyDelete(QnaReplyVO qnaReplyVO);
	//댓글수 카운트
	void replyCal(QnaReplyVO qnaReplyVO);
	}
