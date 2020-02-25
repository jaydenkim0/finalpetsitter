package com.kh.petmily.repository.kakao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.petmily.entity.PayDto;

@Repository
public interface PayDao {
	void insertReady(PayDto payDto);
	
	void insertSuccess(PayDto payDto);
	
	List<PayDto> getList();
	
	PayDto get(int pay_no);
	
	void insertRevoke(PayDto paycancelDto);
	
	//예약 번호로 결제 정보 조회
	List<PayDto> getPay(int partner_order_id);
	//1시간 당 금액 조회
	int getHourPayment();

}
