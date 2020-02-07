package com.kh.petmily.repository.petsitter;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.IdCardFileDto;

@Repository
public class IdCardFileDaoImpl implements IdCardFileDao {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void uploadId(IdCardFileDto idCardFileDto) {
		sqlSession.insert("petsitter.registIdCard", idCardFileDto);
	}
}
