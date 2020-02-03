package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PayDto {
	
	private int pay_no;
	private String partner_order_id; //account 테이블의 acoount_no
	private String partner_user_id; // 돌봄서비스를 결제한 회원 member의 id 라 보면됨
	private String tid; // 결제 고유번호
	private String cid;  // 가맹점 코드 = TC0ONETIME
	private String item_name; // 상품명
	private int quantity; // 수량, 돌봄서비스는 수령이 없기때문에 기본값 1적용
	private int total_amount; // 상품 가격
	private int tax_free_amount;
	private String process_time; // 준비, 완료, 취소 시간
	private String status; // 준비', '완료', '취소' 만 입력가능
	private String aid; // 결제 이후에 발급되는 정보

}
