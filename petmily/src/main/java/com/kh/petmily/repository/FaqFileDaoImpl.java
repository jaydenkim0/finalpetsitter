package com.kh.petmily.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.FaqFileDto;

@Repository
public class FaqFileDaoImpl implements FaqFileDao{

	@Autowired
	SqlSession sqlSession;
	
	//faq 파일 업로드
	@Override
	public void uploadfaq(FaqFileDto faqfileDto) {
		sqlSession.insert("faq.faqfile",faqfileDto);
		
	}

}
