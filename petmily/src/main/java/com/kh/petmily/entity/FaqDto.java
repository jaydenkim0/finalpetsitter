package com.kh.petmily.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FaqDto {
	
	private int faq_no;
	private String member_id; // member 테이블의 id
	private String faq_title; // 공지사항 타이틀
	private String faq_head;//공지사항 제목
	private String faq_content; // 관리자에게 문의 하는 내용
	private String wdate;//작성일자
	private String nick; //닉네임
}
