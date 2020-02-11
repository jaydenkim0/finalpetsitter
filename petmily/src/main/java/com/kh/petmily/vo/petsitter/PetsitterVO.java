package com.kh.petmily.vo.petsitter;

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
public class PetsitterVO {

	// member
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
	
	//petsitter
	private int pet_sitter_no;
	private String sitter_id; // member 테이블의 id 
	private String info; // 소개글
	private String sitter_pets; // 반려동물 여부 '예', '아니오' 만 등록가능	
	private String sitter_status; // '정상' 또는 '휴면' 만등록가능	
	private String sitter_terms_agree; // 펫시터 이용약관 동의, 무조건 'true' 일때 만 가입가능
	private String sitter_joindate; // 시터 가입일
	private String sitter_matching_type; // '방문서비스', '위탁서비스', '둘다' 만 작성가능
	
	// blacklist 사용시 추가 컨텐츠
	private int black_no;
	private String black_id; // member 테이블의 id
	private String black_name; // member 의 이름 저장
	private String black_phone; // member 의 전화번호 저장
	private String black_grade; // member 의 등급 (회원 및 펫시터)	
	private int black_count; // 경고횟수
	
	// 블랙리스트 컨텐츠
	private int blackListContent_no;
	private String black_content_id; // 아이디
	private String black_content; // 차단 이유
	private String black_wdate; // 차단 등록 일시
	
	// 펫시터 가입일
	public String getPetsitterdateWithFormat()throws Exception{
	      SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
	      Date date = read.parse(sitter_joindate);
	      SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일");
	      String time = write.format(date);
	      return time;
	   }
	
	// 블랙리스트 등록일
	public String getBlackListdateWithFormat()throws Exception{
	      SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
	      Date date = read.parse(black_wdate);
	      SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일");
	      String time = write.format(date);
	      return time;
	   }
	
	

}
