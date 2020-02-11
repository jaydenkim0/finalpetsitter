package com.kh.petmily.repository.petsitter;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.LocationDto;
import com.kh.petmily.entity.SkillsDto;

@Repository
public class LocationDaoImpl implements LocationDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void registLocation(int no, List<LocationDto> location_name) {
		List<LocationDto> locationList = new ArrayList<>();
		
		for(LocationDto dto : location_name) {
			locationList.add(LocationDto.builder()
									.location_sitter_no(no)
									.city(dto.getCity())
									.area(dto.getArea())
									.build());	
		}
		System.out.println(locationList.toString());
		sqlSession.insert("petsitter.registLocation", locationList);
		
	}

	@Override
	public List<LocationDto> getLocationList(String id) {
		List<LocationDto> locationList = sqlSession.selectList("petsitter.getLocationList", id);
		return locationList;
	}
	
}
