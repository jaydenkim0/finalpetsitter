package com.kh.petmily.service;

import java.util.Map;

import com.kh.petmily.entity.MemberDto;

public interface MemberService {
	
	void regist(MemberDto memberDto);
	
	MemberDto login(MemberDto memberDto);



}
