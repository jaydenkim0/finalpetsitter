package com.kh.petmily.repository.petsitter;

import java.util.List;

import com.kh.petmily.entity.PetDto;
import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.vo.petsitter.PetsitterPetsVO;
import com.kh.petmily.vo.petsitter.PetsitterVO;
import com.kh.petmily.vo.petsitter.SitterlocationVO;

public interface PetsitterDao {
	void regist(PetsitterDto petsitterDto);//펫시터 기본정보 등록
	int getSequence(); //펫시터 번호 구해오기
	List<PetsitterVO> getListAll();//펫시터 전체 조회
	List<PetsitterVO> getList(int pet_sitter_no);//펫시터 상세 정보 조회
	List<PetsitterPetsVO> getPetList(int pet_sitter_no);//펫 시터 펫 조회
	
	// 리스트 및 검색
	List<SitterlocationVO> locationListAll(int start, int end, String cityKeyword, String areaKeyword);
	// 카운트
	int countlocation(String cityKeyword, String areaKeyword);
	List<PetDto> getPet(String id);
}
