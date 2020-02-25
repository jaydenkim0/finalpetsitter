package com.kh.petmily.repository.petsitter;

import java.util.List;

import com.kh.petmily.entity.CareConditionNameDto;
import com.kh.petmily.entity.CarePetTypeDto;
import com.kh.petmily.entity.CarePetTypeNameDto;
import com.kh.petmily.entity.PetDto;
import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.entity.SkillNameDto;
import com.kh.petmily.vo.petsitter.PetsitterPetsVO;
import com.kh.petmily.vo.petsitter.PetsitterVO;
import com.kh.petmily.vo.petsitter.SitterlocationVO;

public interface PetsitterDao {
	//펫시터 기본정보 등록
	void regist(PetsitterDto petsitterDto);
	//펫시터 번호 구해오기
	int getSequence(); 
	//펫시터 전체 조회
	List<PetsitterVO> getListAll();
	//펫시터 상세 정보 조회
	List<PetsitterVO> getList(int pet_sitter_no);
	//펫 시터 펫 조회
	List<PetsitterPetsVO> getPetList(int pet_sitter_no);
	//펫시터 단일 조회(펫시터 번호)
	PetsitterVO noGet(int pet_sitter_no);
	//펫시터 단일 조회(아이디)
	PetsitterVO idGet(String id);
	// 리스트 및 검색
	List<SitterlocationVO> locationListAll(int start, int end, String cityKeyword, String areaKeyword);
	// 카운트
	int countlocation(String cityKeyword, String areaKeyword);
	//펫시터 펫정보 조회
	List<PetDto> getPet(String id);
	//펫시터 정보 수정
	void updatePetsitter(PetsitterDto petsitterDto);
	//펫시터 상태 변경
	void updateStatus(int pet_sitter_no, String sitter_status);
	
	// 펫시터 블랙리스트 카운트 여부
	int black_petsitter_count(String id);
	
	// 회원이 펫을 갖고 있는지 카운터로 확인
	int petscheck(String id);
	
	//펫시터 가입시 체크박스 내용 불러오기
	List<CarePetTypeNameDto> getCarePetTypeList();
	List<SkillNameDto> getSkillNameList();
	List<CareConditionNameDto> getCareConditionName();

}
