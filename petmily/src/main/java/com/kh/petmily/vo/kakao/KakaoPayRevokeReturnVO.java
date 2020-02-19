package com.kh.petmily.vo.kakao;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//카카오 페이에서 결제 취소 시, 반환되는 값을 저장할 vo

@Data @Builder 
@NoArgsConstructor @AllArgsConstructor
public class KakaoPayRevokeReturnVO {
	String aid , //	Request 고유 번호
	tid , //	결제 고유 번호. 10자.
	cid , //	가맹점 코드. 20자
	status , //	결제상태값
	partner_user_id , //	가맹점 회원 id. 최대 100자.
	payment_method_type; // 결제 수단. CARD, MONEY 중 하나
	private KakaoPayAmountVO amount;
	private KakaoPayAmountVO canceled_amount;
	private KakaoPayAmountVO cancel_available_amount;
	private String 
	item_name , //	상품 이름. 최대 100자
	item_code;//	상품 코드. 최대 100자
	private int quantity;//	상품 수량
	private String created_at , //	결제 준비 요청 시각
	approved_at , //결제 승인 시각
	canceled_at , //	결제 취소 시각
	payload;//	Request로 전달한 값
	private int partner_order_id; //	가맹점 주문번호. 최대 100자.
}
