package com.kh.petmily.repository.petsitter;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.CarePetTypeDto;
import com.kh.petmily.entity.CarePetTypeNameDto;

@Repository
public class CarePetTypeDaoImpl implements CarePetTypeDao {

	@Autowired
	private SqlSession sqlSession;
	//돌봄 가능 동물 등록
	@Override
	public void registType(int no, List<Integer> care_name) {
		List<CarePetTypeDto> petList = new ArrayList<>();
		
		for(Integer petNo : care_name) {
			petList.add(CarePetTypeDto.builder()
										.care_name(petNo)
										.care_sitter_no(no)
									.build());	
		}
		sqlSession.insert("petsitter.registType", petList);
		
	}
	
	//돌봄 가능 동물 목록 조회
	@Override
	public List<CarePetTypeNameDto> getPetTypeList(int pet_sitter_no) {
		List<CarePetTypeNameDto> petTypeList = sqlSession.selectList("petsitter.getPetTypeList", pet_sitter_no);
		return petTypeList;
	}
	//돌봄 가능 동물 삭제
	@Override
	public void deleteType(int pet_sitter_no) {
		sqlSession.delete("petsitter.deleteType", pet_sitter_no);
		
	}
	

}
