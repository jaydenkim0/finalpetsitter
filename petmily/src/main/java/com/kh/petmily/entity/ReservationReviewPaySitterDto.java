package com.kh.petmily.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ReservationReviewPaySitterDto {
	
	//ReviewSitterDto  = Review+member(id)
	private int review_no; // 리뷰 번호
	private String review_writer; // member 테이블의 id
	private int review_sitter_no; // pet_sitter 테이블의  pet_sitter_no
	private String review_title; // 리뷰제목
	private String review_content; // 리뷰내용
	private int review_star; //리뷰 평점
	private String review_wdate;//리뷰 작성시간
	private int reservation_no;//reservation table의 reservation_no
	
	private String sitter_id;//join해서 구해온 sitter id
	
	
	
	//Reservation
	private String member_id; //member  테이블의 id
	private int reservation_sitter_no; // pet_sitter 테이블의 pet_sitter_no
	private String matching_time; // 돌봄 서비스 받는 일자시간
	private String pet_name; // 돌봄 서비스 받을 반려동물이름
	private String ect; // 기타정보
	private String reservation_status; // '대기', '승인' 만 입력가능, 승인시 정산을 거쳐서 결제처리 가능 
	private String TotalMatchingTime;	
	
	//Pay
	private String partner_order_id; //account 테이블의 acoount_no
	private String partner_user_id; // 돌봄서비스를 결제한 회원 member의 id 라 보면됨
	private String tid; // 결제 고유번호
	private String cid;  // 가맹점 코드 = TC0ONETIME
	private String item_name; // 상품명
	private int quantity; // 수량, 돌봄서비스는 수령이 없기때문에 기본값 1적용
	private int total_amount; // 상품 가격
	private int tax_free_amount;
	private String process_time; // 준비, 완료, 취소 시간
	private String pay_status; // 준비', '완료', '취소' 만 입력가능
	private String aid; // 결제 이후에 발급되는 정보
	
	public String getwritedateWithFormat()throws Exception{
		SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		Date date = read.parse(review_wdate);
		SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일");
		String time = write.format(date);
		return time;
		
	}

}
