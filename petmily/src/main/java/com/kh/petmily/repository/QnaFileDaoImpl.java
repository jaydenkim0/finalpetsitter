package com.kh.petmily.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.QnaFileDto;
@Repository
public class QnaFileDaoImpl implements QnaFileDao{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public void uploadqna(QnaFileDto qnafileDto) {
		sqlSession.insert("qna.qnafile",qnafileDto);
	}
}
