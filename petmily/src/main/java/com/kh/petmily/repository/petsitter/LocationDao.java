package com.kh.petmily.repository.petsitter;

import java.util.List;

import com.kh.petmily.entity.LocationDto;

public interface LocationDao {
	//활동 지역 등록
	void registLocation(int no,List<LocationDto>location_name);
	//활동 지역  목록 조회
	List<LocationDto> getLocationList(int pet_sitter_no);
	//활동 지역 삭제
	void deleteLocation(int pet_sitter_no);
}
