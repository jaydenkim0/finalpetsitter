package com.kh.petmily.service;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.kh.petmily.entity.BankImageDto;
import com.kh.petmily.entity.BlackListContentDto;
import com.kh.petmily.entity.BlackListDto;
import com.kh.petmily.entity.CareConditionNameDto;
import com.kh.petmily.entity.CarePetTypeNameDto;
import com.kh.petmily.entity.IdCardFileDto;
import com.kh.petmily.entity.InfoImageDto;
import com.kh.petmily.entity.LicenseFileDto;
import com.kh.petmily.entity.LocationDto;
import com.kh.petmily.entity.PayinfoDto;
import com.kh.petmily.entity.PetDto;
import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.entity.SkillNameDto;
import com.kh.petmily.repository.AdminDao;
import com.kh.petmily.vo.MemberVO;
import com.kh.petmily.vo.QnaVO;
import com.kh.petmily.vo.petsitter.PetsitterVO;

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
	// 블랙리스트 회원 탈퇴 (삭제)
	@Override
	public void memberdelete(String id) {
		adminDao.memberdelete(id);		
	}
	
	// 블랙리스트에서 삭제
	@Override
	public void blackListdelete(String id) {
		adminDao.blackListdelete(id);
	}


	// 펫시터 단일 검색
	@Override
	public PetsitterVO PetsitterSearchOne(String sitter_id) {
		return adminDao.petsitterSearchOne(sitter_id);
	}

	// 펫시터 블랙리스트 등록 기능
	@Override
	public void blackSitter(PetsitterDto petsitterDto, String black_content	) {
		
		// 펫시터 상태 휴면으로 변경		
		// 펫시터 단일 검색으로 정보 갖고 오기
		String sitter_id = petsitterDto.getSitter_id();
		PetsitterVO petsitterVO = adminDao.petsitterSearchOne(sitter_id);					
		
		// 블랙시트 테이블에 등록
		BlackListContentDto blackListContentDto =BlackListContentDto
				.builder()				
				.black_content_id(sitter_id)
				.black_content(black_content)
				.black_content_grade(petsitterVO.getGrade())
				.build();
				
		adminDao.blackSitter(petsitterDto, petsitterVO, blackListContentDto);
		
	}	
	// 멤버 블랙리스트 등록 기능
	@Override
	public void blackMember(String id, String black_content) {

	
		// 회원 단일 검색으로 정보 갖고 오기
		MemberVO memberVO = adminDao.getMemberdetail(id);
		System.out.println("memberVO = " + memberVO);
		BlackListDto blackListDto = BlackListDto.builder()				
				.black_id(id)				
				.black_name(memberVO.getName())
				.black_phone(memberVO.getPhone())
				.black_grade(memberVO.getGrade())
				.build();
		System.out.println("blackListDto = " + blackListDto);
		BlackListContentDto blackListContentDto =BlackListContentDto
				.builder()				
				.black_content_id(id)
				.black_content(black_content)
				.black_content_grade(memberVO.getGrade())
				.build();
		System.out.println("blackListContentDto = " + blackListContentDto);
		adminDao.blackMember(blackListDto, blackListContentDto);
	}
	
	// 펫시터 블랙리스트 탈퇴시 등급변경
	@Override
	public void petsittersecession(String sitter_id) {	
		adminDao.petsittersecession(sitter_id);
	}
	
	// 펫시터 상태 변환
	@Override
	public void sitter_status(PetsitterDto petsitterDto) {		
		adminDao.sitter_status(petsitterDto);		
	}
	// 블랙리스트 테이블에서 권한 변경
	@Override
	public void blackListgradechange(String sitter_id) {
		adminDao.blackListgradechange(sitter_id);
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

	// 회원 디테일 페이지 
	@Override
	public MemberVO getMemberdetail(String id) {
		return adminDao.getMemberdetail(id);
	}
	// 회원 정보 페이지에 보여줄 반려동물 
	@Override
	public List<PetDto> getPets(String id) {		
		return adminDao.getPets(id);
	}

	// 블랙리스트 여부 검사
	@Override
	public boolean blackLsitcheck(String id) {		
		int result = adminDao.blackLsitcheck(id);		
		return result == 0 ? false:true;
	}
	
	// 블랙리스트 디테일 페이지 내용 가지고 오기
	@Override
	public PetsitterVO blackListdetail(String id) {			
		return adminDao.blackListdetailSearch(id);
	}
	// 블랙리스트컨텐츠 내용 가지고 오기
	@Override
	public List<BlackListContentDto> blacklistcontent(String id) {	
		return adminDao.blacklistcontent(id);
	}
	
	// 펫시터 가진 소개정보가 몇개인지 가지고오기
	@Override
	public List<InfoImageDto> sitterInfoimageAll(int pet_sitter_no) {		
		return adminDao.sitterInfoimage(pet_sitter_no);
	}
	// 펫시터 소개이미지 가지고 오기(사진정보 1개씩 가지고 오기)
	@Override
	public ResponseEntity<ByteArrayResource> sitterInfoimage(int info_image_no) throws IOException {
//		ResponseEntity : 스프링에서 응답해줄데이터가 담긴 상자
//		ByteArrayResource : 스프링에서 관리할 수 있는 Byte 형식의 데이터 셋		
//		파일(DB)정보를 불러온다 : InfoImageDto		
		InfoImageDto infoImage = adminDao.getInfoImage(info_image_no);		
//		실제파일을 불러온다 :  physicalInfoImage		
		byte[] data =  adminDao.physicalInfoImage(infoImage.getSavename());	
//		헤더설정 및 전송은 스프링의 방식으로 진행
		ByteArrayResource resource = new ByteArrayResource(data);		

		return	ResponseEntity.ok()
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.contentLength(infoImage.getFilesize())
				.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
				.header("Content-Disposition",	"attachment; filename=\""
					+URLEncoder.encode(infoImage.getUploadname(), "UTF-8")
					+"\"")
				.body(resource);		
	}

	
	// 펫시터가 가진 신분증 정보 가지고오기
	@Override
	public IdCardFileDto sitterIdcardimg(int pet_sitter_no) {		
		return adminDao.sitterIdcardimg(pet_sitter_no);
	}
	// 펫시터 가진 신분증 이미지 가지고 오기 (1장)
	@Override
	public ResponseEntity<ByteArrayResource> sitteridcardimage(int id_image_no) throws IOException {	
		IdCardFileDto idcardImage = adminDao.getSitteridcardimage(id_image_no);				
		byte[] data =  adminDao.physicalidcardimage(idcardImage.getSavename());		
		ByteArrayResource resource = new ByteArrayResource(data);		
		return	ResponseEntity.ok()
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.contentLength(idcardImage.getFilesize())
				.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
				.header("Content-Disposition",	"attachment; filename=\""
					+URLEncoder.encode(idcardImage.getUploadname(), "UTF-8")
					+"\"")
				.body(resource);		
	}
	
	
	// 펫시터 가진 라이센스 정보 가지고 오기
	@Override
	public  LicenseFileDto sitterLicenseimge(int pet_sitter_no) {	
		return adminDao.sitterLicenseimge(pet_sitter_no);
	}
	// 펫시터 가진 라이센스 이미지 가지고 오기 (1장)
	@Override
	public ResponseEntity<ByteArrayResource> sitterlicenseimage(int license_image_no) throws IOException {
		LicenseFileDto LocationImage = adminDao.getSitterlicenseimage(license_image_no);				
		byte[] data =  adminDao.physicallicenseimage(LocationImage.getSavename());		
		ByteArrayResource resource = new ByteArrayResource(data);		
		return	ResponseEntity.ok()
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.contentLength(LocationImage.getFilesize())
				.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
				.header("Content-Disposition",	"attachment; filename=\""
					+URLEncoder.encode(LocationImage.getUploadname(), "UTF-8")
					+"\"")
				.body(resource);		
	}
	
	// 펫시터 가진 통장사본 정보 가지고 오기
	@Override
	public BankImageDto sitterBankimge(int pet_sitter_no) {		
		return adminDao.sitterBankimge(pet_sitter_no);
	}
	// 펫시터 가진 통장사본 이미지 가지고오기 (1장)
	@Override
	public ResponseEntity<ByteArrayResource> sitterbankimage(int bank_image_no) throws IOException {		
		BankImageDto bankImage = adminDao.getSitterbankimage(bank_image_no);				
		byte[] data =  adminDao.physicallbankimage(bankImage.getSavename());		
		ByteArrayResource resource = new ByteArrayResource(data);		
		return	ResponseEntity.ok()
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.contentLength(bankImage.getFilesize())
				.header(HttpHeaders.CONTENT_ENCODING, "UTF-8")
				.header("Content-Disposition",	"attachment; filename=\""
					+URLEncoder.encode(bankImage.getUploadname(), "UTF-8")
					+"\"")
				.body(resource);	
	}
	
	
	// 회원 및 펫시터 복귀(블랙리스트에서 삭제)
	@Override
	public void gradeComback(String black_id) {
		adminDao.gradeComback(black_id);
		
	}
	
	
	///////////////////////////////////////////////////	


	// 회원 페이징 리스트
	@Override
	public List<MemberVO> memberListAll(int start, int end, String searchOption, String keyword) {	
		return adminDao.memberListAll(start, end, searchOption, keyword);
	}
	// 회원 리스트 총 카운트 불러오기(페이징에 필요)
	@Override
	public int countAricle(String searchOption, String keyword) {	
		return adminDao.countAricle(searchOption, keyword);
	}
	
	// 펫시터 리스트 전체 목록
	@Override
	public List<PetsitterVO> petsitterListAll(int start, int end, String searchOption, String keyword) {
		return adminDao.petsitterListAll(start, end, searchOption, keyword);
	}
	// 페시터 리스트 총 카운트 불러오기 (페이징에 필요)
	@Override
	public int countAriclePetsitter(String searchOption, String keyword) {
		return adminDao.countAriclePetsitter(searchOption, keyword);
	}

	// 펫시터 승인 리스트 전체 목록
	@Override
	public List<PetsitterVO> petsitterApplyListAll(int start, int end, String searchOption, String keyword) {
		return adminDao.petsitterApplyListAll(start, end, searchOption, keyword);
	}
	// 페시터 승인 리스트 총 카운트 불러오기 (페이징에 필요)
	@Override
	public int countAriclePetsitterApply(String searchOption, String keyword) {
		return adminDao.countAriclePetsitterApply(searchOption, keyword);
	}

	// 휴면 펫시터 리스트 전체 목록
	@Override
	public List<PetsitterVO> petsitterSleepListAll(int start, int end, String searchOption, String keyword) {
		return adminDao.petsitterSleepListAll(start, end, searchOption, keyword);
	}
	// 휴면 펫시터 리스트 카운트 불러오기 (페이징에 필요)
	@Override
	public int countAriclePetsitterSleep(String searchOption, String keyword) {
		return adminDao.countAriclePetsitterSleep(searchOption, keyword);
	}
	
	// 경고 회원 리스트 전체 목록
	@Override
	public List<PetsitterVO> blackMemberListAll(int start, int end, String searchOption, String keyword) {
		return adminDao.blackMemberListAll(start, end, searchOption, keyword);
	}
	// 경고 회원 리스트 카운트
	@Override
	public int countAricleBlackMember(String searchOption, String keyword) {
		return adminDao.countAricleBlackMember(searchOption, keyword);
	}

	@Override
	public List<PetsitterVO> blackPetsitterListAll(int start, int end, String searchOption, String keyword) {
		return adminDao.blackPetsitterListAll(start, end, searchOption, keyword);
	}

	@Override
	public int countAricleBlackPetsitter(String searchOption, String keyword) {
		return adminDao.countAricleBlackPetsitter(searchOption, keyword);
	}

	// 가격 옵션 리스트 불러오기
	@Override
	public List<PayinfoDto> getAccountlist() {	
		return adminDao.getAccountlist();
	}
	// 수수료 옵션 리스트 불러오기
	@Override
	public List<PayinfoDto> getFeesList() {	
		return adminDao.getFeesList();
	}
	// 가격 옵션 등록하기
	@Override
	public void accountOtionAdd(PayinfoDto payinfoDto) {
		adminDao.accountOtionAdd(payinfoDto);		
	}
	// 가격 옵션 삭제
	@Override
	public void accountoptiondelete(int payinfo_no) {
		adminDao.accountoptiondelete(payinfo_no);		
	}

	// 신고게시판 불러오기
	@Override
	public List<QnaVO> getBlackreport(int start, int end, String searchOption, String keyword) {
		return adminDao.getBlackreport(start, end, searchOption, keyword);
	}
	// 신고게시판 카운트
	@Override
	public int countAriclegetBlackreport(String searchOption, String keyword) {
		return adminDao.countAriclegetBlackreport(searchOption, keyword);
	}



	

	
	
		
}









