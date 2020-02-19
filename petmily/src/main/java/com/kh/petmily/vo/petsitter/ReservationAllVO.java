package com.kh.petmily.vo.petsitter;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class ReservationAllVO {
	//예약
	private int reservation_no;
	private String member_id; 
	private int reservation_sitter_no; 
	private String matching_time; 
	private String pet_name; 
	private String ect; 
	private String status;
	
	//예약 금액
	private int payinfo_no;
	private int pay_reservation_no;
	private int usage_time;
	
	//예약 내역
	private String payname; // 금액 이름
	private int payment; // 금액
	private String paystatus; // '가격', '수수료' 만 입력 가능

	//펫 정보
	private int pet_no;
	private String name; // 반려 동물 이름
	private int age; // 반려동물 나이
	private String type; // 반려동물의 종류
	private String pet_ect; // 반려동물의 기타 정보
}
