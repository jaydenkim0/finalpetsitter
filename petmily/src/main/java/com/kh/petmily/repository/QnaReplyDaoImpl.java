package com.kh.petmily.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.petmily.vo.QnaReplyVO;

public class QnaReplyDaoImpl implements QnaReplyDao{
	@Autowired
	private SqlSession sqlSession;

}
