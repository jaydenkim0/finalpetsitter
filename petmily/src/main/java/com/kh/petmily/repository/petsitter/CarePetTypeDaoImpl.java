package com.kh.petmily.repository.petsitter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.CarePetTypeDto;
import com.kh.petmily.entity.SkillsDto;

@Repository
public class CarePetTypeDaoImpl implements CarePetTypeDao {

	@Autowired
	private SqlSession sqlSession;

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

	@Override
	public List<CarePetTypeDto> getPetTypeList(String id) {
		List<CarePetTypeDto> petTypeList = sqlSession.selectList("petsitter.getPetTypeList", id);
		return petTypeList;
	}
	
	

}
