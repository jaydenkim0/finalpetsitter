package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AccountDto {
	
	// 결제정보 추가할 것이있는지 확인 
	//	account_info 는 무슨정보를 넣는지 확인
	private int acoount_no;
	private String account_sitter_id; //pet_sitter 테이블의 sitter_id
	private int account_count; // 전월 결제 건 수 
	private int account_total_pay; // 전월 토탈 금액
	private int account_fees; // 전월 적용 수수료
	private String account_date; // 전월 정산 일자


}
