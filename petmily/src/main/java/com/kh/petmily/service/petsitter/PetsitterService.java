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
	void regist(PetsitterRegistVO vo) throws IllegalStateException, IOException;//펫시터 전체 항목 등록 
	List<PetsitterGetListVO> getList(int pet_sitter_no);//펫시터 전체 항목 조회
	// 리스트 불러오기
	List<SitterlocationVO> locationListAll(int start, int end, String cityKeyword, String areaKeyword);
	// 카운트
	int countlocation(String cityKeyword, String areaKeyword);
	List<PetDto> getPet(String id);
	
	void reservation(int reservation_no,ReservationVO reservationVO);//예약 등록
	PetsitterVO get(int pet_sitter_no);//펫시터 단일 조회
	List<ReservationListVO> getReservation(int reservation_no);//펫시터 예약 조회
}
