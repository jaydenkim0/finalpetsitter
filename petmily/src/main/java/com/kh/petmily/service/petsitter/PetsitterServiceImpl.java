package com.kh.petmily.service.petsitter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.petmily.entity.CareConditionNameDto;
import com.kh.petmily.entity.CarePetTypeDto;
import com.kh.petmily.entity.CarePetTypeNameDto;
import com.kh.petmily.entity.LocationDto;
import com.kh.petmily.entity.PetDto;
import com.kh.petmily.entity.PetsitterDto;
import com.kh.petmily.entity.ReservationDto;
import com.kh.petmily.entity.ReservationPayDto;
import com.kh.petmily.entity.SkillNameDto;
import com.kh.petmily.repository.petsitter.CareConditionDao;
import com.kh.petmily.repository.petsitter.CarePetTypeDao;
import com.kh.petmily.repository.petsitter.LocationDao;
import com.kh.petmily.repository.petsitter.PetsitterDao;
import com.kh.petmily.repository.petsitter.ReservationDao;
import com.kh.petmily.repository.petsitter.SkillsDao;
import com.kh.petmily.vo.petsitter.PetsitterGetListVO;
import com.kh.petmily.vo.petsitter.PetsitterPetsVO;
import com.kh.petmily.vo.petsitter.PetsitterRegistVO;
import com.kh.petmily.vo.petsitter.PetsitterVO;
import com.kh.petmily.vo.petsitter.ReservationAllVO;
import com.kh.petmily.vo.petsitter.ReservationListVO;
import com.kh.petmily.vo.petsitter.ReservationVO;
import com.kh.petmily.vo.petsitter.SitterlocationVO;

@Service
public class PetsitterServiceImpl implements PetsitterService {

	//파일
	@Autowired
	private PetsitterFileService petSitterFileService;
	
	//펫시터
	@Autowired
	private PetsitterDao petsitterDao;
	//스킬
	@Autowired
	private SkillsDao skillsDao;
	//돌봄 환경
	@Autowired
	private CareConditionDao careConditionDao;
	//돌봄 가능 동물
	@Autowired
	private CarePetTypeDao carePetTypeDao;
	//지역
	@Autowired
	private LocationDao locationDao;
	
	//예약
	@Autowired
	private ReservationDao reservationDao;
	
	@Override
	public void regist(PetsitterRegistVO vo) throws IllegalStateException, IOException {
		//펫시터 번호 뽑고
		int no = petsitterDao.getSequence();
		//펫시터 번호 설정
		PetsitterDto petsitterDto = PetsitterDto.builder()
												.pet_sitter_no(no)
												.sitter_id(vo.getSitter_id())
												.info(vo.getInfo())
												.sitter_pets(vo.getSitter_pets())
												.sitter_matching_type(vo.getSitter_matching_type())
												.sitter_bankname(vo.getSitter_bankname())
												.sitter_bank_account(vo.getSitter_bank_account())
												.build();
		
		//펫시터 기본 정보 등록
		petsitterDao.regist(petsitterDto);
		
		//펫시터 스킬,돌봄 가능 동물종류,돌봄 환경  등록
		skillsDao.registSkills(no,vo.getSkills_name());
		carePetTypeDao.registType(no,vo.getCare_name());
		careConditionDao.registCondition(no,vo.getCare_condition_name());
		
		//펫시터 소개 이미지,신분증,증빙서류 등록
		petSitterFileService.uploadId(no, vo.getId_card_file());
		petSitterFileService.uploadLicense(no, vo.getLicense_file());
		petSitterFileService.uploadInfo(no, vo.getInfo_image());
		petSitterFileService.uploadBank(no, vo.getBank_image());
		
		
		//지역 정보 등록
		locationDao.registLocation(no,vo.getLocation_name());
		
	}
	
	@Override
	public List<PetsitterGetListVO> getList(int pet_sitter_no) {
		//펫시터 기본 정보 조회
		List<PetsitterVO> petsitterVO = petsitterDao.getList(pet_sitter_no);
		//펫시터 반려동물 조회
		List<PetsitterPetsVO> petsitterPetsVO = petsitterDao.getPetList(pet_sitter_no);
		
		//펫시터 스킬,돌봄 가능 동물종류,돌봄 환경  조회
		List<SkillNameDto> skillNameDto = skillsDao.getSkillList(pet_sitter_no);
		List<CareConditionNameDto> careConditionNameDto =careConditionDao.getCareConditionList(pet_sitter_no);
		List<CarePetTypeNameDto> carePetTypeNameDto = carePetTypeDao.getPetTypeList(pet_sitter_no);
		
		//지역 정보 조회
		List<LocationDto> locationDto = locationDao.getLocationList(pet_sitter_no);
		
		List<PetsitterGetListVO> petsitterList = new ArrayList<>();
		petsitterList.add(PetsitterGetListVO.builder()
											.petsitterVO(petsitterVO)
											.petsitterPetsVO(petsitterPetsVO)
											.skillNameDto(skillNameDto)
											.careConditionNameDto(careConditionNameDto)
											.carePetTypeNameDto(carePetTypeNameDto)
											.locationDto(locationDto)
											.build());
		
		
		return petsitterList;
	}


	// 지역 검색
	@Override
	public List<SitterlocationVO> locationListAll(int start, int end, String cityKeyword, String areaKeyword) {
		return petsitterDao.locationListAll(start, end, cityKeyword, areaKeyword) ;
	}

	@Override
	public int countlocation(String cityKeyword, String areaKeyword) {		
		return petsitterDao.countlocation(cityKeyword, areaKeyword) ;
	}


