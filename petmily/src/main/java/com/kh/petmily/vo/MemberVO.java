package com.kh.petmily.vo;

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
public class MemberVO {

	private String id; 
	private String pw; 
	private String name; 
	private String nick;
	private String email;
	private String phone;
	private String post;
	private String basic_addr;
	private String extra_addr;
	private int point;
	private String grade;
	private String pets; // 반려동물 여부 '예', '아니오' 만 등록가능
	private String joindate;
	private String lastlogin;
	private String Privacy_agree; // 회원가입 개인정보 동의, 무조건 'true' 일때 만 가입가능
	private String terms_agree; // 회원 이용약관 동의, 무조건 'true' 일때 만 가입가능
	
	// 펫시터 넘버
	private int pet_sitter_no;
	
	// blacklist 사용시 추가 컨텐츠
	private int black_no;	
	private int black_count;
	
	// blackListContent 사용시 추가 컨텐츠
	private int blackListContent_no;
	private String black_content_id; // 아이디
	private String black_content_grade; // 아이디
	private String black_content; // 차단 이유
	private String black_wdate; // 차단 등록 일시
	
	
	// 회원 가입일
	public String getMemberdateWithFormat()throws Exception{
	      SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
	      Date date = read.parse(joindate);
	      SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일");
	      String time = write.format(date);
	      return time;
	   }
	
}
