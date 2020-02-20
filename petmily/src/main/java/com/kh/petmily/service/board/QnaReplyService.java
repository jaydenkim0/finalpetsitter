package com.kh.petmily.service.board;

import java.util.List;

import com.kh.petmily.vo.QnaReplyVO;

public interface QnaReplyService {
	//댓글 목록
	List<QnaReplyVO> readReply(int qna_no)throws Exception;
	//댓글 작성
	void writeReply(QnaReplyVO qnaReplyVO);
	//댓글 수정
	void replyUpdate(QnaReplyVO qnaReplyVO);
	//댓글 삭제
	void replyDelete(QnaReplyVO qnaReplyVO);
	//댓글 카운트
	void replyCal(QnaReplyVO qnaReplyVO);
}
