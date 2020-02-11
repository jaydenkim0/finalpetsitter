package com.kh.petmily.repository.petsitter;

import java.util.List;

import com.kh.petmily.entity.LocationDto;

public interface LocationDao {
	void registLocation(int no,List<LocationDto>location_name);//지역 등록
	List<LocationDto> getLocationList(String id);//활동 지역 조회
}
