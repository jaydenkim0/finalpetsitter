package com.kh.petmily.service;


import java.util.Map;

import java.util.List;


import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.PetDto;

public interface MemberService {
	
	void regist(MemberDto memberDto);
	
	MemberDto login(MemberDto memberDto);
	
	//내정보조회
	MemberDto mylist(String id);
	
	//반려동물조회
	List<PetDto> mylistpet(String id);

	//최종로그인업데이트
	void updatelastlogin(String id);

	//아이디찾기
	String findid(MemberDto memberDto);

	void pwchange(MemberDto memberDto);


	void mylistchange(MemberDto memberDto);

	//펫등록
	void pet_regist(PetDto petDto);

	//아이디중복검사
	int userIdCheck(String user_id);

	//회원탈퇴처리
	void memberdelete(String id, String password);

}
