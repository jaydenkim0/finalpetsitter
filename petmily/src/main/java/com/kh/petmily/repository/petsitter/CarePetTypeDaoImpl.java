package com.kh.petmily.repository.petsitter;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarePetTypeDaoImpl implements CarePetTypeDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void registType(List<Integer> care_name) {
		sqlSession.insert("petsitter.registType", care_name);
	}
	
	

}
