package com.kh.petmily.service;


import java.util.Map;

import java.util.List;


import com.kh.petmily.entity.MemberDto;
import com.kh.petmily.entity.PetDto;

public interface MemberService {
	
	void regist(MemberDto memberDto);
	
	MemberDto login(MemberDto memberDto);

	MemberDto mylist(String id);

	List<PetDto> mylistpet(String id);

	void updatelastlogin(String id);

	void pwchange(MemberDto memberDto);



}
