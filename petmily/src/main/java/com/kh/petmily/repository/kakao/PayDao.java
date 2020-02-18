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

}
