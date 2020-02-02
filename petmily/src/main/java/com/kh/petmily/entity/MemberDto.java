package com.kh.petmily.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberDto {

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
	
}
