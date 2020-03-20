package com.kh.petmily.repository.petsitter;

import java.util.List;

import com.kh.petmily.entity.CarePetTypeNameDto;
import com.kh.petmily.vo.petsitter.CarePetTypeVO;

public interface CarePetTypeDao {
	//돌봄가능 동물 등록
	void registType(int no, List<Integer>care_name);
	//돌봄가능 동물 목록 조회
	List<CarePetTypeVO> getPetTypeList(int pet_sitter_no);
	//돌봄가능 동물 삭제
	void deleteType(int pet_sitter_no);	
}
