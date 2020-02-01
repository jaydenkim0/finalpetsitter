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
	private int account_reser_no; //reservation 테이블의 reservation_no
	private String account_date; // 승인 받은 후 결제한 일자
	private String account_info; // 결제 정보

}
