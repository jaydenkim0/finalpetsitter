package com.kh.petmily.repository.petsitter;

import java.util.List;

import com.kh.petmily.entity.ReservationDto;
import com.kh.petmily.entity.ReservationPayDto;
import com.kh.petmily.vo.petsitter.ReservationAllVO;
import com.kh.petmily.vo.petsitter.ReservationListVO;
import com.kh.petmily.vo.petsitter.ReservationVO;

public interface ReservationDao {
	int getSequenceReservation();//예약 번호 구하기
	void registReservation(ReservationDto reservationDto);//예약 등록
	void registPay(List<Integer>payinfo_no, ReservationPayDto reservationPayDto);//예약 금액,사용 시간 등록
	List<ReservationListVO> getReservation(int reservation_no);//펫시터 예약 조회
	
	// 예약 상태 승인으로 변경
	void reservationStatusUpdate(int reservation_no);
	// 예약 내용 삭제
	void reservationDelete(int reservation_no);
	
}
