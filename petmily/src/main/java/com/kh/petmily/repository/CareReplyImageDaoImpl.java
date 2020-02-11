package com.kh.petmily.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.CareReplyImageDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class CareReplyImageDaoImpl implements CareReplyImageDao{

	@Autowired
	private SqlSession sqlSession;

	//돌봄댓글&이미지 목록
	@Override
	public List<CareReplyImageDto> replyimagelist(String care_board_no) {
		return sqlSession.selectList("care.replyimagelist",care_board_no);
	}
	
}
