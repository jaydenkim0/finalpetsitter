package com.kh.petmily.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.petmily.entity.AccountDto;
import com.kh.petmily.repository.AdminDao;

@Service
public class SchedulerServiceImpl implements SchedulerService{

	@Autowired
	private AdminDao adminDao;
	
	@Override
//	@Scheduled()
	public void accountPetsitter() {
		
		// 1. 펫시터 아이디 구해오기(전월에 결제금액이 있는 펫시터만 구해오기)
		// 2. 펫시터 결제건수 구해오기 (완료된 금액에 취소된 금액 더하기)
		// 3. 펫시터 최종 매출 금액 구해오기
		// 4. 펫시터 수수료 구해오기
	
		
	
		// 펫시터 별로 저장
		AccountDto accountDto = AccountDto.builder()
				.account_sitter_id("518kje")
				.account_count(1)
				.account_total_pay(1)
				.account_fees(2)
				.build();			
		// account에 저장하기
		adminDao.setaccountPetsitter(accountDto);
	}

}
