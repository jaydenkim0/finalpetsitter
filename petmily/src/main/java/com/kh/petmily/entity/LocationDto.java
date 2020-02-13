package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LocationDto {
	private int location_no;
	private int location_sitter_no; // pet_sitter의 pet_sitter_no
	private String city; // 광역시
	private String area; // 자치구 및 구 저장할 공간
	private String getTotalLocal;//광역시 + 자치구 및 구

	public String getTotalLocal() {
		if(city != null && area != null) {
			return "{"+getCity()+"}"+""+getArea();
		}
		else{
		return "";
		}
	}
}