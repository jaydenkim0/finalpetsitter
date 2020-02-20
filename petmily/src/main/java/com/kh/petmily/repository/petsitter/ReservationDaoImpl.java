package com.kh.petmily.repository.petsitter;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.ReservationDto;
import com.kh.petmily.entity.ReservationPayDto;
import com.kh.petmily.vo.petsitter.ReservationAllVO;

@Repository
public class ReservationDaoImpl implements ReservationDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getSequenceReservation() {
		int res_no = sqlSession.selectOne("petsitter.getSequenceReservation");
		return res_no;
	}

	@Override
	public void registReservation(ReservationDto reservationDto) {
		sqlSession.insert("petsitter.registReservation", reservationDto);
	}

	@Override
	public void registPay(List<Integer>payinfo_no,ReservationPayDto reservationPayDto) {
		
		List<ReservationPayDto> payinfoList = new ArrayList<>();

		for(Integer payno : payinfo_no) {
			payinfoList.add(ReservationPayDto.builder()
												.payinfo_no(payno)
												.pay_reservation_no(reservationPayDto.getPay_reservation_no())
												.usage_time(reservationPayDto.getUsage_time())
												.build());
		}
		System.out.println(payinfoList.toString());
		
		sqlSession.insert("petsitter.registPay", payinfoList);
	}

	@Override
	public List<ReservationAllVO> getReservation(int reservation_no) {
		return sqlSession.selectList("petsitter.getReservation", reservation_no);
	}

}
