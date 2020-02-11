package com.kh.petmily.repository.petsitter;

import java.util.List;

import com.kh.petmily.entity.CareConditionDto;

public interface CareConditionDao {
	void registCondition(int no, List<Integer>care_condition_name);
	List<CareConditionDto> getCareConditionList(String id);
}
