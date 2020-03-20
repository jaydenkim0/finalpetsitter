package com.kh.petmily.repository.petsitter;

import java.util.List;

import com.kh.petmily.entity.CareConditionDto;
import com.kh.petmily.entity.CareConditionNameDto;
import com.kh.petmily.vo.petsitter.CareConditionVO;

public interface CareConditionDao {
	//돌봄 환경 등록
	void registCondition(int no, List<Integer>care_condition_name);
	//돌봄 환경 목록 조회
	List<CareConditionVO> getCareConditionList(int pet_sitter_no);
	//펫시터 돌봄 환경 삭제
	void deleteCondition(int pet_sitter_no);
}
