package com.kh.petmily.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petmily.entity.BlackListDto;
import com.kh.petmily.entity.CareConditionNameDto;
import com.kh.petmily.entity.CarePetTypeNameDto;
import com.kh.petmily.entity.LocationDto;
import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.entity.SkillNameDto;
import com.kh.petmily.entity.SkillsDto;
import com.kh.petmily.repository.AdminDao;
import com.kh.petmily.vo.PetsitterVO;

@Service
public class AdiminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	// 총 회원 카운트
	@Override
	public int memberTotal() {
		return adminDao.getMtotal();
	}
	
	// 총 펫시터 카운트
	@Override
	public int petsitterTotal() {
		return adminDao.getPtotal();
	}
	
	// 총 관리자 카운트
	@Override
	public int admimTotal() {
		return adminDao.getAtotal();
	}
	
	// member 리스트
	@Override
	public List<MemberDto> memberList(MemberDto memberDto) {		
		return adminDao.getMemberList(memberDto);
	}

	// petsitter 리스트
	@Override
	public List<PetsitterVO> petsitterList( ) {		
		return adminDao.getPetsitterList();
	}
	
	// 펫시터 신청 리스트
	@Override
	public List<PetsitterVO> petsitterApplyList( ) {		
		return adminDao.getPetsitterApplyList();
	}
	
	// 휴면 펫시터 리스트
	@Override
	public List<PetsitterVO> petsitterSleepList() {
		return adminDao.getPetsitterSleep();
	}
	
	
	// 펫시터 승인
	@Override
	public void petsitterapply(String sitter_id) {
		adminDao.petsitterApply(sitter_id);		
	}

	// 펫시터 거부(삭제)
	@Override
	public void petsitterNegative(String sitter_id, int sitter_no) {
		adminDao.petsitterNegative(sitter_id, sitter_no);		
	}

	// 펫시터 단일 검색
	@Override
	public PetsitterVO PetsitterSearchOne(String sitter_id) {
		return adminDao.petsitterSearchOne(sitter_id);
	}

	// 펫시터 차단 기능
	@Override
	public void blackSitter(PetsitterDto petsitterDto, String black_content) {
		// 펫시터 상태 휴면으로 변경		
		// 펫시터 단일 검색으로 정보 갖고 오기
		String sitter_id = petsitterDto.getSitter_id();
		PetsitterVO petsitterVO = (PetsitterVO) adminDao.petsitterSearchOne(sitter_id);
		petsitterVO.setBlack_content(black_content);
		// 블랙시트 테이블에 등록
		adminDao.blackSitter(petsitterDto, petsitterVO);
	}

	// 펫시터 상태 변환
	@Override
	public void sitter_status(PetsitterDto petsitterDto) {		
		adminDao.sitter_status(petsitterDto);
		
	}

	// 펫시터 옵션
		// 돌봄가능동물 불러오기
	@Override
	public 	List<CarePetTypeNameDto>  carePetType() {		
		return  adminDao.getCarePetType();
	}	
	// 스킬 목록 불러오기
	@Override
	public List<SkillNameDto> petSkillsName() {		
		return adminDao.getPetSkills();
	}
	// 펫 컨디션(환경) 목록 불러오기
	@Override
	public List<CareConditionNameDto> petCareCondition() {	
		return adminDao.getPetCareCondition();
	}
	
	// 펫시터 옵션 등록 : 돌봄가능동물
	// 등록하기
	@Override
	public void carePetTypeI(String care_type) {
		adminDao.carePetTypeI(care_type);	
	}
	// 삭제하기
	@Override
	public void carePetTypeD(int care_type_no) {
		adminDao.carePetTypeD(care_type_no);
		
	}


	// 펫시터 옵션 등록 : 스킬이름
	// 등록하기
	@Override
	public void petSkillNameI(String skill_name) {
		adminDao.petSkillNameI(skill_name);
	}
	// 삭제하기
	@Override
	public void petSkillNameD(int skill_no) {
		adminDao.petSkillNameD(skill_no);
	}

	// 펫시터 옵션 등록 : 환경 이름
	// 등록하기
	@Override
	public void petCareConditionI(String care_condition_name) {
		adminDao.petCareConditionI(care_condition_name);
	}
	// 삭제하기
	@Override
	public void petCareConditionD(int care_condition_no) {
		adminDao.petCareConditionD(care_condition_no);
	}

	// 펫시터 블랙리스트 불러오기
	@Override
	public List<BlackListDto> sitterBlackList() {		
		return adminDao.getSitterBlackList();
	}

	// 회원 블랙리스트 불러오기
	@Override
	public List<BlackListDto> memberBlackList() {		
		return adminDao.getMemberBlackList();
	}
	
	// 페시터 회원 정보 (단일조회)
	@Override
	public PetsitterVO petsitterdetail(int pet_sitter_no) {
		return adminDao.getPetsitterdetail(pet_sitter_no);
	}
	// 펫시터 회원정보 (지역) 
	@Override
	public List<LocationDto> petsitterdetailLocation(int pet_sitter_no) {
		return adminDao.getPetsitterdetailLocation(pet_sitter_no);
	}
	// 펫시터 회원정보 (돌봄가능동물) 
	@Override
	public List<CarePetTypeNameDto> petsitterdetailCarePet(int pet_sitter_no) {
		return adminDao.getPetsitterdetailCarePet(pet_sitter_no);
	}
	// 펫시터 회원정보 (스킬) 
	@Override
	public List<SkillNameDto> petsitterdetailSkills(int pet_sitter_no) {
		return adminDao.getPetsitterdetailSkills(pet_sitter_no);
	}
	// 펫시터 회원정보 (펫시터 환경) 
	@Override
	public List<CareConditionNameDto> petsitterdetailCareCondition(int pet_sitter_no) {
		return adminDao.getPetsitterdetailCareCondition(pet_sitter_no);
	}





}
