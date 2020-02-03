package com.kh.petmily.repository;

import java.util.List;

import com.kh.petmily.entity.MemberDto;

public interface AdminDao {

	List<MemberDto> getMemberList(MemberDto memberDto);

	int getMtotal();

	int getPtotal();
	
	int getAtotal();

	
	

}
