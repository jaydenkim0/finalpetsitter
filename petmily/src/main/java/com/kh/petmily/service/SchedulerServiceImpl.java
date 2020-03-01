package com.kh.petmily.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.petmily.entity.AccountDto;
import com.kh.petmily.repository.AdminDao;
import com.kh.petmily.vo.AccountVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SchedulerServiceImpl implements SchedulerService{

	@Autowired
	private AdminDao adminDao;
	
	@Override
	@Scheduled(cron =" 0 0 09 1 * * " )
	public void accountPetsitter() {		
		log.info("스케쥴 실행!");
		// 1. 펫시터 아이디 구해오기(전월에 결제금액이 있는 펫시터만 구해오기)
		List<AccountVO> list = adminDao.findpetsitteraccount();
		for (AccountVO accountOne :list) {
				// 2. 펫시터 넘버로 아이디 구해오기
				int sitter_no = accountOne.getReservation_sitter_no();
				String sitter_id = adminDao.getSitter_id(sitter_no);
				// 3. 펫시터 결제건수 구해오기
				int count = adminDao.getCount(sitter_no);
				// 4. 펫시터 최종 매출 금액 구해오기 (완료된 금액에 취소된 금액 더하기)			
				int paymentP = adminDao.getPaymentPlus(sitter_no);
				int paymentM = adminDao.getPaymentMin(sitter_no);
				int total_pay = paymentP + paymentM;
				// 5. 펫시터 수수료 구해오기
				double fees = adminDao.getFees();	
				//6. 입금금액 정하기
				int pay =  (total_pay - ((int)fees * 100));
				// 펫시터 별로 저장
				AccountDto accountDto = AccountDto.builder()
						.account_sitter_id(sitter_id)
						.account_count(count)
						.account_total_pay(total_pay)
						.account_fees(fees)	
						.account_pay(pay)					
						.build();			
				// account에 저장하기
				adminDao.setaccountPetsitter(accountDto);
		}
	}
	

}
