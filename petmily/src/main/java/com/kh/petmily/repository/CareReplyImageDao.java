package com.kh.petmily.repository;

import java.util.List;

import com.kh.petmily.entity.CareReplyImageDto;

public interface CareReplyImageDao {

	//돌봄댓글&이미지 목록
	List<CareReplyImageDto> replyimagelist(String care_board_no, int start, int finish);
	
}
