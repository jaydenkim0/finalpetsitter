package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReservationPayDto {

		private int payinfo_no;
		private int pay_reservation_no;
		private int usage_time;
		String start_time;
}
