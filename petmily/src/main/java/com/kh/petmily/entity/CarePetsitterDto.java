package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CarePetsitterDto {
	
	private int care_board_no;
	private String care_member_id;
	private String sitter_id;
	private String care_board_content;
	private String care_pw;
	private String wdate;
	
}
