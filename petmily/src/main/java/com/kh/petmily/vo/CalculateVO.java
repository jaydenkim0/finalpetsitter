package com.kh.petmily.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CalculateVO {
	
	// Account 정산 페이지 
	private int totalPayment;	// 토탈 결제 금액
	private int totalCancelPayment; // 토탈 취소 금액
	private int reservatToTalCount; // 견적 신청 수
	private int reservatApplyToTalCount; // 견적 승인 수
	private int reservatWaitToTalCount; // 견적 대기 수
	private int totalPaymentCount; // 결제 완료 수
	private int totalPaymentCancelCount; // 결제 취소 수
	
	// 펫시터 별 정산 정보
	private int acoount_no;
	private String account_sitter_id; //pet_sitter 테이블의 sitter_id
	private int account_count; // 전월 결제 건 수 
	private int account_total_pay; // 전월 토탈 금액
	private int account_fees; // 전월 적용 수수료
	private String account_date; // 전월 정산 일자

}
