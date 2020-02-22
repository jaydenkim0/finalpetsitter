package com.kh.petmily.repository.petsitter;

import java.util.List;

import com.kh.petmily.entity.SkillNameDto;

public interface SkillsDao {
	//스킬 등록
	void registSkills(int no,List<Integer>skills_name);
	//펫시터 스킬 목록 조회
	List<SkillNameDto> getSkillList(int pet_sitter_no);
	//펫시터 스킬 삭제
	void deleteSkills(int pet_sitter_no);
}
