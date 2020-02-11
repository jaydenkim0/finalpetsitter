package com.kh.petmily.repository;

import java.util.List;

import com.kh.petmily.entity.BlackListContentDto;
import com.kh.petmily.entity.BlackListDto;
import com.kh.petmily.entity.CareConditionNameDto;
import com.kh.petmily.entity.CarePetTypeNameDto;
import com.kh.petmily.entity.LocationDto;
import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.PetDto;
import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.entity.SkillNameDto;
import com.kh.petmily.vo.MemberVO;
import com.kh.petmily.vo.PetsitterVO;

public interface AdminDao {

	int getMtotal();
	
	int getPtotal();
	
	int getAtotal();
	
	// 회원 리스트
	List<MemberVO> getMemberList();

	// 펫시터 리스트
	List<PetsitterVO> getPetsitterList();
	
	// 휴면 펫시터 리스트
	List<PetsitterVO> getPetsitterSleep();

	// 펫시터 신청 리스트
	List<PetsitterVO> getPetsitterApplyList();
	
	// 펫시터 승인
	void petsitterApply(String sitter_id);
	
	// 펫시터 거부 (삭제)
	void petsitterNegative(String sitter_id, int sitter_no);
	// 블랙리스트 회원 탈퇴 (삭제)
	void memberdelete(String id);
	// 블랙리스트 테이블에서 권한 변경
	void blackListgradechange(String sitter_id);


	// 펫시터 단일 검색 (petsitterVO ver)
	PetsitterVO petsitterSearchOne(String sitter_id);
	
	// 펫시터 시퀀스 번호 갖고오기
	public int blackListsno();
	// 펫시터 경고 등록 (블랙리스트 등록 및 펫시터 상태 휴면으로 변경)
	void blackSitter(PetsitterDto petsitterDto, PetsitterVO petsitterVO, BlackListContentDto blackListContentDto);
	// 회원 경고 등록 (블랙리스트 등록)
	void blackMember(BlackListDto blackListDto, BlackListContentDto blackListContentDto);

	
	// 펫시터 상태 변환
	void sitter_status(PetsitterDto petsitterDto);

	// 펫시터 옵션 등록 : 돌봄가능동물
	// 불러오기
	List<CarePetTypeNameDto> getCarePetType();
	// 펫시터 옵션 등록 : 스킬이름
	// 불러오기
	List<SkillNameDto> getPetSkills();
	// 펫시터 옵션 등록 : 환경목록
	// 불러오기
	List<CareConditionNameDto> getPetCareCondition();
	
	
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

	// 펫시터 블랙리스트 불러오기
	List<BlackListDto> getSitterBlackList();
	// 회원 블랙리스트 불러오기
	List<BlackListDto> getMemberBlackList();

	// 페시터 회원 정보 (단일조회)
	PetsitterVO getPetsitterdetail(int pet_sitter_no);	
	
	// 펫시터 회원정보 (지역) 
	List<LocationDto> getPetsitterdetailLocation(int pet_sitter_no);
	// 펫시터 회원정보 (돌봄가능동물) 
	List<CarePetTypeNameDto> getPetsitterdetailCarePet(int pet_sitter_no);
	// 펫시터 회원정보 (스킬) 
	List<SkillNameDto> getPetsitterdetailSkills(int pet_sitter_no);
	// 펫시터 회원정보 (펫시터 환경) 
	List<CareConditionNameDto> getPetsitterdetailCareCondition(int pet_sitter_no);

	// 회원 디테일 페이지
	MemberVO getMemberdetail(String id);
	// 회원 정보 페이지에 보여줄 반려동물 
	List<PetDto> getPets(String id);

	// 회원관리 페이지에서 회원 검색
	List<MemberVO> memberSearchList(String type, String keyword);
	
	// 펫시터 관리 페이지에서 펫시터 검색
	List<PetsitterVO> petsitterSearch(String type, String keyword);

	// 펫시터 관리 페이지에서 펫시터 신청 검색
	List<PetsitterVO> petsitterSearchApply(String type, String keyword);

	// 펫시터 관리 페이지에서 휴면펫시터 검색
	List<PetsitterVO> petsitterSearchSleep(String type, String keyword);

	// 블랙리스트 아이디 체크
	int blackLsitcheck(String id);

	// 블랙리스트에서 삭제
	void blackListdelete(String id);

	// 펫시터 블랙리스트 탈퇴시 등급변경
	void petsittersecession(String sitter_id);

	// 블랙리스트 디테일 페이지 내용 가지고 오기
	PetsitterVO blackListdetailSearch(String id);
	


	


	

	

}
