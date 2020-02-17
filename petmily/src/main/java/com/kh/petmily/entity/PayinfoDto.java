package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PayinfoDto {
	private int payinfo_no; 
	private String payname; // 금액 이름
	private int payment; // 금액

}