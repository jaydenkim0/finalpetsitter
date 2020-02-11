package com.kh.petmily.repository.petsitter;

import java.util.List;

import com.kh.petmily.entity.SkillNameDto;

public interface SkillsDao {
	void registSkills(int no,List<Integer>skills_name);//스킬 등록
	List<SkillNameDto> getSkillList(String id);//펫시터 스킬 상세 조회
}
