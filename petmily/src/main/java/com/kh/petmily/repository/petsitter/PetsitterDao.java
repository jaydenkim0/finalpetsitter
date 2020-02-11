package com.kh.petmily.repository.petsitter;

import java.util.List;

import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.vo.MemberPetsVO;
import com.kh.petmily.vo.petsitter.PetsitterVO;

public interface PetsitterDao {
	void regist(PetsitterDto petsitterDto);//펫시터 기본정보 등록
	int getSequence(); //펫시터 번호 구해오기
	List<PetsitterVO> getList(String id);//펫시터 상세 정보 조회
	List<MemberPetsVO> getPetList(String id);//펫 시터 펫 조회
}
