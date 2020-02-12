package com.kh.petmily.repository;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.BankImageDto;
import com.kh.petmily.entity.BlackListContentDto;
import com.kh.petmily.entity.BlackListDto;
import com.kh.petmily.entity.CareConditionNameDto;
import com.kh.petmily.entity.CarePetTypeNameDto;
import com.kh.petmily.entity.IdCardFileDto;
import com.kh.petmily.entity.InfoImageDto;
import com.kh.petmily.entity.LicenseFileDto;
import com.kh.petmily.entity.LocationDto;
import com.kh.petmily.entity.PetDto;
import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.entity.SkillNameDto;
import com.kh.petmily.vo.MemberVO;
import com.kh.petmily.vo.petsitter.PetsitterVO;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getMtotal() {
		return sqlSession.selectOne("admin.membercount");
	}
	
	@Override
	public int getPtotal() {
		return sqlSession.selectOne("admin.petsittercount");
	}
	
	@Override
	public int getAtotal() {
		return sqlSession.selectOne("admin.admincount");
	}
	
	// 회원리스트
	@Override
	public List<MemberVO> getMemberList() {		
		return sqlSession.selectList("admin.memberList");
	}

	// 펫시터 리스트
	@Override
	public List<PetsitterVO> getPetsitterList() {		
		return sqlSession.selectList("admin.petsitterList"); 
	}

	// 펫시터 휴면 리스트
	@Override
	public List<PetsitterVO> getPetsitterSleep() {
		return sqlSession.selectList("admin.petsleepList");
	}
	
	// 펫시터 신청한 회원 검색
	@Override
	public List<PetsitterVO> getPetsitterApplyList() {
		return sqlSession.selectList("admin.petsitterApplyList"); 
	}

	// 펫시터 승인
	@Override
	public void petsitterApply(String sitter_id) {
		sqlSession.update("admin.petsitterApply", sitter_id);
		
	}
	// 펫시터 거부 (삭제)
	@Override
	public void petsitterNegative(String sitter_id, int sitter_no) {
		// 펫시터 삭제
		sqlSession.delete("admin.petsitterNegative", sitter_id);
		// 등록 지역 삭제
		sqlSession.delete("admin.locationNegative", sitter_no);
		// 등록 돌봄가능 동물 삭제
		sqlSession.delete("admin.carePetTypeNegative", sitter_no);
		// 등록 스킬 삭제
		sqlSession.delete("admin.skillsNegative", sitter_no);
		// 등록 환경 삭제
		sqlSession.delete("admin.careConditionNegative", sitter_no);		
	}

	// 펫시터 단일 검색
	@Override
	public PetsitterVO petsitterSearchOne(String sitter_id) {
		return sqlSession.selectOne("admin.petsitterSearchOne", sitter_id);
	}	

	// 블랙리스트 등록 시퀀스 번호 미리 가지고 오기
	public int blackListsno() {
		return sqlSession.selectOne("admin.blackListsno");
	}
	
	// 펫시터 경고 등록 (블랙리스트 등록)
	@Override
	public void blackSitter(PetsitterDto petsitterDto, PetsitterVO petsitterVO
											,BlackListContentDto blackListContentDto) {
		// 펫시터 상태 휴면으로 변경
		sqlSession.update("admin.sitter_status", petsitterDto);
		// 블랙리스트 테이블에 등록
		sqlSession.insert("admin.blackList", petsitterVO);		
		// 블랙리스트 컨텐츠 테이블에 등록
		sqlSession.insert("admin.blackListContent", blackListContentDto);
	}
	// 회원 경고 등록
	@Override
	public void blackMember(BlackListDto blackListDto,
			BlackListContentDto blackListContentDto) {
		sqlSession.insert("admin.blackListMember", blackListDto);
		// 블랙리스트 컨텐츠 테이블에 등록
		sqlSession.insert("admin.blackListContent", blackListContentDto);
	}

	// 펫시터 상태 변환
	@Override
	public void sitter_status(PetsitterDto petsitterDto) {		
		sqlSession.update("admin.sitter_status", petsitterDto);		
	}
	// 블랙리스트 테이블에서 권한 변경
	@Override
	public void blackListgradechange(String sitter_id) {
		sqlSession.update("admin.blackListgradechange", sitter_id);
	}


	// 펫시터 옵션 등록 : 돌봄가능동물
	// 불러오기
	@Override
	public List<CarePetTypeNameDto> getCarePetType() {
		return sqlSession.selectList("admin.getCarePetType") ;
	}
	// 펫시터 옵션 등록 : 스킬 이름
	// 불러오기
	@Override
	public List<SkillNameDto> getPetSkills() {		
		return sqlSession.selectList("admin.getPetSkills");
	}
	// 펫시터 옵션 등록 : 환경 목록
	// 불러오기
	@Override
	public List<CareConditionNameDto> getPetCareCondition() {		
		return sqlSession.selectList("admin.getPetCareCondition");
	}
	
	
	//등록하기
	@Override
	public void carePetTypeI(String care_type) {
		sqlSession.insert("admin.carePetType", care_type);
	}
	// 삭제하기
	@Override
	public void carePetTypeD(int care_type_no) {	
		sqlSession.delete("admin.carePetTypeDelete", care_type_no);
	}


	// 등록하기
	@Override
	public void petSkillNameI(String skill_name) {
		sqlSession.insert("admin.petSkillNameI", skill_name);	
	}
	// 삭제하기
	@Override
	public void petSkillNameD(int skill_no) {
		sqlSession.delete("admin.petSkillNameD", skill_no);	
	}
	
	
	// 등록하기
	@Override
	public void petCareConditionI(String care_condition_name) {
		sqlSession.insert("admin.petCareConditionI", care_condition_name);
	}
	// 삭제하기
	@Override
	public void petCareConditionD(int care_condition_no) {
		sqlSession.delete("admin.petCareConditionD", care_condition_no)	;
	}

	// 펫시터 블랙리스트 불러오기
	@Override
	public List<BlackListDto> getSitterBlackList() {
		return sqlSession.selectList("admin.getSitterBlackList");
	}

	// 펫시터 블랙리스트 불러오기
	@Override
	public List<BlackListDto> getMemberBlackList() {
		return sqlSession.selectList("admin.getMemberBlackList");
	}

				// 페시터 회원 정보 (단일조회)
				@Override
				public PetsitterVO getPetsitterdetail(int pet_sitter_no) {		
					return sqlSession.selectOne("admin.getPetsitterdetail", pet_sitter_no);
				}
				// 펫시터 회원정보 (지역) 
				@Override
				public List<LocationDto> getPetsitterdetailLocation(int pet_sitter_no) {
					return sqlSession.selectList("admin.getPetsitterdetailLocation", pet_sitter_no);
				}
				// 펫시터 회원정보 (돌봄가능동물) 
				@Override
				public List<CarePetTypeNameDto> getPetsitterdetailCarePet(int pet_sitter_no) {
					return sqlSession.selectList("admin.getPetsitterdetailCarePet", pet_sitter_no);
				}
				// 펫시터 회원정보 (스킬) 
				@Override
				public List<SkillNameDto> getPetsitterdetailSkills(int pet_sitter_no) {
					return sqlSession.selectList("admin.getPetsitterdetailSkills", pet_sitter_no);
				}
				// 펫시터 회원정보 (펫시터 환경) 
				@Override
				public List<CareConditionNameDto> getPetsitterdetailCareCondition(int pet_sitter_no) {
					return sqlSession.selectList("admin.getPetsitterdetailCareCondition", pet_sitter_no);
				}

				
	// 회원 디테일 페이지 정보
	@Override
	public MemberVO getMemberdetail(String id) {
		return sqlSession.selectOne("admin.getMemberdetail", id);
	}
	// 회원 정보 페이지에 보여줄 반려동물 
	@Override
	public List<PetDto> getPets(String id) {					
		return sqlSession.selectList("admin.getPets", id);
	}
	
	// 회원관리 페이지에서 회원 검색
	@Override
	public List<MemberVO> memberSearchList(String type, String keyword) {
		Map<String, String> param = new HashMap();
		param.put("type", type);
		param.put("keyword", keyword);		
		return sqlSession.selectList("admin.memberSearchList", param);
	}
	
	// 펫시터 관리 페이지에서 펫시터 검색
	@Override
	public List<PetsitterVO> petsitterSearch(String type, String keyword) {
		Map<String, String> param = new HashMap();
		param.put("type", type);
		param.put("keyword", keyword);		
		return sqlSession.selectList("admin.petsitterSearchList", param);	
	}
	
	// 펫시터 관리 페이지에서 펫시터 신청 검색
	@Override
	public List<PetsitterVO> petsitterSearchApply(String type, String keyword) {
		Map<String, String> param = new HashMap();
		param.put("type", type);
		param.put("keyword", keyword);		
		return sqlSession.selectList("admin.petsitterSearchApply", param);	
	}

	// 펫시터 관리 페이지에서 휴면펫시터 검색
	@Override
	public List<PetsitterVO> petsitterSearchSleep(String type, String keyword) {
		Map<String, String> param = new HashMap();
		param.put("type", type);
		param.put("keyword", keyword);		
		return sqlSession.selectList("admin.petsitterSearchSleep", param);	
	}
	
	// 블랙리스트 등록 여부 검사
	@Override
	public int blackLsitcheck(String id) {		
		return sqlSession.selectOne("admin.blackLsitcheck", id);
	}

	// 블랙리스트 회원 탈퇴 (삭제)
	@Override
	public void memberdelete(String id) {
		sqlSession.delete("admin.memberdelete", id);		
	}

	// 블랙리스트에서 삭제
	@Override
	public void blackListdelete(String id) {
		sqlSession.delete("admin.blackListdelete", id);		
	}
	// 펫시터 블랙리스트 탈퇴시 등급변경
	@Override
	public void petsittersecession(String sitter_id) {
		sqlSession.update("admin.petsittersecession", sitter_id);
		
	}

	// 블랙리스트 디테일 페이지 내용 가지고 오기
	@Override
	public PetsitterVO blackListdetailSearch(String id) {		
		return sqlSession.selectOne("admin.blackListdetailSearch", id);
	}
	// 블랙리스트컨텐츠 내용 가지고 오기
	@Override
	public List<BlackListContentDto> blacklistcontent(String id) {		
		return sqlSession.selectList("admin.blacklistcontent", id);
	}
	
	
	// 펫시터 가진 소개정보가 몇개인지 가지고오기
	@Override
	public List<InfoImageDto> sitterInfoimage(int pet_sitter_no) {		
		return sqlSession.selectList("admin.sitterInfoimage", pet_sitter_no);
	}
	// 펫시터 소개이미지 가지고 오기(1장씩 요청)
	@Override
	public InfoImageDto getInfoImage(int info_image_no) {	
		return sqlSession.selectOne("admin.getInfoImage",  info_image_no);
	}
	// 펫시터 소개이미지 실제로 가지고오기(1장씩 요청)
	@Override
	public byte[] physicalInfoImage(String savename) throws IOException {		
		File file = new File("D:/upload/info", savename);
		byte[] data = FileUtils.readFileToByteArray(file);
		return data;
	}

	
	// 펫시터가 가진 신분증 정보 가지고오기
	@Override
	public IdCardFileDto sitterIdcardimg(int pet_sitter_no) {		
		return sqlSession.selectOne("admin.sitterIdcardimg", pet_sitter_no);
	}
	// 펫시터 가진 신분증 이미지 가지고 오기 (1장)
	@Override
	public IdCardFileDto getSitteridcardimage(int id_image_no) {	
		return sqlSession.selectOne("admin.getSitteridcardimage", id_image_no);
	}
	// 펫시터 신분증 실제로 가지고오기(1장씩 요청)
	@Override
	public byte[] physicalidcardimage(String savename) throws IOException {		
		File file = new File("D:/upload/idCard", savename);
		byte[] data = FileUtils.readFileToByteArray(file);
		return data;
	}
	
	
	// 펫시터 가진 라이센스 정보 가지고 오기
	@Override
	public  LicenseFileDto sitterLicenseimge(int pet_sitter_no) {
		return sqlSession.selectOne("admin.sitterLicenseimge", pet_sitter_no);
	}
	// 펫시터 가진 라이센스 이미지 가지고 오기
	@Override
	public  LicenseFileDto getSitterlicenseimage(int license_image_no) {	
		return sqlSession.selectOne("admin.getSitterLicenseimge", license_image_no);
	}
	// 펫시터 신분증 실제로 가지고오기(1장씩 요청)
	@Override
	public byte[] physicallicenseimage(String savename) throws IOException {		
		File file = new File("D:/upload/license", savename);
		byte[] data = FileUtils.readFileToByteArray(file);
		return data;
	}
	
	// 펫시터 가진 통장사본 정보 가지고 오기
	@Override
	public BankImageDto sitterBankimge(int pet_sitter_no) {	
		return sqlSession.selectOne("admin.sitterBankimge", pet_sitter_no);
	}
	// 펫시터 가진 통장사본 이미지 가지고 오기
	@Override
	public BankImageDto getSitterbankimage(int bank_image_no) {		
		return sqlSession.selectOne("admin.getSitterBankimge", bank_image_no);
	}
	// 펫시터 통장사본 실제로 가지고오기(1장씩 요청)
	@Override
	public byte[] physicallbankimage(String savename) throws IOException {
		File file = new File("D:/upload/license", savename);
		byte[] data = FileUtils.readFileToByteArray(file);
		return data;
	}
	
	
	
	// 회원 및 펫시터 복귀(블랙리스트에서 삭제)
	@Override
	public void gradeComback(String black_id) {
		sqlSession.update("admin.gradeComback", black_id);		
	}








	



	

}
