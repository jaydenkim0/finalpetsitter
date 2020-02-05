package com.kh.petmily.repository.petsitter;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.PetsitterDto;

@Repository
public class PetsitterDaoImpl implements PetsitterDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void regist(PetsitterDto petsitterDto) {
		sqlSession.insert("petsitter.regist", petsitterDto);
	}

}
