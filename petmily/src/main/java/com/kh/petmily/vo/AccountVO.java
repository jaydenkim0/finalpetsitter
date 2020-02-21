package com.kh.petmily.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AccountVO {
	
	// 예약 테이블
	private int reservation_no;
	private String member_id; //member  테이블의 id
	private int reservation_sitter_no; // pet_sitter 테이블의 pet_sitter_no
	private String matching_time; // 돌봄 서비스 받는 일자시간
	private String pet_name; // 돌봄 서비스 받을 반려동물이름
	private String ect; // 기타정보
	private String status; // '대기', '승인' 만 입력가능, 승인시 정산을 거쳐서 결제처리 가능 
	
	// 카카오페이 테이블
	private int pay_no;
	private String partner_order_id; //account 테이블의 acoount_no
	private String partner_user_id; // 돌봄서비스를 결제한 회원 member의 id 라 보면됨
	private String tid; // 결제 고유번호
	private String cid;  // 가맹점 코드 = TC0ONETIME
	private String item_name; // 상품명
	private int quantity; // 수량, 돌봄서비스는 수령이 없기때문에 기본값 1적용
	private int total_amount; // 상품 가격
	private int tax_free_amount;
	private String pay_joindate; // 준비, 완료, 취소 시간
	private String kakaopaystatus; // 준비', '완료', '취소' 만 입력가능
	private String aid; // 결제 이후에 발급되는 정보
	
	private int acoount_no;
	private int account_reser_no; //reservation 테이블의 reservation_no
	private String account_date; // 승인 받은 후 결제한 일자
	private String account_info; // 결제 정보
	
	// 사용시간
	private int usage_time;


}