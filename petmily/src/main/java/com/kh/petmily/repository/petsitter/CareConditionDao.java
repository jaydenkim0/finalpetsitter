package com.kh.petmily.repository.petsitter;

import java.util.List;

public interface CareConditionDao {
	void registCondition(int no, List<Integer>care_condition_name);
}
