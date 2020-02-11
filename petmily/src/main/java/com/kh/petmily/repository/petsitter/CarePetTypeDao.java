package com.kh.petmily.repository.petsitter;

import java.util.List;

import com.kh.petmily.entity.CarePetTypeDto;

public interface CarePetTypeDao {
	void registType(int no, List<Integer>care_name);
	List<CarePetTypeDto> getPetTypeList(String id);
}
