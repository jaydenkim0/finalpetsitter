package com.kh.petmily.repository.petsitter;

import java.util.List;

import com.kh.petmily.entity.CarePetTypeNameDto;

public interface CarePetTypeDao {
	void registType(int no, List<Integer>care_name);
	List<CarePetTypeNameDto> getPetTypeList(String id);
}
