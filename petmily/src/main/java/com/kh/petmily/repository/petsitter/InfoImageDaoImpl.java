package com.kh.petmily.repository.petsitter;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.InfoImageDto;

@Repository
public class InfoImageDaoImpl implements InfoImageDao{

	@Autowired
	SqlSession sqlSession;
	
	
	@Override
	public void uploadInfo(InfoImageDto infoImageDto) {
		sqlSession.insert("petsitter.registInfo", infoImageDto);
		
	}

}
