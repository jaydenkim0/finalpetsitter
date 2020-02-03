package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BlackListDto {

	private int black_no;
	private String black_id; // member 테이블의 id
	private String black_name; // member 의 이름 저장
	private String black_phone; // member 의 전화번호 저장
	private String black_grade; // member 의 등급 (회원 및 펫시터)
	private String black_content; // 차단 사유 등록
	private String black_wdate; // 차단 등록 일시
}