	@Override
	public List<PetDto> getPet(String id) {
		return petsitterDao.getPet(id);
	}

	@Override
	public void reservation(int reservation_no,ReservationVO reservationVO) {
		
		//예약 Dto
		ReservationDto reservationDto = ReservationDto.builder()
														.reservation_no(reservation_no)
														.member_id(reservationVO.getMember_id())
														.reservation_sitter_no(reservationVO.getReservation_sitter_no())
														.matching_time(reservationVO.getMatching_time())
														.pet_name(reservationVO.getPet_name())
														.ect(reservationVO.getEct())
														.build();
		//예약 금액 Dto
		ReservationPayDto reservationPayDto = ReservationPayDto.builder()
																.pay_reservation_no(reservation_no)
																.usage_time(reservationVO.getUsage_time())
																.start_time(reservationVO.getStart_time())
																.build();
		//예약 등록
		reservationDao.registReservation(reservationDto);
		//시간,금액 등록
		reservationDao.registPay(reservationVO.getPayinfo_no(),reservationPayDto);
		
	}



	@Override
	public PetsitterVO noGet(int pet_sitter_no) {
		PetsitterVO petsitterVO = petsitterDao.noGet(pet_sitter_no);
		return petsitterVO;
	}
	@Override
	public PetsitterVO idGet(String id) {
		PetsitterVO petsitterVO = petsitterDao.idGet(id);
		return petsitterVO;
	}
	@Override
	public ReservationListVO getReservation(int reservation_no) {
		ReservationListVO reservationList = reservationDao.getReservation(reservation_no);
		return reservationList;
	}
	// 예약 상태 승인으로 변경
	@Override
	public void reservationStatusUpdate(int reservation_no) {
		reservationDao.reservationStatusUpdate(reservation_no);
	}
	// 예약 내용 삭제
	@Override
	public void reservationDelete(int reservation_no) {
		reservationDao.reservationDelete(reservation_no);		
	}
	
	//펫시터 정보 수정
	@Override
	public void update(PetsitterRegistVO vo) throws IllegalStateException, IOException {
		
		//펫시터 번호 설정
		int pet_sitter_no = vo.getPet_sitter_no();
		//펫시터 Dto 설정
		PetsitterDto petsitterDto = PetsitterDto.builder()
												.pet_sitter_no(pet_sitter_no)
												.sitter_id(vo.getSitter_id())
												.info(vo.getInfo())
												.sitter_pets(vo.getSitter_pets())
												.sitter_matching_type(vo.getSitter_matching_type())
												.sitter_bankname(vo.getSitter_bankname())
												.sitter_bank_account(vo.getSitter_bank_account())
												.build();
		
		//펫시터 기본 정보 등록
		petsitterDao.updatePetsitter(petsitterDto);
		
		//펫시터 스킬,돌봄 가능 동물종류,돌봄 환경 ,활동지역 삭제
		skillsDao.deleteSkills(pet_sitter_no);
		carePetTypeDao.deleteType(pet_sitter_no);
		careConditionDao.deleteCondition(pet_sitter_no);
		locationDao.deleteLocation(pet_sitter_no);
		
		//펫시터 스킬,돌봄 가능 동물종류,돌봄 환경  등록
		skillsDao.registSkills(pet_sitter_no,vo.getSkills_name());
		carePetTypeDao.registType(pet_sitter_no,vo.getCare_name());
		careConditionDao.registCondition(pet_sitter_no,vo.getCare_condition_name());
	
		//펫시터 통장 사본  삭제
		petSitterFileService.deleteBankImage(pet_sitter_no);
		
		//펫시터 소개 이미지,통장 사본 이미지 등록
		petSitterFileService.uploadInfo(pet_sitter_no, vo.getInfo_image());
		petSitterFileService.uploadBank(pet_sitter_no, vo.getBank_image());
		
		
		//지역 정보 삭제
		//지역 정보 등록
		locationDao.registLocation(pet_sitter_no,vo.getLocation_name());
	}
	@Override
	public void updateStatus(int pet_sitter_no, String sitter_status) {
		petsitterDao.updateStatus(pet_sitter_no, sitter_status);
		
	}

	@Override
	public int getSequenceReservation() {
		return reservationDao.getSequenceReservation();
	}


	@Override
	public List<ReservationListVO> getReservationSitter(int pet_sitter_no) {
		return reservationDao.getReservationSitter(pet_sitter_no);
	}

	// 펫시터 블랙리스트 카운트 여부
	@Override
	public int black_petsitter_count(String id) {		
		return petsitterDao.black_petsitter_count(id) ;
	}
	
	// 회원이 펫을 갖고 있는지 카운터로 확인
	@Override
	public int petscheck(String id) {
		return petsitterDao.petscheck(id) ;
	}

	//펫시터 가입시 체크박스 내용 불러오기
	@Override
	public List<CarePetTypeNameDto> getCarePetTypeList() {		
		return petsitterDao.getCarePetTypeList();
	}
	@Override
	public List<SkillNameDto> getSkillNameList() {
		return petsitterDao.getSkillNameList();
	}
	@Override
	public List<CareConditionNameDto> getCareConditionName() {	
		return petsitterDao.getCareConditionName();
	}

	
	//	 펫시터 닉네임 아이디로 검색
	@Override
	public List<SitterlocationVO> SearchListAll(int start, int end, String searchOption, String keyword) {		
		return petsitterDao.SearchListAll(start, end, searchOption, keyword);
	}
	@Override
	public int countSearchList(String searchOption, String keyword) {		
		return petsitterDao.countSearchList(searchOption, keyword);
	}


	
	

}
