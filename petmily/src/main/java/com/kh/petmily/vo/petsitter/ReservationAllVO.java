package com.kh.petmily.vo.petsitter;

import java.text.SimpleDateFormat;
import java.util.Date;

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
	private String TotalMatchingTime;
	
	//예약 금액
	private int payinfo_no;
	private int pay_reservation_no;
	private int usage_time;
	private int start_time;
	
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
	
	//펫 프로필 이미지
	private int pet_image_no;
	private int pet_image_pet_no;
	
	//매칭타임 시간 합치기
		public String getTotalMatchingTimeWithFormat()throws Exception{
			SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
			Date date = read.parse(matching_time);
			SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일");
			String time = write.format(date);
			return time;
			
		}
}
