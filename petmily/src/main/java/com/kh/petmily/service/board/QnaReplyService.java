package com.kh.petmily.service.board;

import java.util.List;

import com.kh.petmily.vo.QnaReplyVO;

public interface QnaReplyService {

	//댓글 목록
	List<QnaReplyVO> readReply(int origin);

}
