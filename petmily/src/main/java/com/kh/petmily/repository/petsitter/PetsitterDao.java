package com.kh.petmily.repository.petsitter;

import com.kh.petmily.entity.PetsitterDto;

public interface PetsitterDao {
	void regist(PetsitterDto petsitterDto);//펫시터 기본정보 등록
	int getSequence(); //펫시터 번호 구해오기
}
