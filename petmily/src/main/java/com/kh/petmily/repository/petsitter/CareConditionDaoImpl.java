package com.kh.petmily.repository.petsitter;

import java.util.ArrayList;
import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.CareConditionDto;
import com.kh.petmily.entity.CareConditionNameDto;
import com.kh.petmily.vo.petsitter.CareConditionVO;

@Repository
public class CareConditionDaoImpl implements CareConditionDao{

	@Autowired
	private SqlSession sqlSession;

	//돌봄 환경 등록
	@Override
	public void registCondition(int no, List<Integer> care_condition_name) {
		List<CareConditionDto> conditionList = new ArrayList<>();
		
		for(Integer conditionNo : care_condition_name) {
			conditionList.add(CareConditionDto.builder()
									.care_condition_name(conditionNo)
									.condition_sitter_no(no)
									.build());	
		}
		System.out.println(conditionList.toString());
		sqlSession.insert("petsitter.registCondition", conditionList);
	}
	
	//돌봄 환경 목록 조회
	@Override
	public List<CareConditionVO> getCareConditionList(int pet_sitter_no) {
		List<CareConditionVO> careConditionList = sqlSession.selectList("petsitter.getCareConditionList", pet_sitter_no);
		return careConditionList;
	}
	//돌봄 환경 삭제
	@Override
	public void deleteCondition(int pet_sitter_no) {
		sqlSession.delete("petsitter.deleteCondition", pet_sitter_no);
		
	}
}
