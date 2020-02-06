package com.kh.petmily.repository.petsitter;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.CareConditionDto;

@Repository
public class CareConditionDaoImpl implements CareConditionDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void registCondition(List<Integer> care_condition_name) {
		sqlSession.insert("petsitter.registCondition", care_condition_name);
	}
	
	
	
}
