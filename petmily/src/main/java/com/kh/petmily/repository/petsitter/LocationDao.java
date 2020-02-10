package com.kh.petmily.repository.petsitter;

import java.util.List;

import com.kh.petmily.entity.LocationDto;

public interface LocationDao {
	int getSequence();//지역 번호 미리 구하기
	void registLocation(int no,List<LocationDto>location_name);//지역 등록
}
