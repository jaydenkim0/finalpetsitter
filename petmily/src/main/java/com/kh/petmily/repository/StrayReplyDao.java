package com.kh.petmily.repository;

import java.util.List;

import com.kh.petmily.vo.StrayReplyVO;

public interface StrayReplyDao {
	//댓글 목록
	List<StrayReplyVO> readReply(int stray_no);
	//댓글 등록
	void writeReply(StrayReplyVO strayReplyVO);
	//댓글 수정
	void replyUpdate(StrayReplyVO strayReplyVO);
	//댓글 삭제
	void replyDelete(StrayReplyVO strayReplyVO);
	//댓글수 갱신
	void replyCal(StrayReplyVO strayReplyVO);

}
