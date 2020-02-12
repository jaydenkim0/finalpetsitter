package com.kh.petmily.repository.petsitter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.entity.SkillNameDto;
import com.kh.petmily.entity.SkillsDto;



@Repository
public class SkillsDaoImpl implements SkillsDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void registSkills(int no, List<Integer> skills_name) {

		List<SkillsDto> skillsList = new ArrayList<>();
		
		for(Integer skillsNo : skills_name) {
			skillsList.add(SkillsDto.builder()
									.skills_name(skillsNo)
									.skills_sitter_no(no)
									.build());	
		}
		System.out.println(skillsList.toString());
		sqlSession.insert("petsitter.registSkills", skillsList);
		
	}

	@Override
	public List<SkillNameDto> getSkillList(String id) {
		List<SkillNameDto> skillsList = sqlSession.selectList("petsitter.getSkillList", id);
		return skillsList;
	}
}
