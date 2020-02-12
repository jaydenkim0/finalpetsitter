package com.kh.petmily.repository.petsitter;

import java.util.List;

import com.kh.petmily.entity.CareConditionDto;
import com.kh.petmily.entity.CareConditionNameDto;

public interface CareConditionDao {
	void registCondition(int no, List<Integer>care_condition_name);
	List<CareConditionNameDto> getCareConditionList(String id);
}
