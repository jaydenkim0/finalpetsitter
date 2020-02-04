package com.kh.petmily.service;

import java.util.List;

import com.kh.petmily.entity.MemberDto;

public interface MemberService {
	
	void regist(MemberDto memberDto);
	
	MemberDto login(MemberDto memberDto);

	List<MemberDto> mylist(String id);



}
