package com.kh.petmily.repository;

import java.util.List;

import com.kh.petmily.entity.CarePetTypeNameDto;
import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.vo.PetsitterVO;

public interface AdminDao {

	int getMtotal();
	
	int getPtotal();
	
	int getAtotal();
	
	// 회원 리스트
	List<MemberDto> getMemberList(MemberDto memberDto);

	// 펫시터 리스트
	List<PetsitterVO> getPetsitterList();
	
	// 휴면 펫시터 리스트
	List<PetsitterVO> getPetsitterSleep();

	// 펫시터 신청 리스트
	List<PetsitterVO> getPetsitterApplyList();
	
	// 펫시터 승인
	void petsitterApply(String sitter_id);
	
	// 펫시터 거부 (삭제)
	void petsitterNegative(String sitter_id);

	// 펫시터 단일 검색
	PetsitterVO petsitterSearchOne(String sitter_id);

	// 펫시터 차단 (블랙리스트 등록 및 펫시터 상태 휴면으로 변경)
	void blackSitter(PetsitterDto petsitterDto, PetsitterVO petsitterVO);
	
	// 펫시터 상태 변환
	void sitter_status(PetsitterDto petsitterDto);

	// 펫시터 옵션 등록 : 돌봄가능동물
	// 불러오기
	List<CarePetTypeNameDto> getCarePetType();
	// 펫시터 옵션 등록 : 스킬이름
	// 불러오기
	List<CarePetTypeNameDto> getPetSkills();
	// 펫시터 옵션 등록 : 환경목록
	// 불러오기
	List<CarePetTypeNameDto> getPetCareCondition();
	
	
	// 펫시터 옵션 등록 : 돌봄가능동물
	// 등록하기
	void carePetTypeI(String care_type);
	// 삭제하기
	void carePetTypeD(int care_type_no);
	
	// 펫시터 옵션 등록 : 스킬이름
	// 등록하기
	void petSkillNameI(String skill_name);
	// 삭제하기
	void petSkillNameD(int skill_no);

	// 펫시터 옵션 등록 : 환경목록
	// 등록하기
	void petCareConditionI(String care_condition_name);
	// 삭제하기
	void petCareConditionD(int care_condition_no);



	

	

}
