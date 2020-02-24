package com.kh.petmily.repository.petsitter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.ReservationDto;
import com.kh.petmily.entity.ReservationPayDto;
import com.kh.petmily.vo.petsitter.ReservationAllVO;
import com.kh.petmily.vo.petsitter.ReservationListVO;

@Repository
public class ReservationDaoImpl implements ReservationDao {

	@Autowired
	private SqlSession sqlSession;
	
	//예약 번호 시퀀스 구하기
	@Override
	public int getSequenceReservation() {
		int res_no = sqlSession.selectOne("petsitter.getSequenceReservation");
		return res_no;
	}
	
	//예약 등록
	@Override
	public void registReservation(ReservationDto reservationDto) {
		sqlSession.insert("petsitter.registReservation", reservationDto);
	}
	
	//예약 금액(예약 이름) 등록
	@Override
	public void registPay(List<Integer>payinfo_no,ReservationPayDto reservationPayDto) {
		
		List<ReservationPayDto> payinfoList = new ArrayList<>();

		for(Integer payno : payinfo_no) {
			payinfoList.add(ReservationPayDto.builder()
												.payinfo_no(payno)
												.pay_reservation_no(reservationPayDto.getPay_reservation_no())
												.usage_time(reservationPayDto.getUsage_time())
												.start_time(reservationPayDto.getStart_time())
												.build());
		}
		System.out.println(payinfoList.toString());		
		sqlSession.insert("petsitter.registPay", payinfoList);
	}
	
	//예약 목록 조회
	@Override
	public ReservationListVO getReservation(int reservation_no) {
//		return sqlSession.selectList("petsitter.getReservation", reservation_no);
		return sqlSession.selectOne("petsitter.getReservation", reservation_no);
	}

	// 예약 상태 승인으로 변경
	@Override
	public void reservationStatusUpdate(int reservation_no) {
		sqlSession.update("petsitter.reservationStatusUpdate", reservation_no);
	}
	// 예약 내용 삭제
	@Override
	public void reservationDelete(int reservation_no) {
		sqlSession.delete("petsitter.reservationDelete", reservation_no);
	}

	//펫시터 예약 번호 조회  
	@Override
	public List<Integer> getReservationNo(int pet_sitter_no) {
		//펫시터 예약 번호 가져오기
		List<Integer> reservation_no = sqlSession.selectList("petsitter.getReservationNo", pet_sitter_no);
		return reservation_no;
	}
	
	

}
