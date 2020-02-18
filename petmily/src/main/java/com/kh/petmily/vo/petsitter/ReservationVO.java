package com.kh.petmily.vo.petsitter;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class ReservationVO {
	//예약
	private int reservation_no;
	private String member_id; 
	private int reservation_sitter_no; 
	private String matching_type; 
	private String matching_time; 
	private String pet_name; 
	private String ect; 
	private String status;
	
	//예약 금액
	private List<Integer> payinfo_no;
	private int pay_reservation_no;
	private int usage_time;
}
