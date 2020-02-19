package com.kh.petmily.vo.kakao;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class KakaoPaySuccessReturnVO {
	private String aid, //	Request 고유 번호
	tid, //	결제 고유 번호
	cid, //	가맹점 코드
	sid,//	subscription id. 정기(배치)결제 CID로 결제요청한 경우 발급
	partner_user_id, //	가맹점 회원 id
	payment_method_type;//	결제 수단. CARD, MONEY 중 하나
	//amount, card_info는 제외
	private KakaoPayAmountVO amount;//	결제 금액 정보
	private KakaoPaySuccessCardInfoVO card_info;//	결제 상세 정보(결제수단이 카드일 경우만 포함)
	private String item_name,//	상품 이름. 최대 100자
	item_code;//	상품 코드. 최대 100자
	private int quantity;//	상품 수량
	private String created_at, //	결제 준비 요청 시각
	approved_at;//	결제 승인 시각
	private String payload;//	Request로 전달한 값
	private int partner_order_id; //	가맹점 주문번호
}

