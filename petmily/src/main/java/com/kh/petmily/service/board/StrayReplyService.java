package com.kh.petmily.service.board;

import java.util.List;

import com.kh.petmily.vo.StrayReplyVO;

public interface StrayReplyService {
	//댓글 목록
	List<StrayReplyVO> readReply(int stray_no);
	//댓글작성
	void writeReply(StrayReplyVO strayReplyVO);
	//댓글 수정
	void replyUpdate(StrayReplyVO strayReplyVO);
	//댓글 삭제
	 void replyDelete(StrayReplyVO strayReplyVO);
	}

