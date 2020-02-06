package com.kh.petmily.repository.petsitter;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class SkillsDaoImpl implements SkillsDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void registSkills(List<Integer> skills_name) {
		sqlSession.insert("petsitter.registSkills", skills_name);	
	}
	
	

}
