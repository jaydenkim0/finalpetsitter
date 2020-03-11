package com.kh.petmily.entity;

import java.text.ParseException;
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
	
	private int size;//펫 마리수

	public String getPhoneWithFormat() {
		if(phone != null) {
			return phone.substring(0,3)+"-"+phone.substring(3,7)+"-"+phone.substring(7);
		}
		else {
			return"";
		}
	}
	
	public String getTotal_joindateWithFormat() throws ParseException {
		SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		Date date = read.parse(joindate);
		SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일");
		String time = write.format(date);
		return time;	
	}
	
	public String getMypage_joindateWithFormat() throws ParseException {
		SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		Date date = read.parse(joindate);
		SimpleDateFormat write = new SimpleDateFormat("y. M. d");
		String time = write.format(date);
		return time;	
	}
	
	public String getFinal_loginWithFormat() throws ParseException {
		if(lastlogin == null) {
			return "";
		}
		else{
			  SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
	            Date date = read.parse(lastlogin);
	            //변환한 형식을 다시 원하는 형식의 문자열로 변환
	            SimpleDateFormat write = new SimpleDateFormat("y년 M월 d일 E요일 HH시 mm분 ss초");
	            String time = write.format(date);
	            return time;
	    }
	}
	
	public String getMypage_loginWithFormat() throws ParseException {
		if(lastlogin == null) {
			return "";
		}
		else{
			  SimpleDateFormat read = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
	            Date date = read.parse(lastlogin);
	            //변환한 형식을 다시 원하는 형식의 문자열로 변환
	            SimpleDateFormat write = new SimpleDateFormat("y. M. d (E) HH:mm:ss");
	            String time = write.format(date);
	            return time;
	    }
	}
	
	public String getTotal_addr() {
		if(post != null && basic_addr != null && extra_addr != null) {
			return "{"+getPost()+"}"+" "+getBasic_addr()+" "+getExtra_addr();
		}
		else {
			return"";
		}
	}
	
}
