package com.kh.petmily.service.petsitter;

import java.io.IOException;
import java.util.List;

import com.kh.petmily.entity.PetDto;
import com.kh.petmily.vo.petsitter.PetsitterGetListVO;
import com.kh.petmily.vo.petsitter.PetsitterRegistVO;
import com.kh.petmily.vo.petsitter.PetsitterVO;
import com.kh.petmily.vo.petsitter.ReservationAllVO;
import com.kh.petmily.vo.petsitter.ReservationListVO;
import com.kh.petmily.vo.petsitter.ReservationVO;
import com.kh.petmily.vo.petsitter.SitterlocationVO;

public interface PetsitterService {
//등록(C)
	//펫시터 전체 항목 등록 
	void regist(PetsitterRegistVO vo) throws IllegalStateException, IOException;
	//예약 등록
	void reservation(int reservation_no,ReservationVO reservationVO);

//조회(R)	
	//펫시터 전체 항목 조회
	List<PetsitterGetListVO> getList(int pet_sitter_no);
	// 리스트 불러오기
	List<SitterlocationVO> locationListAll(int start, int end, String cityKeyword, String areaKeyword);
	// 카운트
	int countlocation(String cityKeyword, String areaKeyword);
	//펫시터 펫 정보 조회
	List<PetDto> getPet(String id);
	//예약 번호 구해오기
	int getSequenceReservation();
	//펫시터 단일 조회(펫시터 번호)
	PetsitterVO noGet(int pet_sitter_no);
	//펫시터 단일 조회(아이디)
	PetsitterVO idGet(String id);
	//펫시터 예약 조회
	ReservationListVO getReservation(int reservation_no);
	//각각 펫시터 예약 번호로 각각 펫시터 예약 조회
	List<ReservationListVO> getReservationSitter(int pet_sitter_no);
	
	
//수정(U)	
	// 예약 상태 승인으로 변경
	void reservationStatusUpdate(int reservation_no);
	//펫시터 전체 항목 수정
	void update(PetsitterRegistVO vo) throws IllegalStateException, IOException;
	//펫시터 상태 변경
	void updateStatus(int pet_sitter_no, String sitter_status);
	
//삭제(D)	
	// 예약 내용 삭제
	void reservationDelete(int reservation_no);
	
	// 펫시터 블랙리스트 카운트 여부
	int black_petsitter_count(String id);
	// 회원이 펫을 갖고 있는지 카운터로 확인
	int petscheck(String id);
	
}
