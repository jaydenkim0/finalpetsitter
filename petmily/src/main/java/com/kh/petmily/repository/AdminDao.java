package com.kh.petmily.repository;

import java.io.IOException;
import java.util.List;

import com.kh.petmily.entity.BankImageDto;
import com.kh.petmily.entity.BlackListContentDto;
import com.kh.petmily.entity.BlackListDto;
import com.kh.petmily.entity.CareConditionNameDto;
import com.kh.petmily.entity.CarePetTypeNameDto;
import com.kh.petmily.entity.IdCardFileDto;
import com.kh.petmily.entity.InfoImageDto;
import com.kh.petmily.entity.LicenseFileDto;
import com.kh.petmily.entity.LocationDto;
import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.PayinfoDto;
import com.kh.petmily.entity.PetDto;
import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.entity.SkillNameDto;
import com.kh.petmily.vo.MemberVO;
import com.kh.petmily.vo.petsitter.PetsitterVO;

public interface AdminDao {

	int getMtotal();
	
	int getPtotal();
	
	int getAtotal();
	

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

	
	// 블랙리스트 아이디 체크
	int blackLsitcheck(String id);

	// 블랙리스트에서 삭제
	void blackListdelete(String id);

	// 펫시터 블랙리스트 탈퇴시 등급변경
	void petsittersecession(String sitter_id);

	// 블랙리스트 디테일 페이지 내용 가지고 오기
	PetsitterVO blackListdetailSearch(String id);
	// 블랙리스트컨텐츠 내용 가지고 오기
	List<BlackListContentDto> blacklistcontent(String id);

	// 펫시터 가진 소개정보가 몇개인지 가지고오기
	List<InfoImageDto> sitterInfoimage(int pet_sitter_no);
	// 펫시터 소개이미지 가지고 오기(1장씩 요청)
	InfoImageDto getInfoImage(int info_image_no);
	// 펫시터 소개이미지 실제로 가지고오기(1장씩 요청)
	byte[] physicalInfoImage(String savename) throws IOException;
	
	// 펫시터가 가진 신분증 정보 가지고오기
	IdCardFileDto sitterIdcardimg(int pet_sitter_no);
	// 펫시터 가진 신분증 이미지 가지고 오기 (1장)
	IdCardFileDto getSitteridcardimage(int id_image_no);
	// 펫시터 신분증 실제로 가지고 오기(1장)
	byte[] physicalidcardimage(String savename) throws IOException;

	// 펫시터 가진 라이센스 정보 가지고 오기
	 LicenseFileDto sitterLicenseimge(int pet_sitter_no);
	// 펫시터 가진 라이센스 이미지 가지고 오기 (1장)
	 LicenseFileDto getSitterlicenseimage(int license_image_no);
	// 펫시터 라이센스이미지 실제로 가지고 오기(1장)
	byte[] physicallicenseimage(String savename) throws IOException;
	
	// 펫시터 가진 통장사본 정보 가지고 오기
	BankImageDto sitterBankimge(int pet_sitter_no);
	// 펫시터 가진 통장사본 이미지 가지고 오기 (1장)
	BankImageDto getSitterbankimage(int bank_image_no);
	// 펫시터 통장사본 이미지 실제로 가지고 오기(1장)
	byte[] physicallbankimage(String savename) throws IOException;
		
	// 회원 및 펫시터 복귀(블랙리스트에서 삭제)
	void gradeComback(String black_id);

	//////////////////////////////////////////////////////
	
	// 회원 리스트 전체 목록
	List<MemberVO> memberListAll(int start, int end, String searchOption, String keyword);
	// 회원 리스트 총 카운트 불러오기(페이징에 필요)
	int countAricle(String searchOption, String keyword);

	// 펫시터 리스트 전체 목록
	List<PetsitterVO> petsitterListAll(int start, int end, String searchOption, String keyword);
	// 펫시터 리스 총 카운트 불러오기(페이징에 필요)
	int countAriclePetsitter(String searchOption, String keyword);

	// 펫시터 승인 리스트 전체 목록
	List<PetsitterVO> petsitterApplyListAll(int start, int end, String searchOption, String keyword);
	// 펫시터 승인 리스 총 카운트 불러오기(페이징에 필요)
	int countAriclePetsitterApply(String searchOption, String keyword);

	// 휴면 펫시터 리스트 전체 목록
	List<PetsitterVO> petsitterSleepListAll(int start, int end, String searchOption, String keyword);
	// 휴면 펫시터 리스트 카운트 불러오기 (페이징에 필요)
	int countAriclePetsitterSleep(String searchOption, String keyword);

	// 경고 회원 리스트 전체 목록
	List<PetsitterVO> blackMemberListAll(int start, int end, String searchOption, String keyword);
	// 경고 회원 리스트 카운트
	int countAricleBlackMember(String searchOption, String keyword);

	// 경고 펫시터 리스트 전체 목록
	List<PetsitterVO> blackPetsitterListAll(int start, int end, String searchOption, String keyword);
	// 경고 펫시터 카운트
	int countAricleBlackPetsitter(String searchOption, String keyword);

	
	// 가격 옵션 리스트 불러오기
	List<PayinfoDto> getAccountlist();
	// 가격 옵션 등록하기
	void accountOtionAdd(PayinfoDto payinfoDto);
	// 가격 옵션 삭제
	void accountoptiondelete(int payinfo_no);

	List<PayinfoDto> getFeesList();

	


	


	

	

}
