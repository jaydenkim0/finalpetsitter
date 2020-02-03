package com.kh.petmily.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.FaqDto;

@Repository
public class FaqDaoImpl implements FaqDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void write(FaqDto faqDto) throws Exception{
		sqlSession.insert("faq.insert",faqDto);
	}

}
