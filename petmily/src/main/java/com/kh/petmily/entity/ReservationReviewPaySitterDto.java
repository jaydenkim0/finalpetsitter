package com.kh.petmily.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ReservationReviewPaySitterDto {
	
	//Reservation과 Petsitter table view 생성했음.------------------------
	
	//Reservation
	private int reservation_no;
	private String member_id; //member  테이블의 id
	private int reservation_sitter_no; // pet_sitter 테이블의 pet_sitter_no
	private String matching_time; // 돌봄 서비스 받는 일자시간
	private String pet_name; // 돌봄 서비스 받을 반려동물이름
	private String ect; // 기타정보
	private String reservation_status; // '대기', '승인' 만 입력가능, 승인시 정산을 거쳐서 결제처리 가능 

	public String getTotalMatchingTime()throws Exception{
		SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		Date date = read.parse(matching_time);
		SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일");
		String time = write.format(date);
		return time;	
	}
	
	//Petsitter
	private String sitter_id; // member 테이블의 id 

	//--------------------------------------------------------------------
	
	
	//Pay
	private String pay_status; // 준비', '완료', '취소' 만 입력가능	
	
	//Review
	private int review_no; // 리뷰 번호

}
