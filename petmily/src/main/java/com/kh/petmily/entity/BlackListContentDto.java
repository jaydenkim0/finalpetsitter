package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BlackListContentDto {

	private int blackListContent_no;
	private String black_content_id; // 아이디
	private String black_content; // 차단 이유
	private String black_wdate; // 차단 등록 일시
}
